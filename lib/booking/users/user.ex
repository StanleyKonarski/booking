defmodule Booking.Users.User do
  use Timex
  use Ecto.Schema
  use Pow.Ecto.Schema
  use PowAssent.Ecto.Schema

  alias Booking.{Repo, Users.User}

  schema "users" do
    field :is_admin, :boolean
    field :name, :string
    field :surname, :string
    field :date_of_birth, :date
    field :gender, :string

    pow_user_fields()

    timestamps()
  end

  @required_fields ~w(name surname date_of_birth gender)a

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> Ecto.Changeset.cast(attrs, @required_fields)
    |> Ecto.Changeset.validate_required(@required_fields)
    |> Ecto.Changeset.validate_change(:date_of_birth, &eighteen_years_old/2)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  defp eighteen_years_old(_, value) do
    now = Timex.now
    Date.diff(now, value)
    |> check_age
  end

  defp check_age(days) when days < 6574.35958 , do: [date_of_birth: "You must be 18+ years old"]
  defp check_age(_), do: []
end

