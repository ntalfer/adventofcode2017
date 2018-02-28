defmodule Day13 do

  def solve do
    layers =
      "day13_input.txt"
      |> File.stream!([:utf8, :read], :line)
      |> Enum.map(fn line ->
      [index, range] = String.split(line, [": ", "\n"], trim: true)
      {index, String.to_integer(range)}
    end)
      |> Enum.into(%{})
    max_index = 
	layers 
	|> Map.keys
	|> Enum.map(&String.to_integer/1)
	|> Enum.max
    move(0, layers, 0, max_index)
  end

  def move(pos, _, severity, max_index) when pos > max_index do
    severity
  end
  def move(pos, layers, severity, max_index) do
    range = layers["#{pos}"]
    if range == nil do
      # empty layer
      move(pos+1, layers, severity, max_index)
    else
      # get curr scan pos
      scan_pos = scan_pos(pos, range)
      if scan_pos == 0 do
	# caught
	move(pos+1, layers, severity + pos * range, max_index)
      else
	# not caught
	move(pos+1, layers, severity, max_index)
      end
    end
  end

  def scan_pos(t, range) do
    y = rem(t, 2*range-2)
    if y < range do
      y
    else
      2*range-2-y
    end
  end

end
