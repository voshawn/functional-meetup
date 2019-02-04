# Aldric's Example
defmodule BankAccount do
  use GenServer

  def init(amount) do
    {:ok, %{balance: amount}}
  end

  def handle_call({:withdraw, b}, _from, %{balance: a} = state) when a - b < 0 do
    {:reply, "no can do", state}
  end

  def handle_call({:withdraw, amount}, _from, state) do
    new_amount = state.balance - amount
    {:reply, new_amount, %{balance: new_amount}}
  end
end
# {:ok, pid} = GenServer.start_link(BankAccount, 100)
# GenServer.call(pid, {:withdraw, 25})
#
# You can't share state with Genservers?
# You can't process a GenServer (actor?) concurrently? 
