require_relative 'hashmap'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p test.entries

puts "test"

test.set('moon', 'silver')

p test.entries

test.set('lion', 'winged')
test.set('carrot', 'sweet')

p test.entries

p test.get('apple')
p test.get('king')
p test.has?('hat')
p test.has?('king')

test.remove('frog')
p test.entries

test.remove('king')
p test.entries

p test.keys
p test.values
p test.length

test.clear
p test.entries
p test.length
