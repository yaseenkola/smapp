require 'test_helper'

class StudentImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get student_imports_index_url
    assert_response :success
  end

end
