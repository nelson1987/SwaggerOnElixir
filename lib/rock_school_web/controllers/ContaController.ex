defmodule RockSchoolWeb.ContaController do
  use RockSchoolWeb, :controller

  alias RockSchool.Conta

  use PhoenixSwagger

  swagger_path(:buscarConta) do
    get("/api/v1/conta")
    summary("Buscar Conta do Batman")
    description("Aqui só retornaremos o valor da conta do Batman")
    parameter(:query, :success, :string, "[Success, Error, '']", required: true)
  end

  def buscarConta(conn, %{"success" => success}) do
    success
    |> Conta.create()
    |> handle_response(conn)
  end

  defp handle_response({:ok, conta}, conn) do
    conn
    |> put_status(:ok)
    |> render("find.json", conta: conta)
  end

  defp handle_response({:error, message}, conn) do
    conn
    |> put_status(:not_found)
    |> json(%{message: message})
  end
end
