# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/player'

RSpec.describe 'Player' do
  describe 'Basic Player Tests' do
    # CUT
    andy = Player.new('Andy', 'X')

    it 'Create a player' do
      expect(Player.new('Andy', 'X').name).to eq(andy.name)
    end

    it 'Create player with symbol X to player' do
      andy = Player.new('Andy', 'X')
      expect(andy.symbol).to eq('X')
    end
  end
end
