defmodule Booking.Repo.Migrations.AddPositiveConstraint do
  use Ecto.Migration

  def change do
    create constraint("reservations", "positive_duration", check: "end_date > beginning_date")
  end
end
