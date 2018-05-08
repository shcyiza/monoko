json.extract! word, :id, :name, :is_fr, :is_li, :prononciation, :contributor_id, :source, :is_validated, :created_at, :updated_at
json.url word_url(word, format: :json)