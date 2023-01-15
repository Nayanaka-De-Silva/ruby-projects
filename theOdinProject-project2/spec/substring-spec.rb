require 'spec-helper'
require_relative '../lib/substring.rb'

RSpec.describe 'Substring Algorithm Test' do

  describe 'Substring Algorithm - Normal tests' do
		dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

    it 'Test if able to search 1 word string' do
			expected = {"below" => 1, "low"=>1}
      expect(substring("below", dictionary)).to eq(expected)
    end
    
    it 'Test if able to search multi-word string' do
			expected = { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
      expect(substring("Howdy partner, sit down! How's it going?", dictionary)).to eq(expected)
    end

    it 'Test if can read through various puntuation' do
			expected = {"how" => 1, "down" => 1, "i" => 1, "own" => 1}
      expect(substring("Wow! This.Is.Pretty.Cool, how down now cow hahaha", dictionary)).to eq(expected)
    end

		it 'Test if can detect same word multiple times' do
			expected = {"how" => 3, "down" => 2, "going" => 2, "low" => 2, "go" => 2, "i" => 2, "own" => 2}
      expect(substring("How down going going how low how down low", dictionary)).to eq(expected)
    end

  end

  describe 'Substring Algorithm - Abnormal test' do
		dictionary1 = ["Hello"]
		dictionary2 = []

    it 'Test if can return empty hash, on empty input' do
			expected = {}
      expect(substring("", dictionary1)).to eq(expected)
    end

		it 'Test if can return empty hash, on empty dictionary' do
			expected = {}
      expect(substring("Hello", dictionary2)).to eq(expected)
    end

  end
end