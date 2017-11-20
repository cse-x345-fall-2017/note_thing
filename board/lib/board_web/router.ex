defmodule BoardWeb.Router do
  use BoardWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :get_title_list
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BoardWeb do
    pipe_through :browser # Use the default browser stack

    resources "/", BoardController
  end

  def get_title_list(conn, _params) do
    assign(conn, :titles, Notebook.list_titles)
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", BoardWeb do
  #   pipe_through :api
  # end
end
