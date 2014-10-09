class Bottles
  def verse(remaining)
    if remaining == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    else
      "#{remaining} bottles of beer on the wall, #{remaining} bottles of beer.\nTake one down and pass it around, #{remaining - 1} bottles of beer on the wall.\n"
    end
  end
end
