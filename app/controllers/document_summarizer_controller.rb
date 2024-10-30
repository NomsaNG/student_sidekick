require 'pdf-reader'
require 'combine_pdf'
require 'docx' # Ensure you require the docx gem if you haven't already

class DocumentSummarizerController < ApplicationController
  def index
    @summary = nil
  end

  def create
    uploaded_file = params[:document]

    begin
      reader = PDF::Reader.new(uploaded_file.tempfile)
      text = reader.pages.map(&:text).join("\n")
      @summary = summarize_text(text)
    rescue PDF::Reader::MalformedPDFError => e
      @summary = "Error reading PDF: #{e.message}"
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("summary_container", partial: "document_summarizer/summary", locals: { summary: @summary })
      end
      format.html { render :summary }
    end
  end

  private

  # Method to extract text from the uploaded file
  def extract_text_from_file(uploaded_file)
    case File.extname(uploaded_file.original_filename)
    when '.txt'
      uploaded_file.read # For plain text files
    when '.pdf'
      extract_text_from_pdf(uploaded_file) # Implement this method
    when '.docx'
      extract_text_from_docx(uploaded_file) # Implement this method
    else
      flash.now[:alert] = "Unsupported file type. Please upload a .txt, .pdf, or .docx file."
      return nil
    end
  end

  # Method to extract text from PDF files
  def extract_text_from_pdf(uploaded_file)
    begin
      uploaded_file.open do |file|
        reader = PDF::Reader.new(file) # Accessing tempfile directly
        reader.pages.map(&:text).join("\n")
      end
    rescue PDF::Reader::MalformedPDFError => e
      flash.now[:alert] = "Error reading the PDF file: #{e.message}"
      return nil
    end
  end

  # Method to extract text from DOCX files
  def extract_text_from_docx(uploaded_file)
    begin
      document = Docx::Document.open(uploaded_file.tempfile.path) # Ensure tempfile is used
      document.paragraphs.map(&:text).join("\n")
    rescue => e
      flash.now[:alert] = "Error reading the DOCX file: #{e.message}"
      return nil
    end
  end

  # Example summarization method
  def summarize_text(document_text)
    # Ensure document_text is a string and not nil before summarizing
    return nil if document_text.nil? || !document_text.is_a?(String) || document_text.empty?

    # Implement your summarization logic here
    # This is just a placeholder; adjust as needed
    document_text.summarize(ratio: 30)
  end
end
