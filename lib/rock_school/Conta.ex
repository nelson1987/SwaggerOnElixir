defmodule RockSchool.Conta do
  def create("ok") do
    {:ok, %{document: "1234678901", branch: "00012", account: "0000012345"}}
  end

  def create("error") do
    {:ok, "Error while creating account"}
  end
end
