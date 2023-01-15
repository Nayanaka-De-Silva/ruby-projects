require 'spec-helper'
require_relative '../lib/bubble.rb'

RSpec.describe 'Bubble Sort Algorithm Test' do

  describe 'Basic Sort' do
    it 'return sorted array' do
      expect(bubble_sort([1, 4, 6, 2, 5])).to eq([1, 2, 4, 5, 6])
    end

    it 'return another sorted array' do
      expect(bubble_sort([4,3,78,2,0,2])).to eq([0,2,2,3,4,78])
    end
  end

  describe 'Best Case Scenario' do
    it 'return array as the same' do
      expect(bubble_sort([1, 2, 4, 5, 7, 99])).to eq([1, 2, 4, 5, 7, 99])
    end
  end

  describe 'Worst Case Scenario' do
    it 'return array as the same' do
      expect(bubble_sort([32, 22, 14, 12, 7, 1])).to eq([1, 7, 12, 14, 22, 32])
    end
  end
end
