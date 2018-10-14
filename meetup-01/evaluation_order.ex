defmodule EvaluationOrder do
  def p() do
    IO.puts("Evaluated p!")
  end

  def test(x, y) do
    if x == 0 do
      0
    else
      y
    end
  end
end

# What happens when we run:
# test(0, p)
