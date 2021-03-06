defmodule Facerkutv2.User do
  use Facerkutv2.Web, :model

  @primary_key {:id, :id, autogenerate: true}

  schema "users" do
    field :name, :string
    field :email, :string
    field :photo_url, :string

    has_many :user, Facerkutv2.Community
    many_to_many :member_of, Facerkutv2.Community, join_through: "communities_users"

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
  end
end
