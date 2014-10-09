class Bottles
  def verses(start, finish)
    start.downto(finish).map { |remaining|
      verse(remaining) << "\n"
    }.join
  end

  def verse(remaining)
    case remaining
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{remaining} bottles of beer on the wall, #{remaining} bottles of beer.\nTake one down and pass it around, #{remaining - 1} bottles of beer on the wall.\n"
    end
  end
end
