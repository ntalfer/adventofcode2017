defmodule Day10Test do
  use ExUnit.Case
  #doctest Adventofcode2017

  test "example" do
    assert 12 == Day10.solve(0..4, [3, 4, 1, 5])
  end

  test "challenge" do
    assert 3770 == Day10.solve(0..255, [199,0,255,136,174,254,227,16,51,85,1,2,22,17,7,192])
  end
end
