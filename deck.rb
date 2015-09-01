SUITS = ['♠','♥','♦','♣']
NUMBERS = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']
class Deck
  def initialize
    @card_array = []
    SUITS.each do |suit|
      NUMBERS.each do |value|
        @card_array << Card.new(value, suit)
      end
    end
  end
  def shuffle
    @card_array.shuffle!
  end
  def draw(player_name)
    card = @card_array.pop
    if player_name == 'player'
      puts "player was dealt #{card.value} of #{card.suit}!!!"
    end
    card
  end
end
