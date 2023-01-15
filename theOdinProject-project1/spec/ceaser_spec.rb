require 'spec-helper'
require_relative '../lib/ceaser.rb'

RSpec.describe 'Ceaser Cypher Test' do

  describe 'Ceaser Cypher - Normal tests' do

    it 'Test if can rotate by 5' do
      expect(ceaser_cipher("What a string!", 5)).to eq('Bmfy f xywnsl!')
    end
    
    it 'Test if can rotate by 3' do
      expect(ceaser_cipher("Ruby is pretty awesome", 3)).to eq('Uxeb lv suhwwb dzhvrph')
    end

    it 'Test if can rotate by -3' do
      expect(ceaser_cipher("Ruby is pretty awesome", -3)).to eq('Oryv fp mobqqv xtbpljb')
    end

  end

  describe 'Ceaser Cypher - Abnormal test' do

    it 'Test if can return the same string when rotations are 0' do
      expect(ceaser_cipher("What a string!", 0)).to eq('What a string!')
    end

  end
end
