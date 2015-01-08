require_relative './messages'

class Gameplay
  attr_reader :stdin, :stdout, :end_time, :start_time

  def initialize(input_stream, output_stream)
    @stdin       = input_stream
    @stdout      = output_stream
    @turns       = 0
    @start_time  = Time.now
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
      elsif input == "bbgb"
        puts "Correct! Your ending time is #{ending_time}."
        @end_time = Time.now
        return
      else
        puts "You've taken #{turn_counter} guess(es)."
        position_count = 0
        answer = 'bbgb'

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
      #    puts "'#{input}' has #{correct_count} of the correct elements with
      #    #{position_count} in the correct positions."
       end
    end
  end

  def ending_time
    Time.new
  end

  def turn_counter
    @turns += 1
  end

  def elapsed_time
    end_time - start_time
    #end_time.round.to_f(2) - start_time.round.to_f(2)
  
  end
end
