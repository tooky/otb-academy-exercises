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
    case remaining
    when 0
      "#{count(remaining).capitalize} #{ subject(remaining) } of beer on the wall, no more #{ subject(remaining) } of beer.\n" <<
        "#{action(remaining)}, #{count(remaining_next)} #{ subject(remaining_next) } of beer on the wall.\n"
    else
      "#{count(remaining).capitalize} #{ subject(remaining) } of beer on the wall, #{count(remaining)} #{ subject(remaining) } of beer.\n" <<
        "#{action(remaining)}, #{count(remaining_next)} #{ subject(remaining_next) } of beer on the wall.\n"
    end
  end

  def next_remaining(remaining)
    if remaining.zero?
      99
    else
      remaining - 1
    end
  end

  def subject(remaining)
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

  def pronoun(remaining)
    if remaining == 1
      "it"
    else
      "one"
    end
  end

  def action(remaining)
    if remaining.zero?
      "Go to the store and buy some more"
    else
      "Take #{pronoun(remaining)} down and pass it around"
    end
  end
end
