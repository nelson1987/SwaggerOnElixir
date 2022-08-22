defmodule RockSchoolWeb.PessoaController do
  use RockSchoolWeb, :controller

  alias RockSchool.Pessoa

  use PhoenixSwagger
  swagger_path(:buscarPessoa) do
    get("/api/v1/Pessoa")
    description("List all users in the database")
    response(200, "OK", Schema.ref(:UsersResponse))
    # parameter(:body,  Schema.ref(:User), "The users details")
    # parameter(:query, :id, :integer, "account id", required: true)
    parameter(:id, :path, :integer, "User ID", required: true, example: 3)
    parameters do
      sort_by :query, :string, "The property to sort by"
      sort_direction :query, :string, "The sort direction", enum: [:asc, :desc], default: :asc
      company_id :string, :query, "The company id"
    end

    # produces("application/json")
    # deprecated(false)
    # response(code(:ok), "Sucesso")
    # response(code(:error), "Erro")
    # response(200, "OK", Schema.ref(:UsersResponse),
    #   example: %{
    #     data: [
    #       %{
    #         id: 1,
    #         name: "Joe",
    #         email: "Joe6@mail.com",
    #         inserted_at: "2017-02-08T12:34:55Z",
    #         updated_at: "2017-02-12T13:45:23Z"
    #       },
    #       %{
    #         id: 2,
    #         name: "Jack",
    #         email: "Jack7@mail.com",
    #         inserted_at: "2017-02-04T11:24:45Z",
    #         updated_at: "2017-02-15T23:15:43Z"
    #       }
    #     ]
    #   }
    # )
  end
  def swagger_definitions do
    %{
      User:
        swagger_schema do
          title("Pessoa")
          description("A user of the app")

          properties do
            id(:integer, "User ID")
            name(:string, "User name", required: true)
            email(:string, "Email address", format: :email, required: true)
            inserted_at(:string, "Creation timestamp", format: :datetime)
            updated_at(:string, "Update timestamp", format: :datetime)
          end

          example(%{
            id: 123,
            name: "Joe",
            email: "joe@gmail.com"
          })
        end,
      UserRequest:
        swagger_schema do
          title("UserRequest")
          description("POST body for creating a user")
          property(:user, Schema.ref(:User), "The user details")
        end,
      UserResponse:
        swagger_schema do
          title("UserResponse")
          description("Response schema for single user")
          property(:data, Schema.ref(:User), "The user details")
        end,
      UsersResponse:
        swagger_schema do
          title("UsersReponse")
          description("Response schema for multiple users")
          property(:data, Schema.array(:User), "The users details")
        end
    }
  end

  def buscarPessoa(conn, %{"success" => success}) do
    success
    |> Pessoa.create()
    |> handle_response(conn)
  end

  defp handle_response({:ok, pessoa}, conn) do
    conn
    |> put_status(:ok)
    |> render("find.json", pessoa: pessoa)
  end

  defp handle_response({:error, message}, conn) do
    conn
    |> put_status(:not_found)
    |> json(%{message: message})
  end

end
