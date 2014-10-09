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
    case remaining
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" <<
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" <<
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "#{remaining} bottles of beer on the wall, #{remaining} bottles of beer.\n" <<
        "Take one down and pass it around, #{remaining - 1} bottle of beer on the wall.\n"
    else
      "#{remaining} #{ subject(remaining) } of beer on the wall, #{remaining} #{ subject(remaining) } of beer.\n" <<
        "Take one down and pass it around, #{remaining - 1} #{ subject(remaining - 1) } of beer on the wall.\n"
    end
  end

  def subject(remaining)
    "bottles"
  end
end
