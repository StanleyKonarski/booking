defmodule Booking.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :type, :string
      add :numberOfBeds, :integer
    end
  end
end
