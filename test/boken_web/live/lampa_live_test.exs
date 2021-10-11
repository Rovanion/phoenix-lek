defmodule BokenWeb.LampaLiveTest do
  use BokenWeb.ConnCase

  import Phoenix.LiveViewTest
  import Boken.FixturerFixtures

  @create_attrs %{ljusstyrka: 42, namn: "some namn", på: true}
  @update_attrs %{ljusstyrka: 43, namn: "some updated namn", på: false}
  @invalid_attrs %{ljusstyrka: nil, namn: nil, på: false}

  defp create_lampa(_) do
    lampa = lampa_fixture()
    %{lampa: lampa}
  end

  describe "Index" do
    setup [:create_lampa]

    test "lists all lampor", %{conn: conn, lampa: lampa} do
      {:ok, _index_live, html} = live(conn, Routes.lampa_index_path(conn, :index))

      assert html =~ "Listing Lampor"
      assert html =~ lampa.namn
    end

    test "saves new lampa", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.lampa_index_path(conn, :index))

      assert index_live |> element("a", "New Lampa") |> render_click() =~
               "New Lampa"

      assert_patch(index_live, Routes.lampa_index_path(conn, :new))

      assert index_live
             |> form("#lampa-form", lampa: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#lampa-form", lampa: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.lampa_index_path(conn, :index))

      assert html =~ "Lampa created successfully"
      assert html =~ "some namn"
    end

    test "updates lampa in listing", %{conn: conn, lampa: lampa} do
      {:ok, index_live, _html} = live(conn, Routes.lampa_index_path(conn, :index))

      assert index_live |> element("#lampa-#{lampa.id} a", "Edit") |> render_click() =~
               "Edit Lampa"

      assert_patch(index_live, Routes.lampa_index_path(conn, :edit, lampa))

      assert index_live
             |> form("#lampa-form", lampa: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#lampa-form", lampa: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.lampa_index_path(conn, :index))

      assert html =~ "Lampa updated successfully"
      assert html =~ "some updated namn"
    end

    test "deletes lampa in listing", %{conn: conn, lampa: lampa} do
      {:ok, index_live, _html} = live(conn, Routes.lampa_index_path(conn, :index))

      assert index_live |> element("#lampa-#{lampa.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#lampa-#{lampa.id}")
    end
  end

  describe "Show" do
    setup [:create_lampa]

    test "displays lampa", %{conn: conn, lampa: lampa} do
      {:ok, _show_live, html} = live(conn, Routes.lampa_show_path(conn, :show, lampa))

      assert html =~ "Show Lampa"
      assert html =~ lampa.namn
    end

    test "updates lampa within modal", %{conn: conn, lampa: lampa} do
      {:ok, show_live, _html} = live(conn, Routes.lampa_show_path(conn, :show, lampa))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Lampa"

      assert_patch(show_live, Routes.lampa_show_path(conn, :edit, lampa))

      assert show_live
             |> form("#lampa-form", lampa: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#lampa-form", lampa: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.lampa_show_path(conn, :show, lampa))

      assert html =~ "Lampa updated successfully"
      assert html =~ "some updated namn"
    end
  end
end
