defmodule BookingWeb.ReservationController do
  use BookingWeb, :controller

  def show(conn, %{"id"=>id})do
    reservation = Booking.ReservationQueries.get_by_id(id)
    |>IO.inspect()
    render(conn, "details.html", reservation: reservation)
  end

  def delete(conn, %{"id" => id}) do
    reservation = Booking.ReservationQueries.get_by_id(id)
    {:ok, _room} = Booking.ReservationQueries.delete_reservation(reservation)

    conn
    |> put_flash(:info, "Reservation deleted successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end

  def list(conn, _params) do
    user = Pow.Plug.current_user(conn)
    if user.is_admin do
      reservations = Booking.ReservationQueries.get_all_guest_preload
      render conn, "allreservations.html", reservations: reservations
    else
      reservations = Booking.ReservationQueries.get_all_for_current_user(user.id)
      render conn, "allreservations.html", reservations: reservations
    end
  end
  def make_reservation(conn, %{errors: errors}) do
    render conn, "add_reservation.html", changeset: errors
  end

  def make_reservation(conn, _params) do
    changeset = Booking.Reservation.changeset(%Booking.Reservation{}, %{})
    render conn, "add_reservation.html", changeset: changeset
  end

  def add(conn, %{"reservation" => reservation}) do
    user = Pow.Plug.current_user(conn)
    user_id = user.id
    reservation = Map.update!(reservation, "beginning_date", fn d -> d <> " 00:00:00" end)
    reservation = Map.update!(reservation, "end_date", fn d -> d <> " 00:00:00" end)
    reservation = Map.put(reservation, "user_id", user_id)

    changeset=Booking.Reservation.changeset(%Booking.Reservation{}, reservation)

    case Booking.ReservationQueries.create changeset do
      {:ok,_} -> redirect conn, to: Routes.reservation_path(conn, :list)
      {:error, reasons} -> make_reservation conn, %{errors: reasons}
    end
  end
end
