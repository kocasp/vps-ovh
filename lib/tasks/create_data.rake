task :create_data => :environment do
  #remove all past courses
  krakow = Station.create(name: "Kraków Główny")
  warszawa = Station.create(name: "Warszawa Centralna")
  gdansk = Station.create(name: "Gdańsk Główny")

  Connection.create(station: krakow, connected_station: warszawa)
  Connection.create(station: warszawa, connected_station: krakow)

  Connection.create(station: warszawa, connected_station: gdansk)
  Connection.create(station: gdansk, connected_station: warszawa)

  Connection.create(station: krakow, connected_station: gdansk)
  Connection.create(station: gdansk, connected_station: krakow)
end
