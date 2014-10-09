class Bottles
  def sing
    verses(99,0)
  end

  def verses(start, finish)
    start.downto(finish).map { |remaining|
      verse(remaining) << "\n"
    }.join
  end

  def verse(remaining)
    remaining_next = next_remaining(remaining)
    "#{count(remaining).capitalize} #{ container(remaining) } of beer on the wall, #{count(remaining)} #{ container(remaining) } of beer.\n" <<
      "#{action(remaining)}, #{count(remaining_next)} #{ container(remaining_next) } of beer on the wall.\n"
  end

  private

  class Remaining

    attr_reader :remaining

    def initialize(remaining)
      @remaining = remaining
    end

    def count
      if remaining.zero?
        "no more"
      else
        remaining.to_s
      end
    end

    def action
      if remaining.zero?
        "Go to the store and buy some more"
      else
        "Take #{pronoun} down and pass it around"
      end
    end

    def pronoun
      if remaining == 1
        "it"
      else
        "one"
      end
    end

  end

  def next_remaining(remaining)
    if remaining.zero?
      99
    else
      remaining - 1
    end
  end

  def container(remaining)
    case remaining
    when 1
      "bottle"
    else
      "bottles"
    end
  end

  def count(remaining)
    if remaining.zero?
      "no more"
    else
      remaining.to_s
    end
  end

  def action(remaining)
    Remaining.new(remaining).action
  end

end
