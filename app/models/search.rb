class Search < ActiveRecord::Base
	def search_words
	   words = Word.all 
	   words = words.where("name like ?", "%#{keywords}%") if keywords.present?
	   return words
	end
end
