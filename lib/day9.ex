defmodule Day9 do

  def solve() do
    "day9_input.txt"
    |> File.read!
    |> String.trim_trailing
    |> solve
  end

  def solve(input) do
    str1 = :re.replace(to_charlist(input), '!.', '', [:global, {:return, :list}])
    str2 = :re.replace(str1, '<[^>]*>', '', [:global, {:return, :list}])
    str3 = :re.replace(str2, '{,*}', '{}', [:global, {:return, :list}])
    score("#{str3}", 1, 0)
  end

  def score("", _, score), do: score
  def score("{" <> str, incr, score) do
    score = score+incr
    incr = incr+1
    score(str, incr, score)
  end
  def score("}" <> str, incr, score) do
    incr = incr-1
    score(str, incr, score)
  end
  def score("," <> str, incr, score) do
    score(str, incr, score)
  end

end
