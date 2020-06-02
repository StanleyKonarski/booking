# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Booking.Repo.insert!(%Booking.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, _user}=Booking.Users.User.create_user(%{
  email: "admin@example.com",
  password: "admin123",
  confirm_password: "admin123",
  is_admin: true,
  name: "Mike",
  surname: "Wazowski",
  date_of_birth: "1998-04-29",
  gender: "Male"
})

Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Deluxe", numberOfBeds: 4, price: 500}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Premium Plus", numberOfBeds: 3, price: 350}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Premium", numberOfBeds: 3, price: 300}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Standard", numberOfBeds: 2, price: 200}))

Booking.ReservationQueries.create(Booking.Reservation.changeset(%Booking.Reservation{}, %{beginning_date: "2021-04-01 00:00:00", end_date: "2021-05-07 00:00:00", room_id: 1, user_id: 1}))
Booking.ReservationQueries.create(Booking.Reservation.changeset(%Booking.Reservation{}, %{beginning_date: "2021-04-02 00:00:00", end_date: "2021-05-08 00:00:00", room_id: 4, user_id: 1}))
Booking.ReservationQueries.create(Booking.Reservation.changeset(%Booking.Reservation{}, %{beginning_date: "2021-04-01 00:00:00", end_date: "2021-05-04 00:00:00", room_id: 2, user_id: 1}))


