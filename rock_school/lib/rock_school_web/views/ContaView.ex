defmodule RockSchoolWeb.ContaView do
  use RockSchoolWeb, :view

  def render("find.json", %{conta: conta}) do
    %{
      data: conta
    }
  end
end
