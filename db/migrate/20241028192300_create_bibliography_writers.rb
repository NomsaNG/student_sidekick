class CreateBibliographyWriters < ActiveRecord::Migration[7.1]
  def change
    create_table :bibliography_writers do |t|
      t.string :citation_style
      t.string :source
      t.string :author
      t.date :publication_date

      t.timestamps
    end
  end
end
