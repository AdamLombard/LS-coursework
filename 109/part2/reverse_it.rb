def reverse_it(arr)
  arr_rev = []
  while arr.length > 0
    arr_rev << arr.pop
  end
  arr_rev
end

arr = [1, 2, 3, 4, 5]
arr = reverse_it(arr)
print arr
