defmodule Booking.Reservation do
    use Ecto.Schema
    use Timex

    import Ecto.Changeset
    import Ecto.Query

    schema "reservations" do
        field :end_date, :utc_datetime
        field :beginning_date, :utc_datetime
        belongs_to :room, Booking.Room
        belongs_to :user, Booking.Users.User

        timestamps()
    end

    @required_fields ~w(end_date beginning_date room_id user_id)a

    def changeset(reservation, params \\ %{}) do
        reservation
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
        |> check_constraint(
            :end_date,
            name: :positive_duration,
            message: "end date must be after beginning of the reservation"
        )
        |> validate_change(:end_date, &future/2)
        #|> validate_if_room_is_taken()

    end

    defp future(_, value) do
        DateTime.compare(value, DateTime.utc_now)
        |> get_error
    end

    #defp validate_if_room_is_taken(changeset) do
        #beginning = get_field(changeset, :beginning_date)
        #ending = get_field(changeset, :end_date)
        #room = get_field(changeset, :room_id)
        #reservations = Booking.Repo.all(from r in Booking.Reservation, where: r.room_id == ^room)
        #for r<- reservations do
           # if(Timex.between?(beginning, r.beginning_date, r.end_date)) do

            #end
            #if(Timex.between?(ending, r.beginning_date, r.end_date)) do

            #end
        #changeset
        #end
    #end

    #Returns :gt if the first datetime is later than the second and :lt for vice versa. If the two datetimes are equal :eq is returned.

    defp get_error(comparison) when comparison == :lt, do: [end_date: "Please choose date in the future"]
    defp get_error(_), do: []
end
