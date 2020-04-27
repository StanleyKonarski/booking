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
Booking.GuestQueries.create(Booking.Guest.changeset(%Booking.Guest{}, %{name: "Jim", surname: "Halpert", dateOfBirth: "1978-10-01 00:00:00"}))
Booking.GuestQueries.create(Booking.Guest.changeset(%Booking.Guest{}, %{name: "Michael", surname: "Scott", dateOfBirth: "1964-03-15 00:00:00"}))
Booking.GuestQueries.create(Booking.Guest.changeset(%Booking.Guest{}, %{name: "Dwight", surname: "Schrute", dateOfBirth: "1970-11-11 00:00:00"}))


Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Deluxe", numberOfBeds: 4, price: 500}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Premium", numberOfBeds: 3, price: 350}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Premium", numberOfBeds: 3, price: 350}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Standard", numberOfBeds: 2, price: 200}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Standard", numberOfBeds: 2, price: 200}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Standard", numberOfBeds: 2, price: 200}))
Booking.RoomQueries.create(Booking.Room.changeset(%Booking.Room{}, %{type: "Standard", numberOfBeds: 2, price: 200}))

Booking.ReservationQueries.create(Booking.Reservation.changeset(%Booking.Reservation{}, %{beginningDate: "2021-04-01 00:00:00", endDate: "2021-05-07 00:00:00", room_id: 1, guest_id: 2}))
Booking.ReservationQueries.create(Booking.Reservation.changeset(%Booking.Reservation{}, %{beginningDate: "2021-04-02 00:00:00", endDate: "2021-05-08 00:00:00", room_id: 4, guest_id: 3}))
Booking.ReservationQueries.create(Booking.Reservation.changeset(%Booking.Reservation{}, %{beginningDate: "2021-04-01 00:00:00", endDate: "2021-05-04 00:00:00", room_id: 2, guest_id: 1}))
