defmodule Factorial do
  def recursive(1), do: 1

  def recursive(n) do
    n * recursive(n-1)
  end

  def iterative(n) do
    fact_iter(1, 1, n)
  end

  defp fact_iter(product, counter, max) when counter > max do
    product
  end

  defp fact_iter(product, counter, max) do
    fact_iter( counter * product, counter + 1,  max)
  end
end

defmodule Fibonacci do
  def recursive(0), do: 0

  def recursive(1), do: 1

  def recursive(n) do
    recursive(n-1) + recursive(n-2)
  end

  def iterative(n) do
    fib_iter(1, 0, n)
  end

  def fib_iter(_a, b, 0), do: b

  def fib_iter(a, b, count) do
    fib_iter( a + b, a, count - 1) 
  end

end


defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end
#Benchmark.measure(fn  -> Factorial.recursive(100) |> IO.inspect end)
