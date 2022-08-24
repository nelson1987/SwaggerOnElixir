defmodule RockSchool.Heroi do
  required_keys = [:nome, :arquivilao, :cidadeOrigem]
  @enforce_keys [:nome, :cidadeOrigem]

  @editoraDc "DC"
  @derive {Phoenix.Param, key: :nome}
  defstruct required_keys

  def build(nome, cidadeOrigem, arquivilao \\ "Coringa") do
    %{
      cidadeOrigem: cidadeOrigem,
      nome: nome,
      arquivilao: arquivilao,
      editora: @editoraDc
    }
  end

  # def create(params) do
  #   {:ok, Batman.build(params.cidadeOrigem, params.nome)}
  # end
end
