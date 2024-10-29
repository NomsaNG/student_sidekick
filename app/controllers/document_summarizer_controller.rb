class DocumentSummarizerController < ApplicationController
  def index
    @summary = nil
  end

  def create
    document_text = params[:document_text]
    uploaded_file = params[:document]

    if document_text.blank? && uploaded_file.blank?
      flash.now[:alert] = "Please enter text or upload a document to summarize."
      return render :index
    end

    # Extract text from uploaded file if it exists
    if uploaded_file
      document_text = extract_text_from_file(uploaded_file)
    end

    # Assuming you have a method to summarize the text
    @summary = document_text.summarize(ratio: 30)

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
    # Ensure we're using the tempfile attribute
    reader = PDF::Reader.new(uploaded_file.tempfile) # Accessing tempfile directly
    reader.pages.map(&:text).join("\n")
  end

  # Method to extract text from DOCX files
  def extract_text_from_docx(uploaded_file)
    # Use a gem like 'docx' to extract text
    document = Docx::Document.open(uploaded_file.tempfile.path) # Ensure tempfile is used
    document.paragraphs.map(&:text).join("\n")
  end

  # Example summarization method
  def summarize_text(document_text)
    # Implement your summarization logic here
    # This is just a placeholder; adjust as needed
    document_text.summarize(ratio: 30)
  end
end
