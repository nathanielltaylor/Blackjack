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
