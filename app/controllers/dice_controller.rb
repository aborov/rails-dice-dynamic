class DiceController < ApplicationController
  def home
    render({ :template => "home" })
  end

  def two_six
    @rolls = []

    2.times do
      die = rand(1..6)

      @rolls.push(die)
    end

    render({ :template => "two_six" })
  end

  def two_ten
    @rolls = []

    2.times do
      die = rand(1..10)

      @rolls.push(die)
    end
    render({ :template => "two_ten" })
  end

  def one_twenty
    @rolls = []

    1.times do
      die = rand(1..20)

      @rolls.push(die)
    end
    render({ :template => "one_twenty" })
  end

  def five_four
    @rolls = []

    5.times do
      die = rand(1..4)

      @rolls.push(die)
    end
    render({ :template => "five_four" })
  end

  def random
    dice_count = params[:sides].to_i
    sides_count = params[:dice].to_i

    if dice_count <= 0 || sides_count <= 0
      render ({ :template => "error" })
      return
    end

    @dice_result = roll_dice(sides_count, dice_count)
    render ({ :template => "roll" })
  end

  def roll_dice(dice_count, sides_count)
    dice_rolls = []
    dice_count.times do
      dice_rolls << rand(1..sides_count)
    end
    return { :dice => dice_count, :sides => sides_count, :rolls => dice_rolls }
  end
end
