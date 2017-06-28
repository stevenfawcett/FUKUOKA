require 'trello'

class HPtrello

  def initialize( pConfig  )

    Trello.configure do |config|
          config.developer_public_key =  pConfig[ 'public_key' ]
          config.member_token = pConfig[ 'member_token' ]
    end

    @@me = Trello::Member.find( pConfig[ 'member_name'] )
    @@client = @@me.client
    @@config  = pConfig
    @@board = GetBoardByName( pConfig[ 'board']  )

   end

  def createCard( trello_card_params )

       labs = [];

       cards = @@board.cards(:filter => :open)
       card = cards.select { |f| f.name  == trello_card_params[:name] }

       if not trello_card_params[:environment].empty?
              e_label = @@board.labels.select { |f| f.name  ==  trello_card_params[:environment]}.first
       end

       if not trello_card_params[:priority].empty?
              p_label = @@board.labels.select { |f| f.name  ==  trello_card_params[:priority]}.first
       end

       if labs.count > 2 
         labs_list = labs.join(',')
       elsif  labs.count > 1
	 labs_list = labs[0]
       else
         labs_list = ""
       end

       if card.any?
             Rails.logger.info "Found Open Card with Same Message"
             return 0
       else
             Rails.logger.info "New Card Needed "
             list = @@board.lists.first
             Trello::Card.create(name: trello_card_params[:name], 
                                 desc: trello_card_params[:description], 
                                 list_id: list.id , card_labels: labs_list )
             return 1
       end

        return -1
  end


  def GetBoardByName(  name )
     @@me.boards.each do | board |
         if board.name == name
            return board
         end
     end
     return nil
  end

end
