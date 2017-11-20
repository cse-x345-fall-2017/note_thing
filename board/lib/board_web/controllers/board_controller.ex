defmodule BoardWeb.BoardController do
  use BoardWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{ "note" => %{ "title" => title, "body" => body }}) do
    Notebook.add(title, body)
    conn
    |> put_flash(:info, "Added: #{title}")
    |> redirect(to: board_path(conn, :index))
  end

  def show(conn, %{ "id" => id }) do
    note = Notebook.find(id)
    render(conn, "show.html", note: note)
  end

  def edit(conn, %{ "id" => id }) do
    note = Notebook.find(id)
    render(conn, "edit.html", note: note)
  end

  def update(conn,  %{ "id" => id, "note" => note }) do
    Notebook.update(id, note)
    conn
    |> put_flash(:info, "Updated")
    |> redirect(to: board_path(conn, :show, id))    
  end
end
