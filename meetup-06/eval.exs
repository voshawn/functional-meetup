defmodule Evaluator do

  def is_literal(expr), do: !is_tuple(expr)

  def is_symbol({label, _, _}), do: label === :var!

  def lookup_symbol({:var!, _, [{symbol, _, _}]}, env), do: env[symbol]

  def is_if({label, _, _}), do: label === :if

  def eval_if({:if, _ , [predicate , action]}, env) do
    if eval(predicate, env), do: eval(action[:do], env), else: eval(action[:else], env)
  end

  def is_custom_function({label, _, _}), do: label === :function

  def extract_function({operator, [context: Elixir, import: Kernel], _}), do: operator

  def extract_function({{:., [], [{:__aliases__, _, [module]}, function ]}, _, _}) do
    full_module = String.to_atom("Elixir."<> Atom.to_string(module))
    {:function, full_module, function}
  end

  def extract_arguments({_, _, args}), do: args

  def my_apply(operator, args) when is_atom(operator) do
    case operator do
      :+ -> Enum.at(args, 0) + Enum.at(args, 1)
      :- -> Enum.at(args, 0) - Enum.at(args, 1)
      :/ -> Enum.at(args, 0) / Enum.at(args, 1)
      :=== -> Enum.at(args, 0) === Enum.at(args, 1)
      _ -> "Invalid Operator"
    end
  end

  def my_apply({:function, module, function}, args)  do
    # Cheated here
    apply(module, function, args)
  end

  def eval_list(items, env) do
    Enum.map(items, fn x -> eval(x, env) end)
  end

  def eval(expr, env) do
    cond do
      is_literal(expr) -> expr
      is_symbol(expr) -> lookup_symbol(expr, env)
      is_if(expr) -> eval_if(expr, env)
      is_custom_function(expr) -> expr
      true ->
        func  = extract_function(expr)
        args = extract_arguments(expr)
        my_apply(eval(func, env), eval_list(args, env))
    end
  end

  def sum(a, b), do: a + b

end

# expr1 = quote do: var!(a) + var!(b)
# expr2 = quote do: Evaluator.sum(var!(a), var!(b))
# expr3 = quote do: if var!(a) === 0, do: 0, else: var!(b)
# env1 = [a: 1, b: 2]
# env2 = [a: 0, b: 2]
# Evaluator.eval(expr1, env1)
