defmodule EvaluationOrder do
  def p(), do: IO.puts("Evaluated p!")

  def test(x, _y) when x == 0, do: 0
  def test(_x, y), do: y
end

# What happens when we run:
# test(0, p)
