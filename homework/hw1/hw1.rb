def arr_sum(arr)
  arr.length == 0 ? 0 : arr.shift + arr_sum(arr)
end


puts arr_sum([1, 2, 3, 4, 5])
