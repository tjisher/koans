require File.expand_path(File.dirname(__FILE__) + '/neo')

# Implement a DiceSet Class here:
#
# class DiceSet
#   code ...
# end

class DiceSet
  #f roll int, .size(5).(1..6)
  #a values []
  attr_accessor :values

  def initialize
    @values = []
  end

  def roll (number_of_dice)
    @values = []
    return @values if number_of_dice < 1
    number_of_dice = 5 if number_of_dice > 5

    number_of_dice.times { @values << Random.rand(1..5) }
  end
end

class AboutDiceProject < Neo::Koan
  def test_can_create_a_dice_set
    dice = DiceSet.new
    assert_not_nil dice
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    dice = DiceSet.new

    dice.roll(5)
    assert dice.values.is_a?(Array), "should be an array"
    assert_equal 5, dice.values.size
    dice.values.each do |value|
      assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
    end
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    dice = DiceSet.new
    dice.roll(5)
    first_time = dice.values
    second_time = dice.values
    assert_equal first_time, second_time
  end

  def test_dice_values_should_change_between_rolls
    #Testing pRNG here is a fools errand, test to make sure RNG is being called at all
    dice = DiceSet.new
    dice2 = DiceSet.new

    dice.roll(5)
    first_time = dice.values
    dice2.roll(5)
    second_time = dice2.values

    assert_not_equal first_time, second_time,
      "First rolls of new Dice should not be equal"


    dice.roll(5)
    first_time = dice.values
    dice.roll(5)
    second_time = dice.values

    assert_not_equal [first_time, first_time.object_id], [second_time, second_time.object_id],
      "Two consecutive rolls should not be equal"

    # THINK ABOUT IT:
    #
    # If the rolls are random, then it is possible (although not
    # likely) that two consecutive rolls are equal.  What would be a
    # better way to test this?
  end

  def test_you_can_roll_different_numbers_of_dice
    dice = DiceSet.new

    dice.roll(3)
    assert_equal 3, dice.values.size

    dice.roll(1)
    assert_equal 1, dice.values.size
  end

end
