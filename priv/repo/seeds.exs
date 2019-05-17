# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Orangy.Repo.insert!(%Orangy.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Orangy.Repo
alias Orangy.Business.Device
alias Orangy.Tracking.DeviceCoordinates
alias Orangy.Business.DeviceImage

device_1 = %Device{
  description: "Patinete elétrico",
  energy: 80,
  name: "Orangy 1",
  type: "Patinete"
} |> Repo.insert!

device_1_coordinates = %DeviceCoordinates{
  latitude: -26.489815,
  longitude: -49.0770652,
  device: device_1
} |> Repo.insert! 

%DeviceImage{
  url: "https://cdn.shopify.com/s/files/1/1871/4015/products/Zoom-web_620x_7cca9de0-b2f2-42b8-b094-568282ff7568_large.jpg?v=1553029212",
  sequence: 1,
  device: device_1
} |> Repo.insert!
%DeviceImage{
  url: "https://cdn.shopify.com/s/files/1/1871/4015/products/1O2A1317_1_3f4a989b-14ca-456a-ad63-4d42c75999ae_large.jpg?v=1553029212",
  sequence: 2,
  device: device_1
} |> Repo.insert!
%DeviceImage{
  url: "https://cdn.shopify.com/s/files/1/1871/4015/products/zoom-detail6-web_1800x1800_141ecf9e-cbde-4d5f-93c7-1d9b67a54cd5_large.jpg?v=1553029212",
  sequence: 3,
  device: device_1
} |> Repo.insert!
%DeviceImage{
  url: "https://cdn.shopify.com/s/files/1/1871/4015/products/1O2A1219_1_5031203e-bb64-41f8-ad14-b8b0155ae8cf_large.jpg?v=1553029212",
  sequence: 4,
  device: device_1
} |> Repo.insert!

device_2 = %Device{
  description: "Bicicleta elétrica",
  energy: 100,
  name: "Orangy 2",
  type: "Bike"
} |> Repo.insert!

device_2_coordinates = %DeviceCoordinates{
  latitude: -26.4673024,
  longitude: -49.1135895,
  device: device_2
} |> Repo.insert! 

%DeviceImage{
  url: "https://www.woie.com.br/media/catalog/product/cache/1/thumbnail/800x/17f82f742ffe127f42dca9de82fb58b1/b/i/bicicleta-eletrica-woie-golden-laranja.jpg",
  sequence: 1,
  device: device_2
} |> Repo.insert!

device_3 = %Device{
  description: "Bicicleta elétrica",
  energy: 100,
  name: "Orangy 3",
  type: "Bike"
} |> Repo.insert!

device_3_coordinates = %DeviceCoordinates{
  latitude: -26.4862442,
  longitude: -49.0775923,
  device: device_3
} |> Repo.insert! 

%DeviceImage{
  url: "https://http2.mlstatic.com/bicicleta-eletrica-woie-silver-fabricada-no-brasil-laranja-D_NQ_NP_377321-MLB20768708110_062016-F.jpg",
  sequence: 1,
  device: device_3
} |> Repo.insert!
