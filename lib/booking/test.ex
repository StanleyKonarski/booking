defmodule Booking.Test do
    use Ecto.Schema

    schema "tests" do
        field :dateOfTest, Ecto.DateTime
        field :shit, Timex.Ecto.DateTime

        timestamps()
    end
end