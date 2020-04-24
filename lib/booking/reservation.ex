defmodule Booking.Reservation do
    use Ecto.Schema

    schema "reservations" do
        field :endDate, :utc_datetime
        belongs_to :room, Booking.Room
        belongs_to :guest, Booking.Guest

        timestamps()
    end
end