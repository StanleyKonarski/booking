defmodule Booking.Repo.Migrations.AddTestsTable do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :dateOfTest, :utc_datetime

      timestamps()
    end
  end
end
