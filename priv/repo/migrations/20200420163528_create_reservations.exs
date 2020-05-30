defmodule Booking.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :end_date, :utc_datetime
      add :room_id, references(:rooms)

      timestamps()
    end
  end
end
