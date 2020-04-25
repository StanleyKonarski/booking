defmodule Booking.Test do
    use Ecto.Schema

    import Ecto.Changeset

    schema "tests" do
        field :dateOfTest, :utc_datetime

        timestamps()
    end

    @required_fields ~w(dateOfTest)a

    def changeset(user, params \\ %{}) do
        user
        |> cast(params, @required_fields)
    end
end