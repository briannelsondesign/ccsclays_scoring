require 'test_helper'

class LeagueTest < ActiveSupport::TestCase

  test "requires a Sport to be set" do
    league = League.make
    assert league.valid?
    league.sport = nil
    refute league.valid?
  end

end
