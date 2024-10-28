require "test_helper"

class DocumentSummarizerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get document_summarizer_index_url
    assert_response :success
  end
end
