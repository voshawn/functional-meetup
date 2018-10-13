defmodule EvaluationOrder do
  def p() do
    IO.puts("Evaluated p!")
  end

  def test_if(x, y) do
    if x == 0 do
      0
    else
      y
    end
  end
end

