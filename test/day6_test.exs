defmodule Day6Test do
  use ExUnit.Case
  #doctest Adventofcode2017

  test "day6" do
    # example
    assert 5 == Day6.solve([0, 2, 7, 0])
    # input
    assert 5042 == Day6.solve([5, 1, 10, 0, 1, 7, 13, 14, 3, 12, 8, 10, 7, 12, 0, 6])
  end
end
