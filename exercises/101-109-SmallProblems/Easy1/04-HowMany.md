Write a method that counts the number of occurrences of each element in a given array.
```ruby
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
```
Once counted, print each element alongside the number of occurrences.

Expected output:
```
car => 4
truck => 3
SUV => 1
motorcycle => 2
```

---

```ruby
def count_occurrences(vehicles)
  vehicle_counts = Hash.new(0)
  vehicles.each { |vehicle| vehicle_counts[vehicle] += 1 }
  vehicle_counts.each { |vehicle, count| puts "#{vehicle} => #{count}" }
end
```
