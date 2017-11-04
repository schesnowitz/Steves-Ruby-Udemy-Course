


artist = lambda { |name, guitar| name + " " + guitar }



artist_b = ->(name, guitar) { name + " " + guitar }

p artist.call("Steve Chesnowitz", "Les Paul")
p artist_b.call("Steve Bababooey", "Boss")