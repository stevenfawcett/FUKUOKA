module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
        self.all.where( filtering_params )
    end
  end
end
