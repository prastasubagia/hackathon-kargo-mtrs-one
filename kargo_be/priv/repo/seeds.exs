# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     KargoBe.Repo.insert!(%KargoBe.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias KargoBe.Repo
alias KargoBe.Shipments.ShipmentStatus

Repo.insert!(%ShipmentStatus{
    name: "Created"
  })
  Repo.insert!(%ShipmentStatus{
    name: "Assigned"
  })
  Repo.insert!(%ShipmentStatus{
    name: "Allocated"
  })
  Repo.insert!(%ShipmentStatus{
    name: "Ongoing to Origin"
  })
  Repo.insert!(%ShipmentStatus{
    name: "At Origin"
  })
  Repo.insert!(%ShipmentStatus{
    name: "Ongoing to Destination"
  })
  Repo.insert!(%ShipmentStatus{
    name: "At Destination"
  })
  Repo.insert!(%ShipmentStatus{
    name: "Completed"
  })
