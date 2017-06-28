class CreateTrelloCards < ActiveRecord::Migration[5.1]
  def change
    create_table :trello_cards do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
