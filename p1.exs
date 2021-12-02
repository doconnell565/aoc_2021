
defmodule AocRecord do
  defstruct last_value: nil, count: 0
end



defmodule Main do
  def main do
    stream = File.stream!('p1.input.txt')

    result = stream |>
    Enum.reduce(
      %AocRecord{},
      fn elm, rec ->
        {integer, _} = Integer.parse(elm)
        count = cond do
          integer > rec.last_value -> rec.count + 1
          true -> rec.count
        end
        %AocRecord{last_value: integer, count: count}
      end)

    IO.puts(result.count)
    end
  end

Main.main
