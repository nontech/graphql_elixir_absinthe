#---
# Excerpted from "Craft GraphQL APIs in Elixir with Absinthe",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/wwgraphql for more book information.
#---
defmodule PlateSlateWeb.Schema do
  use Absinthe.Schema

  alias PlateSlate.{Menu, Repo}

  # Absinthe predefined custom scalars
  import_types Absinthe.Type.Custom

  query do

    @desc "The list of avilable items on the menu"
    field :menu_items, list_of(:menu_item) do
      resolve fn _,_,_ ->
        {:ok, Repo.all(Menu.Item)}
      end
    end
  end

  @desc "Describes a single item on the menu"
  object :menu_item do
    field :id, :id
    field :name, :string
    field :description, :string
    field :price, :decimal
    @desc "Date on which the item was added to the menu"
    field :added_on, :date
  end
end
