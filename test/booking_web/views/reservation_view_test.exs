defmodule BookingWeb.ReservationViewTest do
  use BookingWeb.ConnCase, async: true

  @tag current: "yup"
  test "DateTime return as Date" do
    dt = DateTime.from_naive!(~N[2016-05-24 13:26:08.003], "Etc/UTC")
    formatted = BookingWeb.ReservationView.date_format(dt)
    assert formatted == ~D[2016-05-24]
  end
end
