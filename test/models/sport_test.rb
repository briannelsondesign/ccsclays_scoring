require 'test_helper'

class SportTest < ActiveSupport::TestCase

  test "requires a name" do
    sport = Sport.make
    assert sport.valid?
    sport.name = nil
    refute sport.valid?
  end

end
