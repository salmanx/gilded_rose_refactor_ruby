require 'rspec'

require File.join(File.dirname(__FILE__), 'gilded_rose')

RSpec.describe GildedRose do
  def update_quality_for_days(gilded_rose, days)
    days.times { gilded_rose.update_quality }
  end

  let(:gilded_rose) { GildedRose.new([item]) }

  describe('Regular item (name: +5 Dexterity Vest, sell_in: 10, quality: 20') do
    let(:item) { Item.new('+5 Dexterity Vest', 10, 20) }

    it 'After 1 day it should have sell_in 9, quality 19' do
      update_quality_for_days(gilded_rose, 1)
      expect(item).to have_attributes(sell_in: 9, quality: 19)
    end

    it 'After 5 days it should have sell_in 5, quality 15' do
      update_quality_for_days(gilded_rose, 5)
      expect(item).to have_attributes(sell_in: 5, quality: 15)
    end

    it 'After 10 days it should have sell_in 0, quality 10' do
      update_quality_for_days(gilded_rose, 10)
      expect(item).to have_attributes(sell_in: 0, quality: 10)
    end

    it 'After 11 days it should have sell_in -1, quality 8' do
      update_quality_for_days(gilded_rose, 11)
      expect(item).to have_attributes(sell_in: -1, quality: 8)
    end

    it 'After 15 days it should have sell_in -5, quality 0' do
      update_quality_for_days(gilded_rose, 15)
      expect(item).to have_attributes(sell_in: -5, quality: 0)
    end
  end

  describe('Aged brie (name: Aged Brie, sell_in: 2, quality: 0') do
    let(:item) { Item.new('Aged Brie', 2, 0) }

    it 'After 1 day it should have sell_in 1, quality 1' do
      update_quality_for_days(gilded_rose, 1)
      expect(item).to have_attributes(sell_in: 1, quality: 1)
    end

    it 'After 2 days it should have sell_in 0, quality 2' do
      update_quality_for_days(gilded_rose, 2)
      expect(item).to have_attributes(sell_in: 0, quality: 2)
    end

    it 'After 5 days it should have sell_in -3, quality 8' do
      update_quality_for_days(gilded_rose, 5)
      expect(item).to have_attributes(sell_in: -3, quality: 8)
    end

    it 'After 10 days it should have sell_in -8, quality 18' do
      update_quality_for_days(gilded_rose, 10)
      expect(item).to have_attributes(sell_in: -8, quality: 18)
    end

    it 'After 50 days it should have sell_in -48, quality 50' do
      update_quality_for_days(gilded_rose, 50)
      expect(item).to have_attributes(sell_in: -48, quality: 50)
    end

    it 'After 55 days it should have sell_in -53, quality 50' do
      update_quality_for_days(gilded_rose, 53)
      expect(item).to have_attributes(sell_in: -51, quality: 50)
    end
  end

  describe('Sulfuras (name: Sulfuras, Hand of Ragnaros, sell_in: 2, quality: 0') do
    let(:item) { Item.new('Sulfuras, Hand of Ragnaros', 2, 0) }

    it 'After 1 day it should have sell_in 2, quality 0' do
      update_quality_for_days(gilded_rose, 1)
      expect(item).to have_attributes(sell_in: 2, quality: 0)
    end

    it 'After 2 days it should have sell_in 2, quality 0' do
      update_quality_for_days(gilded_rose, 2)
      expect(item).to have_attributes(sell_in: 2, quality: 0)
    end
  end

  describe('Backstage passes (name: Backstage passes to a TAFKAL80ETC concert, sell_in: 20, quality: 15') do
    let(:item) { Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 15) }

    it 'After 1 day it should have sell_in 19, quality 16' do
      update_quality_for_days(gilded_rose, 1)
      expect(item).to have_attributes(sell_in: 19, quality: 16)
    end

    it 'After 5 days it should have sell_in 15, quality 20' do
      update_quality_for_days(gilded_rose, 5)
      expect(item).to have_attributes(sell_in: 15, quality: 20)
    end

    it 'After 11 days it should have sell_in 9, quality 27' do
      update_quality_for_days(gilded_rose, 11)
      expect(item).to have_attributes(sell_in: 9, quality: 27)
    end

    it 'After 17 days it should have sell_in 3, quality 41' do
      update_quality_for_days(gilded_rose, 17)
      expect(item).to have_attributes(sell_in: 3, quality: 41)
    end

    it 'After 19 days it should have sell_in 1, quality 47' do
      update_quality_for_days(gilded_rose, 19)
      expect(item).to have_attributes(sell_in: 1, quality: 47)
    end

    it 'After 20 days it should have sell_in 0, quality 50' do
      update_quality_for_days(gilded_rose, 20)
      expect(item).to have_attributes(sell_in: 0, quality: 50)
    end

    it 'After 21 days it should have sell_in -1, quality 0' do
      update_quality_for_days(gilded_rose, 21)
      expect(item).to have_attributes(sell_in: -1, quality: 0)
    end
  end

  describe('Conjured (name: Conjured Mana Cake, sell_in: 20, quality: 15') do
    let(:item) { Item.new('Conjured Mana Cake', 20, 15) }

    it 'After 1 day it should have sell_in 19, quality 13' do
      update_quality_for_days(gilded_rose, 1)
      expect(item).to have_attributes(sell_in: 19, quality: 13)
    end

    it 'After 3 days it should have sell_in 17, quality 9' do
      update_quality_for_days(gilded_rose, 3)
      expect(item).to have_attributes(sell_in: 17, quality: 9)
    end

    it 'After 7 days it should have sell_in 13, quality 1' do
      update_quality_for_days(gilded_rose, 7)
      expect(item).to have_attributes(sell_in: 13, quality: 1)
    end

    it 'After 8 days it should have sell_in 12, quality 0' do
      update_quality_for_days(gilded_rose, 8)
      expect(item).to have_attributes(sell_in: 12, quality: 0)
    end

    it 'After 20 days it should have sell_in 0, quality 0' do
      update_quality_for_days(gilded_rose, 20)
      expect(item).to have_attributes(sell_in: 0, quality: 0)
    end
  end

  describe('Conjured (name: Conjured Mana Cake, sell_in: 5, quality: 30') do
    let(:item) { Item.new('Conjured Mana Cake', 5, 30) }

    it 'After 2 days it should have sell_in 3, quality 26' do
      update_quality_for_days(gilded_rose, 2)
      expect(item).to have_attributes(sell_in: 3, quality: 26)
    end

    it 'After 4 days it should have sell_in 1, quality 22' do
      update_quality_for_days(gilded_rose, 4)
      expect(item).to have_attributes(sell_in: 1, quality: 22)
    end

    it 'After 5 days it should have sell_in 0, quality 18' do
      update_quality_for_days(gilded_rose, 5)
      expect(item).to have_attributes(sell_in: 0, quality: 20)
    end

    it 'After 6 days it should have sell_in -1, quality 16' do
      update_quality_for_days(gilded_rose, 6)
      expect(item).to have_attributes(sell_in: -1, quality: 16)
    end

    it 'After 20 days it should have sell_in -15, quality 0' do
      update_quality_for_days(gilded_rose, 20)
      expect(item).to have_attributes(sell_in: -15, quality: 0)
    end
  end
end
