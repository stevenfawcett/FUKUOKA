class Addcolumnstotrellocards < ActiveRecord::Migration[5.1]
  def change
      add_column :trello_cards, :username, :string 
      add_column :trello_cards, :hostname, :string 
      add_column :trello_cards, :message_type, :integer 
      add_column :trello_cards, :datetime, :timestamp 
  end
end
