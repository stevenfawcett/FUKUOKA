class AddColumnsToTrelloCards < ActiveRecord::Migration[5.1]
  def change
    add_column :trello_cards, :priority, :string
    add_column :trello_cards, :environment, :string
  end
end
