defmodule Booking.Room do 
    use Ecto.Schema

    schema "rooms" do
        field :type, :string
        field :numberOfBes, :string
        has_many :reservations , Booking.Reservation
    end 
end 