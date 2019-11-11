# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase # :nodoc:
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
