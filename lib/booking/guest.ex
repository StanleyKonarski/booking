defmodule Booking.Guest do
    use Ecto.Schema

    import Ecto.Changeset

    schema "guests" do
        field :name, :string
        field :surname, :string
        field :dateOfBirth, :utc_datetime
        has_many :reservations , Booking.Reservation

        timestamps()
    end

    @required_fields ~w(name surname dateOfBirth)a

    def changeset(guest, params \\ %{}) do
        guest
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
        |> validate_change(:dateOfBirth, &adult/2)
    end

    defp adult(_,value) do
        DateTime.diff(DateTime.utc_now, value)
        |> get_error
    end

    defp get_error(subres) when subres < 568024668, do: [dateOfBirth: "You must be 18+"]
    defp get_error(_), do: []
end
