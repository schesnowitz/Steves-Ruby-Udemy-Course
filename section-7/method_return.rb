
@players = true
@style = false


def guitar_players
   return ["Eric Clapton", "Jeff Beck"] if @players == true
   return ["Blues", "Rock"] if @style == true
end

puts guitar_players

