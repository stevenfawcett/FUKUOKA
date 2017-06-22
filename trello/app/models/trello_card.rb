class TrelloCard < ApplicationRecord
  include Filterable

  after_initialize :init
  validates_uniqueness_of :name
  
    validates :priority,
              :inclusion  => { :in => [ 'High', 'Medium', 'Low'], :message  => "%{value} is not a valid Priority" },
              :presence   => { :message  => "A Priority Must be set" }

    validates :environment,
              :inclusion  => { :in => [ 'Development', 'Testing', 'Production'], :message  => "%{value} is not a valid Environment" },
              :presence   => { :message  => "A Environment Must be set" }
    def init
        self.priority  ||=  "Low"
        self.environment  ||=  "Development"
    end 
end
