defmodule SmartCity.TestDataGenerator.PayloadTest do
  use ExUnit.Case
  doctest SmartCity.TestDataGenerator.Payload
  alias SmartCity.TestDataGenerator.Payload

  test "create_payload returns a random map in accordance with schema" do
    result = Payload.create_payload(:test)

    assert result["my_int"] |> is_integer
    assert result["my_string"] |> is_binary
    assert %Date{} = result["my_date"]
    assert result["my_float"] |> is_float
    assert result["my_boolean"] |> is_boolean
  end

  test "get_schema returns schema as list of maps" do
    expected = [
      %{name: "my_int", type: "integer"},
      %{name: "my_string", type: "string"},
      %{name: "my_date", type: "date"},
      %{name: "my_float", type: "float"},
      %{name: "my_boolean", type: "boolean"}
    ]

    assert Payload.get_schema(:test) == expected
  end
end
