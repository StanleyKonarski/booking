defmodule Booking.GuestQueries do
    import Ecto.Query

    alias Booking.{Repo, Guest}

    def get_all do
        Repo.all(from Guest)
    end

    def get_by_surname(surname) do
        query = from g in Guest,
            where: g.surname==^surname

        Repo.all(query)
    end
end
