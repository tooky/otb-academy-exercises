class Bottles
  def sing
    verses(99,0)
  end

  def verses(start, finish)
    start.downto(finish).map { |verse_number|
      verse(verse_number) << "\n"
    }.join
  end

  def verse(verse_number)
    verse = verse_for(verse_number)
    next_verse = verse_for(verse.next_verse_number)

    "#{verse.count.capitalize} #{ verse.container } of beer on the wall, #{verse.count} #{ verse.container } of beer.\n" <<
      "#{verse.action}, #{next_verse.count} #{ next_verse.container } of beer on the wall.\n"
  end

  private

  def verse_for(verse_number)
    if verse_number.zero?
      Verse0.new(verse_number)
    else
      Verse.new(verse_number)
    end
  end

  class Verse

    attr_reader :verse_number

    def initialize(verse_number)
      @verse_number = verse_number
    end

    def next_verse_number
      verse_number - 1
    end

    def container
      case verse_number
      when 1
        "bottle"
      else
        "bottles"
      end
    end

    def count
      verse_number.to_s
    end

    def action
      "Take #{pronoun} down and pass it around"
    end

    def pronoun
      if verse_number == 1
        "it"
      else
        "one"
      end
    end

  end

  class Verse0 < Verse
    def action
      "Go to the store and buy some more"
    end

    def count
      "no more"
    end

    def next_verse_number
      99
    end
  end

end
