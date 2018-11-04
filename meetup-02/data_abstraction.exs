defmodule Rational do
  def make_rat(n, d), do: [n, d]

  def numer([head | _tail]), do: head

  def denom([_head | [second | _]]), do: second

  def add_rat(x, y) do
    make_rat(numer(x) * denom(y) + numer(y) * denom(x),
             denom(x) * denom(y))
  end
end

