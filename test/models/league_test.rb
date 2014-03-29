require 'test_helper'

class LeagueTest < ActiveSupport::TestCase

  describe "belongs_to(:sport)" do
    it "requires a Sport to be set" do
      league = League.make
      assert league.valid?
      league.sport = nil
      refute league.valid?
    end
  end

  describe "validates(:name)" do
    it "requires a name to be saved" do
      league = League.make
      assert league.valid?
      league.name = nil
      refute league.valid?
    end
  end

end
