defmodule Booking.ReservationQueries do
    import Ecto.Query

    alias Booking.{Repo, Guest, Reservation}

    def get_all do
        Repo.all(from Booking.Reservation)
    end

    def get_by_id(id) do
        Repo.get(Booking.Reservation, id)
    end

    def create(reservation) do
        Repo.insert!(reservation)
    end

    def get_all_guest_join do
        query = from g in Guest,
            join: r in Reservation, on: r.guest_id == g.id

        test = from [g, r] in query,
            select: {r.beginningDate, g.name}

        Repo.all(test)
    end

    def get_all_guest_preload do
        Repo.all(Reservation)
        |> Repo.preload(:guest)
    end

end
