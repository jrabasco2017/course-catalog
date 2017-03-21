class Search < ApplicationRecord
  def self.search(search, search_column)
    theEntries = Search.all
    indicOne =0
    indicTwo =0
    if search.present?
      theEntries =  theEntries.where(["key LIKE ?", "%#{search}%"])
    else
      indicOne=1
    end
    theEntries =  theEntries.where(["linked LIKE ?", "%#{search_column}%"])
    return theEntries
  end
end
