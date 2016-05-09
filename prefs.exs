defmodule Prefs do
  data_file = Path.join([__DIR__, "data_prefs.csv"])
  for line <- File.stream!(data_file, [], :line) do
    [pref | cities] =
      line
      |> String.strip()
      |> String.split(",")

    def cities_from_pref(unquote(pref)), do: unquote(cities)
  end

  def cities_from_pref(_pref), do: []
  def valid_pref?(pref), do: cities_from_pref(pref) |> Enum.any?
end
