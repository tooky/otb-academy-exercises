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
    remains = Remaining.new(remaining)
    remains_next = Remaining.new(remains.next_remaining)

    "#{remains.count.capitalize} #{ remains.container } of beer on the wall, #{remains.count} #{ remains.container } of beer.\n" <<
      "#{remains.action}, #{remains_next.count} #{ remains_next.container } of beer on the wall.\n"
  end

  private

  class Remaining

    attr_reader :remaining

    def initialize(remaining)
      @remaining = remaining
    end

    def next_remaining
      if remaining.zero?
        99
      else
        remaining - 1
      end
    end

    def container
      case remaining
      when 1
        "bottle"
      else
        "bottles"
      end
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
    Remaining.new(remaining).next_remaining
  end

  def container(remaining)
    Remaining.new(remaining).container
  end

  def count(remaining)
    Remaining.new(remaining).count
  end

  def action(remaining)
    Remaining.new(remaining).action
  end

end
