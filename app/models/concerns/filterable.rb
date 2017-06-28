module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(params )
        list = self.all

        logger.debug "Time Period #{params[:time_period] } "

        if params[:time_period].present?
           if params[:time_period] == "H"
               list = list.where("created_at >= ?", Time.now - 1.hour)
           end
           if params[:time_period] == "D"
               list = list.where("created_at >= ?", Time.now - 1.day)
           end
           if params[:time_period] == "W"
               list = list.where("created_at >= ?", Time.now - 1.week)
           end
           if params[:time_period] == "M"
               list = list.where("created_at >= ?", Time.now - 1.month)
           end
           params = params.except( :time_period )
        end


        list.where( params )
    end

  end
end
