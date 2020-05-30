defmodule Booking.ReservationQueries do
    import Ecto.Query

    alias Booking.{Repo, Reservation}

    def get_all do
        Repo.all(from Booking.Reservation)
    end
    def get_by_id(id) do
        Repo.get(Booking.Reservation, id)
        |> Repo.preload([:user, :room])
    end

    def delete_reservation(%Reservation{} = reservation) do
        Repo.delete(reservation)
      end
    def create(reservation) do
        Repo.insert(reservation)
    end
    def get_all_guest_preload do
        Repo.all(Reservation)
        |> Repo.preload([:user, :room])
    end

    def get_all_for_current_user(current_user_id) do
        Repo.all(from r in Reservation, where: r.user_id == ^current_user_id)
        |> Repo.preload([:user, :room])
    end
end
