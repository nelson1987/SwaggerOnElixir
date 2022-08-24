defmodule RockSchoolWeb.HeroiView do
  use RockSchoolWeb, :view

  def render("find.json", %{heroi: heroi}) do
    %{
      data: heroi
    }
  end
end
