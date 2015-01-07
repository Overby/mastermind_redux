require_relative './gameplay'
class Mastermind
  def initialize
    Gameplay.new($stdin, $stdout).play
  end
end

Mastermind.new
#CodeGenerator.new.generate_colors
