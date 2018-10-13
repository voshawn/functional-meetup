defmodule Abstractions do
  # Defining functions
  def sum(a, b) do
    a + b
  end

  def square(x) do
    x * x
  end

  def sum_of_squares(x, y) do
    # Substitution Model
    sum(square(x), square(y))
  end
end
