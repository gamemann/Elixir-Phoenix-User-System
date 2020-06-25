defmodule ElixiruserauthWeb.SessionController do
  use ElixiruserauthWeb, :controller

  alias Elixiruserauth.Accounts.Auth
  alias Elixiruserauth.Repo

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => auth_params}) do
    case Auth.login(auth_params, Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Successfully logged in.")
        |> redirect(to: "/")

      :error ->
        conn
        |> put_flash(:error, "Couldn't login. Please check your username and password.")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Successfully logged out.")
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
