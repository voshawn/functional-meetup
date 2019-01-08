defmodule ListQueue do
  def make(), do: []

  def insert(queue, item) do
    queue ++ [item]
  end

  def delete([]), do: raise("Empty Queue")

  def delete([_h|t]), do: t
end

defmodule FunctionalQueue do
  def make(), do: {[],[]}

  def insert({pop, push}, item) do
    {pop, [item | push]}
  end

  def delete({[],[]}), do: raise("Empty Queue")

  def delete({[], push}) do
    [_h|t] = Enum.reverse(push)
    {t, []}
  end

  def delete({[_h|t], push}), do: {t, push}
end

defmodule Benchmark do
  IEx.configure(inspect: [charlists: :as_lists])
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end

  def simulate(iterations, delete_probability, module) do
    queue = module.make()
    simulate(iterations, delete_probability, module, queue)
  end

  def simulate(0, _delete_probability, _module, queue), do: queue

  def simulate(iterations, delete_probability, module, queue) do
    queue = module.insert(queue, iterations)
    queue =
      if should_delete?(delete_probability), do: module.delete(queue), else: queue
    simulate(iterations-1, delete_probability, module, queue)
  end

  def should_delete?(delete_probability) do
    :rand.uniform() < delete_probability
  end
end

# Benchmark.measure(fn -> Benchmark.simulate(50000, 0.4, FunctionalQueue) end)
