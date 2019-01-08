defmodule Bank do
  use Agent

  def make_account(balance) do
    {:ok, pid} = Agent.start_link(fn -> balance end)
    pid
  end

  def withdraw(account, amount) do
    get_balance(account)
    |> attempt_withdraw(amount, account)
    get_balance(account)
  end

  def attempt_withdraw(balance, amount, _account) when balance < amount do
    IO.puts("Insufficient Funds")
  end

  def attempt_withdraw(balance, amount, account) do
    set_balance(account, balance - amount)
  end

  def set_balance(account, balance) do
    Agent.update(account, fn(_x) -> balance end)
  end

  def get_balance(account) do
    Agent.get(account, &(&1))
  end
end

