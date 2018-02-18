defmodule Inst do
  defstruct [:name, :line]
end

defmodule Day8 do

  def solve() do
    solve("day8_input.txt")
  end

  def solve(file) do

    try do
      :ets.delete(__MODULE__)
    rescue
      _ -> :ok
    end

    :ets.new(__MODULE__, [:ordered_set, {:keypos, 1}, :public, :named_table])

    file
    |> File.stream!([:utf8, :read], :line)
    |> Enum.map(&init/1)
    |> Enum.each(&operate/1)

    :ets.tab2list(__MODULE__)
    |> Enum.map(fn {_k, v} -> v end)
    |> Enum.max
  end

  defp init(line) do
    #kd inc 814 if zv <= -591
    [name|_] = String.split(line)
    :ets.insert(__MODULE__, {name, 0})
    %Inst{name: name, line: line |> String.trim_trailing}
  end

  def operate(%Inst{name: name, line: line}) do
    [_name, op, op_val, "if", cond_name, cond_op, cond_value] = String.split(line)
    [{_, cond_name_value}] = :ets.lookup(__MODULE__, cond_name)
    v = String.to_integer(cond_value)
    truth = 
      case cond_op do
	"<=" -> cond_name_value <= v
	"<" ->  cond_name_value < v
	">" -> cond_name_value > v
	">=" -> cond_name_value >= v
	"==" -> cond_name_value == v
	"!=" -> cond_name_value != v
      end
    case truth do
      true ->
	[{_, value}] = :ets.lookup(__MODULE__, name)
	new_value =
	  case op do
	    "inc" -> value + String.to_integer(op_val)
	    "dec" -> value - String.to_integer(op_val)
	  end
	:ets.insert(__MODULE__, {name, new_value})
      false ->
	:ok
    end
  end

end
