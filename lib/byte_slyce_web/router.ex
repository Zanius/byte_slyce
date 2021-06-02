defmodule ByteSlyceWeb.Router do
  use ByteSlyceWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ByteSlyceWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/:url_slug", SlugController, :slug_redirect
  end

  # Other scopes may use custom stacks.
  scope "/api", ByteSlyceWeb do
    pipe_through :api

    resources "/long_urls", LongUrlController, only: [:create]
  end
end
