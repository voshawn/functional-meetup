defmodule Derivative do

  def deriv(exp, var) do
    cond do
      number?(exp) ->
        0
      variable?(exp) ->
        if same_variable?(exp, var), do: 1, else: 0
      sum?(exp) ->
        make_sum(deriv(addend(exp), var), deriv(augend(exp), var))
      product?(exp) ->
        make_sum(make_product(multiplier(exp), deriv(multiplicand(exp), var)),
                 make_product(deriv(multiplier(exp), var), multiplicand(exp)))
      true -> IO.puts("Unknown Expression")
    end
  end

  defp number?(e) when is_number(e), do: true
  defp number?(_e), do: false

  defp variable?({_v1, [], Elixir}), do: true
  defp variable?(_e), do: false

  defp same_variable?({v1, _meta, Elixir}, {v1, _meta2, Elixir}), do: true
  defp same_variable?(_v1, _v2), do: false

  defp sum?({:+, _meta, _args}), do: true
  defp sum?(_e), do: false

  defp addend({:+, _meta, args }) do
    Enum.at(args, 0)
  end

  defp augend({:+, _meta, args }) do
    Enum.at(args, 1)
  end

  defp make_sum(a1, a2) when is_number(a1) and is_number(a2), do: a1 + a2
  defp make_sum(0, a2), do: a2
  defp make_sum(a1, 0), do: a1
  defp make_sum(a1, a2) do
    {:+, [context: Elixir, import: Kernel], [a1, a2]}
  end

  defp product?({:*, _meta, _args}), do: true
  defp product?(_e), do: false

  defp multiplier({:*, _meta, args }) do
    Enum.at(args, 0)
  end

  defp multiplicand({:*, _meta, args }) do
    Enum.at(args, 1)
  end

  defp make_product(m1, m2) when is_number(m1) and is_number(m2), do: m1 *  m2
  defp make_product(0, _m2), do: 0
  defp make_product(_m1, 0), do: 0
  defp make_product(1, m2), do: m2
  defp make_product(m1, 1), do: m1
  defp make_product(m1, m2) do
    {:*, [context: Elixir, import: Kernel], [m1, m2]}
  end

end

# Examples
# Derivative.deriv(quote do (x + 3) end, quote do x end)
# Derivative.deriv(quote do (x + x) end, quote do x end)
# Derivative.deriv(quote do (x * y) end, quote do x end)
# Derivative.deriv(quote do (x * y) *  (x + 3) end, quote do x end)
