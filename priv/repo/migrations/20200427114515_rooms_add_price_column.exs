defmodule Booking.Repo.Migrations.RoomsAddPriceColumn do
  use Ecto.Migration

  def change do
    alter table("rooms") do
      add :price, :integer
    end

  end
end
