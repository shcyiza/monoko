class Search < ActiveRecord::Base
	def search_words
		Word.search_by_name(self.keywords)
	end
end
