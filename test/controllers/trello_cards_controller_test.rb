require 'test_helper'

class TrelloCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trello_card = trello_cards(:one)
  end

  test "should get index" do
    get trello_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_trello_card_url
    assert_response :success
  end

  test "should create trello_card" do
    assert_difference('TrelloCard.count') do
      post trello_cards_url, params: { trello_card: { description: @trello_card.description, name: @trello_card.name } }
    end

    assert_redirected_to trello_card_url(TrelloCard.last)
  end

  test "should show trello_card" do
    get trello_card_url(@trello_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_trello_card_url(@trello_card)
    assert_response :success
  end

  test "should update trello_card" do
    patch trello_card_url(@trello_card), params: { trello_card: { description: @trello_card.description, name: @trello_card.name } }
    assert_redirected_to trello_card_url(@trello_card)
  end

  test "should destroy trello_card" do
    assert_difference('TrelloCard.count', -1) do
      delete trello_card_url(@trello_card)
    end

    assert_redirected_to trello_cards_url
  end
end
