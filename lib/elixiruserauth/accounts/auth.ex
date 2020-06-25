defmodule Elixiruserauth.Accounts.Auth do
  alias Elixiruserauth.Accounts.User
  import Argon2

  def login(params, repo) do
    user = repo.get_by(User, username: params["username"])

    case authenticate?(user, params["password"]) do
      true -> {:ok, user}

      false -> :error
    end
  end

  defp authenticate?(user, password) do
    if user do
      check_pass(user, password, [hash_key: :epassword])
    else
      false
    end
  end

  def signed_in?(conn) do
    conn.assigns[:current_user]
  end
end
