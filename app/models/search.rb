class Search < ActiveRecord::Base
	def search_words
	   words = Word.all 
	   words = words.where("lower(name) like lower(?)", "%#{keywords}%") if keywords.present?
	   return words
	end
end
