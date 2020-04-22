defmodule Booking.Repo.Migrations.AddGuestsTable do
  use Ecto.Migration

  def change do
    create table(:guests) do
      add :name, :string, size: 40
      add :surname, :string, size: 40
      add :dateOfBirth, :utc_datetime

      timestamps()
    end
  end
end
