class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each { |item| update_item(item) }
  end

  private

  def update_item(item)
    return if legendary_item?(item)

    quality = quality_change(item)
    item.sell_in -= 1
    item.quality = (item.quality + quality).clamp(0..50)
  end

  def legendary_item?(item)
    item.name === 'Sulfuras, Hand of Ragnaros'
  end

  def aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def backstage_pass?(item)
    item.name == 'Backstage passes to a TAFKAL80ETC concert'
  end

  def quality_change(item)
    return aged_brie_change(item) if aged_brie?(item)
    return backstage_pass_change(item) if backstage_pass?(item)

    normal_item_change(item)
  end

  def backstage_pass_change(item)
    return -item.quality if item.sell_in <= 0
    # order is important here
    return 3 if item.sell_in <= 5
    return 2 if item.sell_in <= 10

    1
  end

  def aged_brie_change(item)
    item.sell_in <= 0 ? 2 : 1
  end

  def normal_item_change(item)
    item.sell_in <= 0 ? -2 : -1
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
