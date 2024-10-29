class PlagiarismCheckerController < ApplicationController
  def check
    text = params[:text]
    urls = params[:urls] || []
    checker = PlagiarismCheckerService.new
    @results = checker.check_plagiarism(text, urls)

    respond_to do |format|
      format.html { render json: @results } # Render the JSON directly
      format.json { render json: @results }
    end
  end


  def index
    @results = [] # Initialize @results to an empty array for the index view
  end

  private

  def plagiarism_check(text)
    # Call your API or perform the checking logic here
    # Return results as an array of hashes or nil if no results
  end
end
