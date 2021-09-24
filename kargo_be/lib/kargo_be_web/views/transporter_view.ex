defmodule KargoBeWeb.TransporterView do
  use KargoBeWeb, :view
  alias KargoBeWeb.TransporterView

  def render("index.json", %{transporters: transporters}) do
    %{data: render_many(transporters, TransporterView, "transporter.json")}
  end

  def render("show.json", %{transporter: transporter}) do
    %{data: render_one(transporter, TransporterView, "transporter.json")}
  end

  def render("transporter.json", %{transporter: transporter}) do
    %{id: transporter.id,
      name: transporter.name}
  end
end
