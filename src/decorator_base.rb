require './nameable.rb'

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize()
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    if @nameable.correct_name > 10
      @nameable.correct_name.slice(0,10)
    else
      @nameable.correct_name
    end
  end
end