



def car(price, color, year)
  puts price
  puts color
  puts year
end

car("$15,000", 1972, "blue")

def post(title:, body:, author:)
  puts title
  puts body
  puts author
end

post(title: "Ruby", body: "A great book about ruby", author: "some guy")

def post(title:, body: "This was blank", author:)
  puts title
  puts body
  puts author
end

post(title: "Ruby", author: "some guy", body: "Ruby is fun")


