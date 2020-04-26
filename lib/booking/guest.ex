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

    def changeset(event, params \\ %{}) do
        event
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
        |> validate_change(:date, &future/2)
    end

    defp future(_, value) do
        DateTime.compare(value, DateTime.utc_now)
        |> get_error
    end

    #Returns :gt if the first datetime is later than the second and :lt for vice versa. If the two datetimes are equal :eq is returned.

    defp get_error(comparison) when comparison == :lt, do: [date: "Please choose date in the future"]
    defp get_error(_), do: []
end
