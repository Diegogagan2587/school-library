require './nameable.rb'

class Decorator < Nameable
  attr_accessor :Nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end