#!/usr/bin/env ruby

# YOUR CODE HERE
require 'pry'
require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'hand.rb'
deck = Deck.new
deck.shuffle
player_hand = Hand.new(deck, 'player')
player_hand.prompt
dealer_hand = Hand.new(deck, 'dealer')
dealer_hand.dealer_hits
if (player_hand.score <= 21) && (dealer_hand.score <= 21)
  if (player_hand.score > dealer_hand.score)
    puts "Player wins!"
  elsif (player_hand.score < dealer_hand.score)
    puts "Dealer wins"
  else
    puts "Tie"
  end
end
