defmodule DwellingPuzzle do
  defstruct [:baker, :cooper, :fletcher, :miller, :smith]
  @possible_floors [1, 2, 3, 4, 5]

  def check_solution(solution) do
    distinct(solution) and
      solution.baker != 5 and
      solution.cooper != 1 and
      solution.fletcher != 5 and
      solution.fletcher != 1 and
      solution.miller > solution.cooper and
      abs(solution.smith - solution.fletcher) != 1 and
      abs(solution.fletcher - solution.cooper) != 1
  end

  defp distinct(solution) do
    total =
      solution
      |> Map.values()
      |> length()

    uniques =
      solution
      |> Map.values()
      |> MapSet.new()
      |> MapSet.size()

    total == uniques
  end

  def check_and_update(solution, parent, solution_state_pid) do
    IO.inspect(solution)

    if check_solution(solution) do
      Agent.update(solution_state_pid, fn _ -> :solved end)
      send(parent, {:solved, solution})
    end
  end

  def driver_loop(solution, parent, solution_state_pid) do
    status = Agent.get(solution_state_pid, fn state -> state end)

    case status do
      :try_again ->
        spawn(fn ->
          check_and_update(solution, parent, solution_state_pid)
          # Why doesn't this work after the spawn?
          get_next_solution(:unique)
          |> driver_loop(parent, solution_state_pid)
        end)

      :solved ->
        IO.puts("solved")
    end
  end

  def solve do
    init_solution = %DwellingPuzzle{baker: 1, cooper: 2, fletcher: 3, miller: 4, smith: 5}
    {:ok, init_solution_state} = Agent.start_link(fn -> :try_again end)
    driver_loop(init_solution, self(), init_solution_state)

    receive do
      {:solved, answer} -> IO.inspect({:solved, answer})
    end
  end

  def get_next_solution(:random) do
    %DwellingPuzzle{
      baker: Enum.random(@possible_floors),
      cooper: Enum.random(@possible_floors),
      fletcher: Enum.random(@possible_floors),
      miller: Enum.random(@possible_floors),
      smith: Enum.random(@possible_floors)
    }
  end

  def get_next_solution(:unique) do
    shuffled = Enum.shuffle(@possible_floors)

    %DwellingPuzzle{
      baker: Enum.at(shuffled, 0),
      cooper: Enum.at(shuffled, 1),
      fletcher: Enum.at(shuffled, 2),
      miller: Enum.at(shuffled, 3),
      smith: Enum.at(shuffled, 4)
    }
  end
end
