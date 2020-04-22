defmodule Booking.Guest do
    use Ecto.Schema

    schema "guests" do
        field :name, :string
        field :surname, :string
        field :dateOfBirth, Ecto.DateTime
        has_many :reservations , Booking.Reservation

        timestamps()
    end
end