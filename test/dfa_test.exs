defmodule DFATest do
  use ExUnit.Case
  doctest DFA

  test "rejects input outside aphabet" do
    assert DFA.process_input("411001") == {:reject}
    assert DFA.process_input("31001") == {:reject}
    assert DFA.process_input("211001") == {:reject}
  end

  test "rejects input if not starts with 01" do
    assert DFA.process_input("111001") == {:reject}
    assert DFA.process_input("001001") == {:reject}
    assert DFA.process_input("101001") == {:reject}
  end

  test "accept the keyword when its is valid" do
    assert DFA.process_input("011001") == {:accept}
    assert DFA.process_input("01001") == {:accept}
    assert DFA.process_input("011001") == {:accept}
  end
end
