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
alias KargoBe.Trucks.TruckType
alias KargoBe.Trucks.Truck
alias KargoBe.Shipments.ShipmentStatus

# Truck Types
Repo.insert!(%TruckType{
  name: "FUSO"
});
Repo.insert!(%TruckType{
  name: "PICKUP"
});
Repo.insert!(%TruckType{
  name: "TRONTON"
});
Repo.insert!(%TruckType{
  name: "VAN"
});

# Trucks
Repo.insert!(%Truck{
  license_number: "B1000ABA",
  license_type: "yellow",
  production_year: 2007,
  status: true,
  stnk_path: "",
  kir_path: "",
  truck_type_id: 1
})
Repo.insert!(%Truck{
  license_number: "B2000BAB",
  license_type: "yellow",
  production_year: 2010,
  status: true,
  stnk_path: "",
  kir_path: "",
  truck_type_id: 2
})

# Shipment
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
