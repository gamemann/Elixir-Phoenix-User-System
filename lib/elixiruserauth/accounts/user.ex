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

  @spec changeset(
          {map, map} | %{:__struct__ => atom | %{__changeset__: map}, optional(atom) => any},
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: nil | Ecto.Changeset.t()
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password])
    |> validate_required([:username])
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> validate_format(:username, ~r/^[a-z0-9][a-z0-9]+[a-z0-9]$/i)
    |> validate_length(:username, min: 3)
    |> unique_constraint(:username)
    |> hashPassword
  end

  defp hashPassword(changeset) do
    password = get_change(changeset, :password)

    if password do
      hashed_pass = add_hash(password).password_hash
      put_change(changeset, :epassword, hashed_pass)
    else
      changeset
    end
  end
end
