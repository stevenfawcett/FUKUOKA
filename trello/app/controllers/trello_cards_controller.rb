require 'hptrello'

class TrelloCardsController < ApplicationController
  skip_before_action  :verify_authenticity_token


  # GET /trello_cards
  # GET /trello_cards.json
  def index
    @trello_cards = TrelloCard.all
  end

  # GET /trello_cards/1
  # GET /trello_cards/1.json
  def show
    @trello_cards = TrelloCard.all.filter( params.permit( :priority)  )
  end

  # GET /trello_cards/new
  def new
    @trello_card = TrelloCard.new
  end

  # GET /trello_cards/1/edit
  def edit
  end

  # POST /trello_cards
  # POST /trello_cards.json
  def create

    respond_to do |format|
          @trello_card = TrelloCard.new(trello_card_params)
         
          if @trello_card.save
            config = File.join(Rails.root, 'config', 'trello.yml')
            @tr = HPtrello.new(YAML.load_file( config  ))
            rval = @tr.createCard( trello_card_params )

            format.html { redirect_to trello_cards_url, notice: 'Trello card was successfully created.' }
            format.json { render :show, status: :created, location: @trello_card }
          else
            format.html { render :new }
            format.json { render json: @trello_card.errors, status: :unprocessable_entity }
          end
     end
  

  end

  # PATCH/PUT /trello_cards/1
  # PATCH/PUT /trello_cards/1.json
  def update
    respond_to do |format|
      if @trello_card.update(trello_card_params)
        format.html { redirect_to @trello_card, notice: 'Trello card was successfully updated.' }
        format.json { render :show, status: :ok, location: @trello_card }
      else
        format.html { render :edit }
        format.json { render json: @trello_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trello_cards/1
  # DELETE /trello_cards/1.json
  def destroy
    @trello_card.destroy
    respond_to do |format|
      format.html { redirect_to trello_cards_url, notice: 'Trello card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def trello_card_params
      params.require(:trello_card).permit(:name, :description, :environment, :priority)
    end
end
