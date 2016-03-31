Airport.delete_all
Flight.delete_all

Airport.create!([{code: "SFO", name: "San Fransisco"},
                 {code: "NYC", name: "New York City"},
                 {code: "LON", name: "London"},
                 {code: "PAR", name: "Paris"},
                 {code: "CAI", name: "Cairo"},
                 {code: "TYO", name: "Tokyo"}])

first = Airport.first.id
last  = Airport.last.id

30.times do |n|
  departing, arriving = 0, 0
  until departing != arriving
    departing = rand(first..last)
    arriving  = rand(first..last)
  end
  Flight.create!(departing: Airport.find(departing),
                 arriving:  Airport.find(arriving),
                 takeoff:   n.days.from_now,
                 duration:  rand(3..12))
end