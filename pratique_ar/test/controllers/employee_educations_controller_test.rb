require 'test_helper'

class EmployeeEducationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_education = employee_educations(:one)
  end

  test "should get index" do
    get employee_educations_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_education_url
    assert_response :success
  end

  test "should create employee_education" do
    assert_difference('EmployeeEducation.count') do
      post employee_educations_url, params: { employee_education: { completed: @employee_education.completed, date_obtained: @employee_education.date_obtained, degree: @employee_education.degree, employee_id: @employee_education.employee_id, institution: @employee_education.institution } }
    end

    assert_redirected_to employee_education_url(EmployeeEducation.last)
  end

  test "should show employee_education" do
    get employee_education_url(@employee_education)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_education_url(@employee_education)
    assert_response :success
  end

  test "should update employee_education" do
    patch employee_education_url(@employee_education), params: { employee_education: { completed: @employee_education.completed, date_obtained: @employee_education.date_obtained, degree: @employee_education.degree, employee_id: @employee_education.employee_id, institution: @employee_education.institution } }
    assert_redirected_to employee_education_url(@employee_education)
  end

  test "should destroy employee_education" do
    assert_difference('EmployeeEducation.count', -1) do
      delete employee_education_url(@employee_education)
    end

    assert_redirected_to employee_educations_url
  end
end
