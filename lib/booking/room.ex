defmodule Booking.Room do
    use Ecto.Schema

    import Ecto.Changeset

    schema "rooms" do
        field :type, :string
        field :numberOfBeds, :integer
        field :price, :integer
        has_many :reservations , Booking.Reservation
    end

    @required_fields ~w(type numberOfBeds price)a

    def changeset(room, params \\ %{}) do
        room
        |> cast(params, @required_fields)
        |> validate_required(@required_fields)
    end
end
