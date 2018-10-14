defmodule SquareRoot do
  @threshold 0.00001
  @initial_guess 1.0

  def sqrt(x) do
    sqrt_iter(@initial_guess, x)
  end

  defp sqrt_iter(guess, x) do
    if good_enough?(guess, x) do
      guess
    else
      sqrt_iter(improve(guess, x), x)
    end
  end

  defp good_enough?(guess, x) do
    abs((guess * guess) - x) < @threshold
  end

  defp improve(guess, x) do
    average(guess,(x / guess))
  end

  defp average(x, y) do
    (x + y) / 2
  end
end

