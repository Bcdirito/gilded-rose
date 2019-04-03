class GildedRose
  attr_accessor :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def improve_quality(amt)
    @quality += amt
  end

  def diminish_quality(amt)
    @quality -= amt
  end

  def remove_days(amt)
    @days_remaining -= amt
  end

  def ticket_handler
    if @quality < 50
      if @days_remaining == 11
          improve_quality(1)
      elsif @days_remaining > 5
          improve_quality(2)
      elsif @days_remaining == 5
          improve_quality(3)
      elsif @days_remaining == 1
          improve_quality(3)
      else
        diminish_quality(@quality)
      end
    end
    remove_days(1)
  end

  def brie_handler
    if @quality < 50
      if @days_remaining > 0 && @quality <= 10
        improve_quality(1)
      elsif @days_remaining == 0 && @quality >= 40
        improve_quality(1)
      elsif @days_remaining == 0 && @quality <= 10
        improve_quality(2)
      elsif @days_remaining < 0 && @quality <= 10
        improve_quality(2)
      end
    end
    remove_days(1)
  end

  def ragnaros_maintainer
    @days_remaining = @days_remaining
    @quality = @quality
  end

  def mana_cake_handler
    if @days_remaining <= 0 && (@quality <= 10 && @quality > 0)
      diminish_quality(4)
    elsif @days_remaining > 0 && @quality > 0
      diminish_quality(2)
    end
      remove_days(1)
  end

  def normal_high_handler
    if @days_remaining > 0
      diminish_quality(1)
    elsif @days_remaining <= 0
      diminish_quality(2)
    end
    remove_days(1)
  end

  def tick
    if @name == "Backstage passes to a TAFKAL80ETC concert"
      ticket_handler
    elsif @name == 'Aged Brie'
      brie_handler
    elsif @name == "Sulfuras, Hand of Ragnaros"
      ragnaros_maintainer
    elsif @name == "Conjured Mana Cake"
      mana_cake_handler
    elsif @quality >= 10
      normal_high_handler
    else
      remove_days(1)
      @quality = 0
    end
  end


end