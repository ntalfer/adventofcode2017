defmodule Day9Test do
  use ExUnit.Case
  #doctest Adventofcode2017

  test "day9" do
    assert Day9.solve("{}") == 1
    assert Day9.solve("{{{}}}") == 6
    assert Day9.solve("{{},{}}") == 5
    assert Day9.solve("{{{},{},{{}}}}") == 16
    assert Day9.solve("{<a>,<a>,<a>,<a>}") == 1
    assert Day9.solve("{{<ab>},{<ab>},{<ab>},{<ab>}}") == 9
    assert Day9.solve("{{<!!>},{<!!>},{<!!>},{<!!>}}") == 9
    assert Day9.solve("{{<a!>},{<a!>},{<a!>},{<ab>}}") == 3
  end
end
