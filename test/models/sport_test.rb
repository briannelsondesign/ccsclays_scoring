require 'test_helper'

class SportTest < ActiveSupport::TestCase

  test "requires a name" do
    sport = Sport.new
    refute sport.valid?
    sport.name = "Clay Shooting"
    assert sport.valid?
  end

end
