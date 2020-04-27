defmodule Booking.RoomQueries do
  import Ecto.Query

  alias Booking.Repo

  def get_all do
      Repo.all(from Booking.Room)
  end

  def create(room) do
      Repo.insert!(room)
  end

end
