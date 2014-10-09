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
    remaining_next = remaining - 1
    case remaining
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" <<
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "#{count(remaining)} #{ subject(remaining) } of beer on the wall, #{count(remaining)} #{ subject(remaining) } of beer.\n" <<
        "Take it down and pass it around, #{count(remaining_next)} #{ subject(remaining_next) } of beer on the wall.\n"
    else
      "#{count(remaining)} #{ subject(remaining) } of beer on the wall, #{count(remaining)} #{ subject(remaining) } of beer.\n" <<
        "Take #{pronoun(remaining)} down and pass it around, #{count(remaining_next)} #{ subject(remaining_next) } of beer on the wall.\n"
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
end
