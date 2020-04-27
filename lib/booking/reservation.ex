defmodule Booking.Reservation do
    use Ecto.Schema

    import Ecto.Changeset

    schema "reservations" do
        field :endDate, :utc_datetime
        field :beginningDate, :utc_datetime
        belongs_to :room, Booking.Room
        belongs_to :guest, Booking.Guest

        timestamps()
    end

    @required_fields ~w(endDate beginningDate room guest)a

    def changeset(reservation, params \\ %{}) do
        reservation
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
        |> validate_change(:endDate, &future/2)
    end

    defp future(_, value) do
        DateTime.compare(value, DateTime.utc_now)
        |> get_error
    end

    #Returns :gt if the first datetime is later than the second and :lt for vice versa. If the two datetimes are equal :eq is returned.

    defp get_error(comparison) when comparison == :lt, do: [endDate: "Please choose date in the future"]
    defp get_error(_), do: []
end
