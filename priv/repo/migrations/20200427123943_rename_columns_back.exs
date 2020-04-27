defmodule Booking.Repo.Migrations.RenameColumnsBack do
  use Ecto.Migration

  def change do
    rename table("reservations"), :room, to: :room_id
    rename table("reservations"), :guest, to: :guest_id
  end
end
