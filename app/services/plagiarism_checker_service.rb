require 'httparty'

class PlagiarismCheckerService
  include HTTParty
  base_uri 'http://localhost:3000'

  def check_plagiarism(text, urls = [])
    response = self.class.post('/check_plagiarism', body: { text: text, urls: urls }.to_json,
                                headers: { 'Content-Type' => 'application/json' })
    response.parsed_response
  end
end
