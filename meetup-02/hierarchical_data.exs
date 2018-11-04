defmodule HierarchicalData do
  def square(x), do: x * x

  def map_list(list, _function) when length(list) == 0 do
    list
  end
  def map_list([head | tail], function) do
    [function.(head) | map_list(tail, function)]
  end
  # Enum.map(list, &square/1)

  def map_tree(list, _function) when length(list) == 0 do
    list
  end
  def map_tree([head | tail], function) when is_list(head) do
    [map_tree(head, function) | map_tree(tail, function)]
  end
  def map_tree([head | tail], function) do
    [function.(head) | map_tree(tail, function)]
  end

  def list_length(list, acc \\ 0)
  def list_length(list, acc) when list == [], do: acc
  def list_length([_head | tail], acc) do
    list_length(tail, acc + 1)
  end

  def count_leaves(list, acc \\ 0)
  def count_leaves(list, acc) when list == [], do: acc
  def count_leaves([head | tail], acc) when is_list(head) do
    count_leaves(tail, acc + count_leaves(head))
  end
  def count_leaves([_head | tail], acc) do
    count_leaves(tail, acc + 1)
  end

end

