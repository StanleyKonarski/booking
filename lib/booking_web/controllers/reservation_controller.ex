defmodule BookingWeb.ReservationController do
  use BookingWeb, :controller

  def show(conn, %{"id"=>id})do
    reservation = Booking.ReservationQueries.get_by_id(id)
    |>IO.inspect()
    render(conn, "details.html", reservation: reservation)
  end

  def list(conn, _params) do
    reservations = Booking.ReservationQueries.get_all_guest_preload
    render conn, "allreservations.html", reservations: reservations
  end

  def create(conn, _params) do
    changeset = Booking.Guest.changeset(%Booking.Guest{}, %{})
    render conn, "create.html", changeset: changeset
  end

  def available(conn, %{"id" => id}) do
    changeset = Booking.Reservation.changeset(%Booking.Reservation{}, %{id: id})
    render conn, "available.html", changeset: changeset, id: id
  end

  def addr(conn, %{"reservation" => reservation}) do
    reservation = Map.update!(reservation, "beginningDate", fn d -> d <> ":00" end)
    reservation = Map.update!(reservation, "endDate", fn d -> d <> ":00" end)
    Booking.Reservation.changeset(%Booking.Reservation{}, reservation)
    |> Booking.ReservationQueries.create
    redirect conn, to: Routes.reservation_path(conn, :list)
  end

  def add(conn, %{"guest" => guest}) do
    guest = Map.update!(guest, "dateOfBirth", fn d -> d <> ":00" end)

    %{id: id} = Booking.Guest.changeset(%Booking.Guest{}, guest)
    |> Booking.GuestQueries.create
    redirect conn, to: Routes.reservation_path(conn, :available, id: id)
  end
end
