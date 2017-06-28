class TrelloCard < ApplicationRecord
  include Filterable
  enum priority:    { Low: 1, Medium: 2, High: 3 }
  enum environment: { Development: 1, Test: 2, Production: 3 }
  enum message_type: { Incident: 1, Audit: 2, Change: 3 }

  after_initialize :init
  validates_uniqueness_of :name
  
    validates :priority,
              :inclusion  => { :in => [ 'High', 'Medium', 'Low'], :message  => "%{value} is not a valid Priority" },
              :presence   => { :message  => "A Priority Must be set" }

    validates :environment,
              :inclusion  => { :in => [ 'Development', 'Test', 'Production'], :message  => "%{value} is not a valid Environment" },
              :presence   => { :message  => "A Environment Must be set" }

    validates :message_type,
              :inclusion  => { :in => [ 'Incident', 'Audit', 'Change'], :message  => "%{value} is not a valid Message Type" },
              :presence   => { :message  => "A Message Type Must be set" }
    def init
        self.priority      ||=  "Low"
        self.environment   ||=  "Development"
        self.message_type  ||=  "Incident"
    end 

end


#     add_column :trello_cards, :username, :string
#     add_column :trello_cards, :hostname, :string
#     add_column :trello_cards, :message_type, :integer
#     add_column :trello_cards, :datetime, :timestamp

