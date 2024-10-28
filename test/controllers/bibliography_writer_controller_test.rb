require "test_helper"

class BibliographyWriterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bibliography_writer_index_url
    assert_response :success
  end
end
