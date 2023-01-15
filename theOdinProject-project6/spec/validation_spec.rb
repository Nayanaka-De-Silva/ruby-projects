# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/validation'
require_relative '../lib/board'

RSpec.describe 'Validation' do
  include Validation

  describe 'Player can only Input 4 Possible values (R, G, B, Y)' do
    it '4 Correct values' do
      input = 'R B B Y'
      expect(check_if_valid_input(input)).to eq(true)
    end
  end
end
