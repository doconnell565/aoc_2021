
defmodule AocRecord do
  defstruct last_value: nil, count: 0
end

defmodule AocTriplet do
  defstruct one_back: 0, two_back: 0, count: 0, result: []
end



defmodule Main do
  def main do
    stream = File.stream!('p2.input.txt')



    result = stream |>
    Enum.map(fn elm ->
      {integer, _} = Integer.parse(elm)
      integer
    end) |>
    Enum.reduce(
      %AocTriplet{},
      fn elm, rec ->
        triplet_value = elm + rec.one_back + rec.two_back
        count = rec.count
        cond do
          count == 2 -> %AocTriplet{two_back: rec.one_back, one_back: elm, count: 2, result: rec.result ++ [triplet_value] }
          true -> %AocTriplet{two_back: rec.one_back, one_back: elm, count: rec.count + 1, result: []}
        end
      end
    )

    final_count = result.result |>
    Enum.reduce(
      %AocRecord{},
      fn elm, rec ->
        IO.puts(elm)
        integer = elm
        count = cond do
          integer > rec.last_value -> rec.count + 1
          true -> rec.count
        end
        %AocRecord{last_value: integer, count: count}
      end)

    IO.puts(final_count.count)
    end
  end

Main.main
