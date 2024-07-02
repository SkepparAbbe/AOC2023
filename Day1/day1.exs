#

defmodule Day1 do

  @doc """
  Solution to the first day of Advent of code 2023
  Problem:
  On each line, the calibration value can be found by combining the first
  digit and the last digit (in that order) to form a single two-digit number.
  """

  def main do
    File.stream!("Day1/big_input.txt")
    |> Stream.map(&calculate_number/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum()
    |> IO.puts()
  end

  def calculate_number(line) do
    IO.inspect(line)
    Regex.run(~r/\d/, line, capture: :first) ++ Regex.run(~r/(\d)[^\d]*$/, line, capture: :all_but_first)
    |> then(fn [a, b] -> a <> b end)
    |> IO.inspect()
  end

end

Day1.main()
