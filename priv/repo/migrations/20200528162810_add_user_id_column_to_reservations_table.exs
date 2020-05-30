defmodule Booking.Repo.Migrations.AddUserIdColumnToReservationsTable do
  use Ecto.Migration

  def change do
    alter table ("reservations") do
      add :user_id, references(:users)
    end
  end
end
