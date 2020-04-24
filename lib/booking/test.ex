defmodule Booking.Test do
    use Ecto.Schema

    schema "tests" do
        field :dateOfTest, :utc_datetime

        timestamps()
    end
end