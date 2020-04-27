defmodule Booking.Repo.Migrations.AddReservationsReference do
  use Ecto.Migration

  def change do
    alter table("reservations") do
      add :guest_id, references(:guests)
    end

  end
end
