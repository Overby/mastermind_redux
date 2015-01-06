class Messages
  def self.call
    {
      :welcome => "Welcome to MASTERMIND\n",
      :intro => "Would you like to (p)lay, read the (i)nstructions, or (q)uit?",
      :rules => "See Mastermind website for rules.",
      :play => "I have generated a beginner sequence with four elements made up
      \nof: (r)ed,(g)reen, (b)lue, and (y)ellow. Choose four characters. Use\n
       (q)uit at any time to end the game. What's your guess?",
      :quitting => "Thanks for playing!",
      :too_short => "That is too short. Try again.",
      :too_long => "That is too long. Try again.",
      :valid_characters => "Pick the right characters: red, blue, green, yellow."
    }
  end

end
