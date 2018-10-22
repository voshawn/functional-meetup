defmodule Conditionals do
  def abs_cond(x) do
    cond do
      x >= 0 ->
        x
      x < 0 ->
        -x
    end
  end

  def abs_case(x) do
    case x do
      x when x >= 0 ->
        x
      _ ->
        -x
    end
  end

  def abs_if(x) do
    if x < 0, do: -x, else: x
  end

  def abs_guard(x) when x >= 0, do: x
  def abs_guard(x), do: -x
end

