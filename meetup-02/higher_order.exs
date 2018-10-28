defmodule Summation do
  def sum(_term, a, _next, b) when a > b, do: 0

  def sum(term, a, next, b) do
    #  need to call with dot
    term.(a) + sum(term, next.(a), next, b)
  end

  def sum_of_cubes(a, b) do
    # Capture syntax
    sum(&cube/1, a, &inc/1, b)
  end

  def sum_of_integers(a, b) do
    sum(&identity/1, a, &inc/1, b)
  end

  defp cube(x), do: x * x * x

  defp identity(x), do: x

  defp inc(x), do: x + 1

  def pi_sum(a, b) do
    # Example using anonymous functions (lambda)
    sum(fn x -> 1 / (x * (x + 2)) end, a, fn x -> x + 4 end, b)
  end
end

