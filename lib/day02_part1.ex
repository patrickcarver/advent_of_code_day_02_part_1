defmodule Day02Part1 do
  def start do
    get_input()
    |> create_rows_of_integers()
    |> calculate_row_difference()
    |> calculate_checksum()
  end

  defp get_input do
    "../assets/input.txt"
    |> Path.expand(__DIR__)
    |> File.read!  
  end  

  defp create_rows_of_integers(string) do
    string
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, " ")))
    |> Enum.map(&(Enum.filter(&1, fn(elem) -> elem != "" end)))
    |> Enum.map(&(Enum.map(&1, fn(elem) -> String.to_integer(elem) end)))        
  end

  defp calculate_row_difference(rows) do
    rows
    |> Enum.map(&Enum.min_max/1)
    |> Enum.map(fn({min, max}) -> max - min end)    
  end

  defp calculate_checksum(rows) do
    Enum.reduce(rows, &(&1 + &2))
  end
end
