task :create_data => :environment do
  #remove all past courses
  Station.create(name: "Kraków Główny")
  Station.create(name: "Warszawa Centralna")

  Connection.create(station: Station.first, connected_station: Station.last)
  Connection.create(station: Station.last, connected_station: Station.first)
end
