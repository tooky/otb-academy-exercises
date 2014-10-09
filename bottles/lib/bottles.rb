class Bottles
  def verse(remaining)
    "#{remaining} bottles of beer on the wall, #{remaining} bottles of beer.\nTake one down and pass it around, #{remaining - 1} bottles of beer on the wall.\n"
  end
end
