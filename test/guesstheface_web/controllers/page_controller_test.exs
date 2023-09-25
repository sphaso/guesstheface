defmodule GuessthefaceWeb.PageControllerTest do
  use GuessthefaceWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert true
  end
end
