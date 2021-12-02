
defmodule AocAction do
  defstruct direction: nil, units: 0
end

defmodule AocOrientation do
  defstruct horizontal: 0, vertical: 0
end



defmodule Main do
  def main do
    stream = File.stream!('p3.input.txt')

    result = stream |>
    Enum.map(fn elm ->
      parts = String.split(elm)
      {integer, _} = Integer.parse(Enum.at(parts,1))
      %AocAction{direction: Enum.at(parts, 0), units: integer }
    end) |>
    Enum.reduce(
      %AocOrientation{},
      fn elm, rec ->
        case elm.direction do
          "forward" -> %AocOrientation{horizontal: rec.horizontal + elm.units, vertical: rec.vertical}
          "down" -> %AocOrientation{horizontal: rec.horizontal, vertical: rec.vertical + elm.units}
          "up" -> %AocOrientation{horizontal: rec.horizontal, vertical: rec.vertical - elm.units}
        end
      end
    )


    IO.puts(result.vertical * result.horizontal)
    end
  end

Main.main
