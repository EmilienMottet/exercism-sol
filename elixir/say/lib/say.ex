defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(number) when number >= 0 and number < 1_000_000_000_000,
    do: {:ok, do_in_english(number)}

  def in_english(_), do: {:error, "number is out of range"}

  defp do_in_english(80), do: "eighty"

  defp do_in_english(50), do: "fifty"

  defp do_in_english(40), do: "forty"

  defp do_in_english(30), do: "thirty"

  defp do_in_english(20), do: "twenty"

  defp do_in_english(14), do: "fourteen"

  defp do_in_english(12), do: "twelve"

  defp do_in_english(9), do: "nine"

  defp do_in_english(7), do: "seven"

  defp do_in_english(6), do: "six"

  defp do_in_english(5), do: "five"

  defp do_in_english(4), do: "four"

  defp do_in_english(3), do: "three"

  defp do_in_english(2), do: "two"

  defp do_in_english(1), do: "one"

  defp do_in_english(0), do: "zero"

  defp do_in_english(number) when rem(number, 1_000_000_000) == 0,
    do: "#{do_in_english(div(number, 1_000_000_000))} billion"

  defp do_in_english(number) when rem(number, 1_000_000) == 0,
    do: "#{do_in_english(div(number, 1_000_000))} million"

  defp do_in_english(number) when rem(number, 1_000) == 0,
    do: "#{do_in_english(div(number, 1_000))} thousand"

  defp do_in_english(number) when rem(number, 100) == 0,
    do: "#{do_in_english(div(number, 100))} hundred"

  defp do_in_english(number) when number > 1_000_000_000,
    do:
      "#{do_in_english(number - rem(number, 1_000_000_000))} #{
        do_in_english(rem(number, 1_000_000_000))
      }"

  defp do_in_english(number) when number > 1_000_000,
    do:
      "#{do_in_english(number - rem(number, 1_000_000))} #{do_in_english(rem(number, 1_000_000))}"

  defp do_in_english(number) when number > 1_000,
    do: "#{do_in_english(number - rem(number, 1_000))} #{do_in_english(rem(number, 1_000))}"

  defp do_in_english(number) when number > 100,
    do: "#{do_in_english(number - rem(number, 100))} #{do_in_english(rem(number, 100))}"

  defp do_in_english(number) when number > 20,
    do: "#{do_in_english(number - rem(number, 10))}-#{do_in_english(rem(number, 10))}"
end
