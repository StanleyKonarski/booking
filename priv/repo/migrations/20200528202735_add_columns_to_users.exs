defmodule Booking.Repo.Migrations.AddColumnsToUsers do
  use Ecto.Migration

  def change do
    alter table ("users") do
      add :name, :string
      add :surname, :string
      add :date_of_birth, :date
      add :gender, :string
    end
  end
end
