class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :content
      t.string :nom
      t.string :titre
      t.string :slug
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
