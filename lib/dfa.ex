defmodule DFA do
  def process_input(keyword \\ "") do
    read_chars(keyword, 0, :initial_state)
  end

  defp read_chars(_keyword, 2, :accept), do: {:accept}
  defp read_chars(_keyword, _q0, :reject), do: {:reject}

  defp read_chars(keyword, q0, state) do
    current_char = String.at(keyword, q0)
    next_state = transite_state(current_char, state)

    read_chars(keyword, q0 + 1, next_state)
  end

  defp transite_state(curr_char, :initial_state) do
    case curr_char do
      "0" ->
        :accept

      "1" ->
        :reject

      _ ->
        :reject
    end
  end

  defp transite_state(char, :accept) do
    cond do
      char == "1" ->
        :accept

      char == "0" ->
        :reject
    end
  end
end
