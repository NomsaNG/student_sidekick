class BibliographyWritersController < ApplicationController
  def change
    create_table :bibliography_writers do |t|
      t.string :citation_style
      t.string :source
      t.string :author
      t.date :publication_date

      t.timestamps
    end
  end

  def new
    @bibliography_writer = BibliographyWriter.new
  end

  def index
    @bibliography_writers = BibliographyWriter.all
  end

  def create
    @bibliography_writer = BibliographyWriter.new(bibliography_writer_params)

    if @bibliography_writer.save
      redirect_to bibliography_writer_path(@bibliography_writer), notice: 'Citation was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @bibliography_writer = BibliographyWriter.find(params[:id])
  end

  private

  def bibliography_writer_params
    params.require(:bibliography_writer).permit(:citation_style, :source, :author, :publication_date)
  end
end
