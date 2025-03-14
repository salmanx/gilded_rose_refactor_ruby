require 'minitest/autorun'
require_relative 'gilded_rose'

class GildedRoseTest < Minitest::Test
  def update_quality_for_days(gilded_rose, days)
    days.times { gilded_rose.update_quality }
  end

  def test_regular_item
    item = Item.new('+5 Dexterity Vest', 10, 20)
    gilded_rose = GildedRose.new([item])

    update_quality_for_days(gilded_rose, 1)
    assert_equal 9, item.sell_in
    assert_equal 19, item.quality

    update_quality_for_days(gilded_rose, 4)
    assert_equal 5, item.sell_in
    assert_equal 15, item.quality

    update_quality_for_days(gilded_rose, 5)
    assert_equal 0, item.sell_in
    assert_equal 10, item.quality

    update_quality_for_days(gilded_rose, 1)
    assert_equal(-1, item.sell_in)
    assert_equal 8, item.quality

    update_quality_for_days(gilded_rose, 4)
    assert_equal(-5, item.sell_in)
    assert_equal 0, item.quality
  end

  def test_aged_brie
    item = Item.new('Aged Brie', 2, 0)
    gilded_rose = GildedRose.new([item])

    update_quality_for_days(gilded_rose, 1)
    assert_equal 1, item.sell_in
    assert_equal 1, item.quality

    update_quality_for_days(gilded_rose, 1)
    assert_equal 0, item.sell_in
    assert_equal 2, item.quality

    update_quality_for_days(gilded_rose, 3)
    assert_equal(-3, item.sell_in)
    assert_equal 8, item.quality

    update_quality_for_days(gilded_rose, 5)
    assert_equal(-8, item.sell_in)
    assert_equal 18, item.quality

    update_quality_for_days(gilded_rose, 40)
    assert_equal(-48, item.sell_in)
    assert_equal 50, item.quality

    update_quality_for_days(gilded_rose, 5)
    assert_equal(-53, item.sell_in)
    assert_equal 50, item.quality
  end

  def test_sulfuras
    item = Item.new('Sulfuras, Hand of Ragnaros', 2, 0)
    gilded_rose = GildedRose.new([item])

    update_quality_for_days(gilded_rose, 1)
    assert_equal 2, item.sell_in
    assert_equal 0, item.quality

    update_quality_for_days(gilded_rose, 1)
    assert_equal 2, item.sell_in
    assert_equal 0, item.quality
  end

  def test_backstage_passes
    item = Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 15)
    gilded_rose = GildedRose.new([item])

    update_quality_for_days(gilded_rose, 1)
    assert_equal 19, item.sell_in
    assert_equal 16, item.quality

    update_quality_for_days(gilded_rose, 4)
    assert_equal 15, item.sell_in
    assert_equal 20, item.quality

    update_quality_for_days(gilded_rose, 6)
    assert_equal 9, item.sell_in
    assert_equal 27, item.quality

    update_quality_for_days(gilded_rose, 6)
    assert_equal 3, item.sell_in
    assert_equal 41, item.quality

    update_quality_for_days(gilded_rose, 2)
    assert_equal 1, item.sell_in
    assert_equal 47, item.quality

    update_quality_for_days(gilded_rose, 1)
    assert_equal 0, item.sell_in
    assert_equal 50, item.quality

    update_quality_for_days(gilded_rose, 1)
    assert_equal(-1, item.sell_in)
    assert_equal 0, item.quality
  end
end
