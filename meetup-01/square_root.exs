defmodule SquareRoot do
  @threshold 0.00001
  @initial_guess 1.0

  def sqrt(x) do
    @initial_guess
    |> check_good_enough(x)
  end

  defp check_good_enough(guess, x) do
    (abs((guess * guess) - x) < @threshold)
    |> stop_or_continue(guess, x)
  end

  defp stop_or_continue(enough?, final_guess, _x) when enough? == true do
      final_guess
  end
  defp stop_or_continue(_enough?, guess, x) do
    improve(guess, x)
    |> check_good_enough(x)
  end

  defp improve(guess, x) do
    average(guess,(x / guess))
  end

  defp average(x, y), do: (x + y) / 2
end

