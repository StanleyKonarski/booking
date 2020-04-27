defmodule Booking.Repo.Migrations.ReservationsAddBeginningColumn do
  use Ecto.Migration

  def change do
    alter table("reservations") do
      add :beginningDate, :utc_datetime
    end

  end
end
