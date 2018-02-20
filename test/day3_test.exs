defmodule Day3Test do
  use ExUnit.Case
  #doctest Adventofcode2017

  alias Day3.Part1

  test "day3" do
    # examples
    assert 0 == Part1.solve(1)
    assert 3 == Part1.solve(12)
    assert 2 == Part1.solve(23)
    assert 31 == Part1.solve(1024)
    assert 480 == Part1.solve(347991)
    # input
    assert 475 == Part1.solve(277678)
  end
end
