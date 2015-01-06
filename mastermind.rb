require_relative './gameplay'  #was './game'
class Mastermind
  def initialize
    Gameplay.new($stdin, $stdout).play
  end
end

Mastermind.new
