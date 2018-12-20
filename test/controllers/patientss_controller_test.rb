require 'test_helper'

class PatientssControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get patientss_new_url
    assert_response :success
  end

  test "should get show" do
    get patientss_show_url
    assert_response :success
  end

  test "should get index" do
    get patientss_index_url
    assert_response :success
  end

  test "should get destroy" do
    get patientss_destroy_url
    assert_response :success
  end

end
