defmodule DFATest do
  use ExUnit.Case
  doctest DFA

  test "greets the world" do
    assert DFA.hello() == :world
  end
end
