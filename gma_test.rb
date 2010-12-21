#!/usr/bin/env ruby
require "test/unit"
require 'stringio'
require_relative "guess_my_age"

class GuessMyAgeTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_15
    is = StringIO.new("yes\nyes\nyes\nyes\nno\nno\nno\n", "r")
    os = StringIO.new("", "w")
    actual = GuessMyAge.new(100).solve(is, os)
    expected = 15
    assert_equal(expected, actual)
  end

  def test_powers_of_2
    1.upto(6) do |count|
      po2 = 2**count
      is = get_string_io_for_power_of_two(po2)
      os = StringIO.new("", "w")
      actual = GuessMyAge.new(100).solve(is, os)
      assert_equal(po2, actual)
    end
  end

  def get_string_io_for_power_of_two(po2)
#    nos = ""
#    1.upto(po2-1) do
#      nos += "no\n"
#    end
#    response = (nos+"yes\n")
#    StringIO.new(response, "r")
    case po2
      when 2 then StringIO.new("no\nyes\nno\nno\nno\nno\nno\n", "r")
      when 4 then StringIO.new("no\nno\nyes\nno\nno\nno\nno\n", "r")
      when 8 then StringIO.new("no\nno\nno\nyes\nno\nno\nno\n", "r")
      when 16 then StringIO.new("no\nno\nno\nno\nyes\nno\nno\n", "r")
      when 32 then StringIO.new("no\nno\nno\nno\nno\nyes\nno\n", "r")
      when 64 then StringIO.new("no\nno\nno\nno\nno\nno\nyes\n", "r")
      else new StringIO.new("", "r")
    end
  end
end