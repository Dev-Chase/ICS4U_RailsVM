# Scenic

![Scenic Landscape](https://user-images.githubusercontent.com/152152/49344534-a8817480-f646-11e8-8431-3d95d349c070.png)

[![Build Status](https://github.com/scenic-views/scenic/actions/workflows/ci.yml/badge.svg)](https://github.com/scenic-views/scenic/actions/workflows/ci.yml)
[![Documentation Quality](http://inch-ci.org/github/scenic-views/scenic.svg?branch=master)](http://inch-ci.org/github/scenic-views/scenic)

Scenic adds methods to `ActiveRecord::Migration` to create and manage database
views in Rails.

Using Scenic, you can bring the power of SQL views to your Rails application
without having to switch your schema format to SQL. Scenic provides a convention
for versioning views that keeps your migration history consistent and reversible
and avoids having to duplicate SQL strings across migrations. As an added bonus,
you define the structure of your view in a SQL file, meaning you get full SQL
syntax highlighting in the editor of your choice and can easily test your SQL in
the database console during development.

Scenic ships with support for PostgreSQL. The adapter is configurable (see
`Scenic::Configuration`) and has a minimal interface (see
`Scenic::Adapters::Postgres`) that other gems can provide.

## So how do I install this?

If you're using Postgres, Add `gem "scenic"` to your Gemfile and run `bundle
install`. If you're using something other than Postgres, check out the available
[third party adapters](https://github.com/scenic-views/scenic#faqs).

## Great, how do I create a view?

You've got this great idea for a view you'd like to call `search_results`. You
can create the migration and the corresponding view definition file with the
following command:

```sh
$ rails generate scenic:view search_results
      create  db/views/search_results_v01.sql
      create  db/migrate/[TIMESTAMP]_create_search_results.rb
```

Edit the `db/views/search_results_v01.sql` file with the SQL statement that
defines your view. In our example, this might look something like this:

```sql
SELECT
  statuses.id AS searchable_id,
  'Status' AS searchable_type,
  comments.body AS term
FROM statuses
JOIN comments ON statuses.id = comments.status_id

UNION

SELECT
  statuses.id AS searchable_id,
  'Status' AS searchable_type,
  statuses.body AS term
FROM statuses
```

The generated migration will contain a `create_view` statement. Run the
migration, and [baby, you got a view going][carl]. The migration is reversible
and the schema will be dumped into your `schema.rb` file.

[carl]: https://www.youtube.com/watch?v=Sr2PlqXw03Y

```sh
$ rake db:migrate
```

## Cool, but what if I need to change that view?

Here's where Scenic really shines. Run that same view generator once more:

```sh
$ rails generate scenic:view search_results
      create  db/views/search_results_v02.sql
      create  db/migrate/[TIMESTAMP]_update_search_results_to_version_2.rb
```

Scenic detected that we already had an existing `search_results` view at version
1, created a copy of that definition as version 2, and created a migration to
update to the version 2 schema. All that's left for you to do is tweak the
schema in the new definition and run the `update_view` migration.

## What if I want to change a view without dropping it?

The `update_view` statement used by default will drop your view then create a
new version of it. This may not be desirable when you have complicated
hierarchies of dependent views.

Scenic offers a `replace_view` schema statement, resulting in a `CREATE OR
REPLACE VIEW` SQL query which will update the supplied view in place, retaining
all dependencies. Materialized views cannot be replaced in this fashion.

You can generate a migration that uses the `replace_view` schema statement by
passing the `--replace` option to the `scenic:view` generator:

```sh
$ rails generate scenic:view search_results --replace
      create  db/views/search_results_v02.sql
      create  db/migrate/[TIMESTAMP]_update_search_results_to_version_2.rb
```

The migration will look something like this:

```ruby
class UpdateSearchResultsToVersion2 < ActiveRecord::Migration
  def change
    replace_view :search_results, version: 2, revert_to_version: 1
  end
end
```

## Can I use this view to back a model?

You bet! Using view-backed models can help promote concepts hidden in your
relational data to first-class domain objects and can clean up complex
ActiveRecord or ARel queries. As far as ActiveRecord is concerned, a view is
no different than a table.

```ruby
class SearchResult < ApplicationRecord
  belongs_to :searchable, polymorphic: true

  # If you want to be able to call +Model.find+, you
  # must declare the primary key. It can not be
  # inferred from column information.
  # self.primary_key = :id

  # this isn't strictly necessary, but it will prevent
  # rails from calling save, which would fail anyway.
  def readonly?
    true
  end
end
```

Scenic even provides a `scenic:model` generator that is a superset of
`scenic:view`.  It will act identically to the Rails `model` generator except
that it will create a Scenic view migration rather than a table migration.

There is no special base class or mixin needed. If desired, any code the model
generator adds can be removed without worry.

```sh
$ rails generate scenic:model recent_status
      invoke  active_record
      create    app/models/recent_status.rb
      invoke    test_unit
      create      test/models/recent_status_test.rb
      create      test/fixtures/recent_statuses.yml
      create  db/views/recent_statuses_v01.sql
      create  db/migrate/20151112015036_create_recent_statuses.rb
```

## What about materialized views?

Materialized views are essentially SQL queries whose results can be cached to a
table, indexed, and periodically refreshed when desired. Does Scenic support
those? Of course!

The `scenic:view` and `scenic:model` generators accept a `--materialized`
option for this purpose. When used with the model generator, your model will
have the following method defined as a convenience to aid in scheduling
refreshes:

```ruby
def self.refresh
  Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
end
```

This will perform a non-concurrent refresh, locking the view for selects until
the refresh is complete. You can avoid locking the view by passing
`concurrently: true` but this requires both PostgreSQL 9.4 and your view to have
at least one unique index that covers all rows. You can add or update indexes for
materialized views using table migration methods (e.g. `add_index table_name`)
and these will be automatically re-applied when views are updated.

The `cascade` option is to refresh materialized views that depend on other
materialized views. For example, say you have materialized view A, which selects
data from materialized view B. To get the most up to date information in view A
you would need to refresh view B first, then right after refresh view A. If you
would like this cascading refresh of materialized views, set `cascade: true`
when you refresh your materialized view.

## I don't need this view anymore. Make it go away.

Scenic gives you `drop_view` too:

```ruby
def change
  drop_view :search_results, revert_to_version: 2
  drop_view :materialized_admin_reports, revert_to_version: 3, materialized: true
end
```

## FAQs

**Why do I get an error when querying a view-backed model with `find`, `last`, or `first`?**

ActiveRecord's `find` method expects to query based on your model's primary key,
but views do not have primary keys. Additionally, the `first` and `last` methods
will produce queries that attempt to sort based on the primary key.

You can get around these issues by setting the primary key column on your Rails
model like so:

```ruby
class People < ApplicationRecord
  self.primary_key = :my_unique_identifier_field
end
```

**Why is my view missing columns from the underlying table?**

Did you create the view with `SELECT [table_name].*`? Most (possibly all)
relational databases freeze the view definition at the time of creation. New
columns will not be available in the view until the definition is updated once
again. This can be accomplished by "updating" the view to its current definition
to bake in the new meaning of `*`.

```ruby
add_column :posts, :title, :string
update_view :posts_with_aggregate_data, version: 2, revert_to_version: 2
```

**When will you support MySQL, SQLite, or other databases?**

We have no plans to add first-party adapters for other relational databases at
this time because we (the maintainers) do not currently have a use for them.
It's our experience that maintaining a library effectively requires regular use
of its features. We're not in a good position to support MySQL, SQLite or other
database users.

Scenic *does* support configuring different database adapters and should be
extendable with adapter libraries. If you implement such an adapter, we're happy
to review and link to it. We're also happy to make changes that would better
accommodate adapter gems.

We are aware of the following existing adapter libraries for Scenic which may
meet your needs:

* [`scenic_sqlite_adapter`](<https://github.com/pdebelak/scenic_sqlite_adapter>)
* [`scenic-mysql_adapter`](<https://github.com/EmpaticoOrg/scenic-mysql_adapter>)
* [`scenic-sqlserver-adapter`](<https://github.com/ClickMechanic/scenic_sqlserver_adapter>)
* [`scenic-oracle_adapter`](<https://github.com/cdinger/scenic-oracle_adapter>)

Please note that the maintainers of Scenic make no assertions about the
quality or security of the above adapters.

**Related projects**

- [`fx`](<https://github.com/teoljungberg/fx>) Versioned database functions and
  triggers for Rails

## About

Scenic is used by some popular open source Rails apps:
[Mastodon](<https://github.com/mastodon/mastodon/>),
[Code.org](<https://github.com/code-dot-org/code-dot-org>), and
[Lobste.rs](<https://github.com/lobsters/lobsters/>).

Scenic is maintained by [Derek Prior], [Caleb Hearth], and you, our
contributors.

[Derek Prior]: http://prioritized.net
[Caleb Hearth]: http://calebhearth.com
