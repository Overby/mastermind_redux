require_relative './messages'

class Gameplay   #was class Game
  attr_reader :stdin, :stdout

  def initialize(input_stream, output_stream)
    @stdin       = input_stream
    @stdout      = output_stream
    @turns       = 0
    #@ending_time = ending_time
    @start_time  = Time.new
  end

  def play
    stdout.puts Messages.call[:welcome]

    loop do
      stdout.puts Messages.call[:intro]
      input = stdin.gets.chomp
      if input == 'q' || input == 'quit'
        stdout.puts Messages.call[:quitting]
        return
      elsif input == 'i' || input == 'instructions'
        puts Messages.call[:rules]
      else input == 'p' || input == 'play'
        start_guessing
      end
    end
  end

  def start_guessing
    puts Messages.call[:play]
    puts "Your starting time is #{@start_time}."
    loop do
      input = gets.chomp.downcase

      if input == 'q' || input =='quit'
        stdout.puts Messages.call[:quitting]
        return
      elsif input.chars.count < 4
        stdout.puts Messages.call[:too_short]
      elsif input.chars.count > 4
        stdout.puts Messages.call[:too_long]
      elsif input.scan(/[^rgby]/).count > 0
        stdout.puts Messages.call[:valid_characters]
      elsif input == "rrgb"
        puts "Correct! Your ending time is #{ending_time}."
        return
      else
        puts "You've taken #{turn_counter} guesses."
        #How many letters are correct?
        #How many letters are in the right position?
        position_count = 0
        answer = 'rrgb'

        if input.chars[0] == answer.chars[0]
          position_count += 1
        elsif input.chars[1] == answer.chars[1]
          position_count += 1
        elsif input.chars[2] == answer.chars[2]
          position_count += 1
        else input.chars[3] == answer.chars[3]
          position_count += 1
        end
        correct_count = 0
        input.chars.each do |letter|
          index = answer.chars.find_index(letter)
          if index
            answer.chars.delete_at(index)
            correct_count += 1
          end

        end
          puts "'#{input}' has #{correct_count} of the correct elements with
          #{position_count} in the correct positions."
      end
    end
  end

  def ending_time
    Time.new
  #   Time.now.strftime("%H:%M:%S")
  end

  def turn_counter
    @turns += 1
  end
end
  # def time_seconds
  #   Time.new % 60
  # end


   #def end_time_integer
  #   (@ending_time.gsub(/:/, "").to_i
   #end
  #
  # def start_time_integer
  #      @start_time.gsub(/:/, "").to_i))
  # end

  # def start_time
  #   Time.now.strftime("%H:%M:%S")
   # end
  #
