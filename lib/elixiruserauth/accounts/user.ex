defmodule Elixiruserauth.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Argon2

  schema "users" do
    field :email, :string
    field :epassword, :string
    field :username, :string

    # Other fields.
    field :password, :string, virtual: true
    field :password_conf, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :epassword, :email])
    |> validate_required([:username, :epassword, :email])
    |> hashPassword()
  end

  defp hashPassword(changeset) do
    password = get_change(changeset, :password)

    if password do
      hashed_pass = add_hash(password)
      put_change(changeset, :epassword, hashed_pass)
    end
  end
end
