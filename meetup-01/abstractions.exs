defmodule Abstractions do
  # Defining functions
  def sum(a, b), do: a + b
  def square(x), do: x * x

  def sum_of_squares(x, y) do
    # Substitution Model
    sum(square(x), square(y))
  end
end
