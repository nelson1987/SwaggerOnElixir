defmodule RockSchool.Pessoa do
  def create("success") do
    {:ok, %{name: "Bruce Wayne", nick: "Batman"}}
  end

  def create("error") do
    {:error, "Error while creating person"}
  end

  def create(message) when message != "success" or message != "error",
    do: {:error, "Error while creating person"}
end
