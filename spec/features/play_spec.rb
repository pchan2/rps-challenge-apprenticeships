require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors

feature 'playing a game' do
  before do
    register
  end
  # As a marketer
  # So I can play a game
  # I want to see the shapes I can play
  scenario 'see the shape option' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end
  
  # As a marketer
  # So I can play a game
  # I want to choose the shapes I can play
  scenario 'choose a shape' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock!'
  end

  # As a marketer
  # So I can play a game
  # I want the game to choose an option
  scenario 'game chooses "Rock"' do
    click_button 'Rock'

    message = find(:css, '#opponent').text.strip # .strip will trim the spaces on either end

    expect(page).to have_content 'Opponent chose Rock!'
  end

  def possible_messages
    [:rock, :paper, :scissors].map { |shape| 'Opponent chose #{shape.to_s.captialize}!' }
  end
end
