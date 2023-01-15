require 'spec-helper'
require_relative '../lib/stock-picker.rb'

RSpec.describe 'Stock-Picker Algorithm Test' do

  describe 'Stock-Picker Algorithm - Normal tests' do
		it 'Test if able to calculate profit for 9 prices' do
			prices = [17,3,6,9,15,8,6,1,10]
      expected = [1, 4]
      expect(stock_picker(prices)).to eq(expected)
    end
    
    it 'Test if able to calculate profit for 14 prices' do
			prices = [17,3,6,9,15,8,6,1,10,4,5,4,8,6]
      expected = [1, 4]
      expect(stock_picker(prices)).to eq(expected)
    end

    it 'Test if able to calculate profit for 14 prices' do
			prices = [17,7,6,9,15,8,6,1,12,4,5,4,8,6]
      expected = [7, 8]
      expect(stock_picker(prices)).to eq(expected)
    end

		it 'Test if able to calculate profit for extreme price days' do
			prices = [1,7,6,9,15,8,6,2,12,4,5,4,8,25]
      expected = [1, 13]
      expect(stock_picker(prices)).to eq(expected)
    end

  end

  describe 'Stock-Picker Algorithm - Abnormal test' do

    it 'Test if return nil for when the algorithm cannot detect a good profit' do
			prices = [7,6,5,4,3,2,1]
      expected = [nil, nil]
      expect(stock_picker(prices)).to eq(expected)
    end

    it 'Test if able to calculate profit for no peaks' do
			prices = [1,2,3,4,5,8,7]
      expected = [nil, nil]
      expect(stock_picker(prices)).to eq(expected)
    end

  end
end