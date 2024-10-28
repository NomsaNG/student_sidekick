require "test_helper"

class PlagiarismCheckerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plagiarism_checker_index_url
    assert_response :success
  end
end
