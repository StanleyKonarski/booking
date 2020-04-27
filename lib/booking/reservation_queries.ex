defmodule Booking.ReservationQueries do
    import Ecto.Query

    alias Booking.Repo

    def get_all do
        Repo.all(from Booking.Reservation)
    end

    def create(reservation) do
        Repo.insert!(reservation)
    end

end
