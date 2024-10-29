class DocumentSummarizer
  def initialize(text, language: 'en', ratio: 50, dictionary: nil)
    @text = text
    @language = language
    @ratio = ratio
    @dictionary = dictionary
  end

  def summarize
    options = { language: @language, ratio: @ratio }
    options[:dictionary] = @dictionary if @dictionary

    @text.summarize(options)
  end
end
