class BibliographyWriter < ApplicationRecord
  def formatted_citation
    case citation_style
    when 'mla'
      "#{author}. *#{source}*. #{publication_date}."
    else
      "#{author}. #{source}. #{publication_date}."
    end
  end
end
