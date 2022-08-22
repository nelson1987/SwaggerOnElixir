defmodule RockSchoolWeb.PessoaView do
  use RockSchoolWeb, :view

  def render("find.json", %{pessoa: pessoa}) do
    %{
      data: pessoa
    }
  end
end
