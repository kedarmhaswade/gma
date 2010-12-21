#!/usr/bin/env ruby

class GuessMyAge
  attr_reader :limit, :bits

  def initialize(limit)
    @limit = limit
    @bits  = 0
    while limit > 0
      @bits += 1
      limit >>= 1
    end
  end

  # returns the grid in given array (a) such that all the numbers in given array have bth bit 1
  def grid(b, a)
    1.upto @limit do |age|
      a << age if (age[b] == 1)
    end
  end

  # displays the given array as a grid of given number of columns
  def display(a, cols, out=STDOUT)
    a.each_with_index do |item, index|
      out.printf("%3d ", item)
      out.printf("\n") if ((index + 1) % cols == 0)
    end
    out.puts "\n"
  end

  def solve(is=STDIN, os=STDOUT)
    age   = 0
    power = 1
    bits.times do |bit|
      os.puts "Is there any number that matches your age (y for yes, n for no)?"
      a = []
      grid(bit, a)
      display(a, 5, os)
      response = is.gets.chomp.downcase[0] == "y" ? 1 : 0
      age += response*power
      power *= 2
      os.puts "age so far = #{age}" if $DEBUG
    end
    age
  end
end
