json.extract! trello_card, :id, :name, :description, :created_at, :updated_at , :environment , :priority
json.url trello_card_url(trello_card, format: :json)
