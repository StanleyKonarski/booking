defmodule Booking.Room do 
    use Ecto.Schema

    import Ecto.Changeset

    schema "rooms" do
        field :type, :string
        field :numberOfBeds, :string
        has_many :reservations , Booking.Reservation
    end

    @required_fields ~w(type numberOfBeds)

    def changeset(event, params \\ %{}) do
        event
        |> cast(params, @required_fields)
    end
end 