require './gameplay'  #was './game'
#require './messages'

  def start_guessing
    puts Messages.call[:play]

    loop do

    input = gets.chomp.downcase

    if input == 'q' || input =='quit'
      puts "Thanks for playing!"

      return
    elsif input.chars.count < 4
      puts "That is too short. Try again."
    elsif input.chars.count > 4
      puts "That is too long. Try again."
    elsif input == "rrgb"
      puts "Correct! Thanks for playing!"
      puts Time.new
      return
    else
      puts "You've taken one guess."
      #How many letters are correct?
      #How many letters in the right position?
      position_count = 0
      answer = 'rrgb'
      if input.chars[0] == answer.chars[0]
        position_count += 1
      elsif input.chars[1] == answer.chars[1]
        position_count += 1
      elsif input.chars[2] == answer.chars[2]
        position_count += 1
      elsif input.chars[3] == answer.chars[3]
        position_count += 1
      end
      # correct_count = 0
      # input.chars.each do |letter|
      #   index = answer.chars.find_index(letter)
      #   if index
      #     answer.chars.delete_at(index)
      #     correct_count += 1
      #   end
      end
end
