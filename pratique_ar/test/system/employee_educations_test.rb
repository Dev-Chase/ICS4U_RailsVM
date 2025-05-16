require "application_system_test_case"

class EmployeeEducationsTest < ApplicationSystemTestCase
  setup do
    @employee_education = employee_educations(:one)
  end

  test "visiting the index" do
    visit employee_educations_url
    assert_selector "h1", text: "Employee Educations"
  end

  test "creating a Employee education" do
    visit employee_educations_url
    click_on "New Employee Education"

    check "Completed" if @employee_education.completed
    fill_in "Date obtained", with: @employee_education.date_obtained
    fill_in "Degree", with: @employee_education.degree
    fill_in "Employee", with: @employee_education.employee_id
    fill_in "Institution", with: @employee_education.institution
    click_on "Create Employee education"

    assert_text "Employee education was successfully created"
    click_on "Back"
  end

  test "updating a Employee education" do
    visit employee_educations_url
    click_on "Edit", match: :first

    check "Completed" if @employee_education.completed
    fill_in "Date obtained", with: @employee_education.date_obtained
    fill_in "Degree", with: @employee_education.degree
    fill_in "Employee", with: @employee_education.employee_id
    fill_in "Institution", with: @employee_education.institution
    click_on "Update Employee education"

    assert_text "Employee education was successfully updated"
    click_on "Back"
  end

  test "destroying a Employee education" do
    visit employee_educations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Employee education was successfully destroyed"
  end
end
