class Hand
  attr_accessor :score

  def initialize(deck_name, player_name)
    @deck_name = deck_name
    @name = player_name
    @cards = []
    2.times do
      @cards << deck_name.draw(player_name)
    end
    score
    busted_or_not unless @name == 'dealer'
  end

  def prompt
    play = nil
    until score > 21 || play == 'stand'
      puts "Do you want to hit or stand?"
      play = gets.chomp.downcase
      if play == "hit"
        hit
        score
        busted_or_not
      elsif play == "stand"
        busted_or_not
      else
        puts "invalid input"
      end
    end
  end

  def busted_or_not
    if score > 21
      puts "#{@name}'s score is #{score}, #{@name} busts! "
        if @name == 'dealer'
          puts "You win!"
        elsif @name == 'player'
          puts "You lose!"
          abort
        end
    else
      puts "#{@name}'s score is #{score}"
    end
  end

  def hit
    @cards << @deck_name.draw(@name)
  end

  def score
    score_num ||= 0
    @cards.each do |card|
      if card.value == 'A'
          if (score_num + 11 > 21)
            score_num += 1
          else
            score_num += 11
          end
      elsif ['J','Q','K'].include?(card.value)
        score_num += 10
      else
        score_num += card.value
      end
    end
    score_num
  end

  def dealer_hits
    while score < 17
      hit
    end
    busted_or_not
  end

end
