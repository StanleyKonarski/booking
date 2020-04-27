defmodule Booking.Repo.Migrations.RenameColumns do
  use Ecto.Migration

  def change do
    rename table("reservations"), :room_id, to: :room
    rename table("reservations"), :guest_id, to: :guest
  end
end
