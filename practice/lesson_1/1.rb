# Merge two ordered arrays and get rid of duplicates

# O(nlogn)
def bad_merge(arr1, arr2)
  (arr1 | arr2).sort
end

# O(n)
def merge_arrays(arr1, arr2)
  it_1, it_2 = 0, 0
  result = []
  while it_1 < arr1.length && it_2 < arr2.length
    if arr1[it_1] < arr2[it_2]
        result << arr1[it_1]
      it_1 += 1
    else
        result << arr2[it_2]
      it_2 += 1
    end
  end

  while it_1 < arr1.length
      result << arr1[it_1]
    it_1 += 1
  end

  while it_2 < arr2.length
      result << arr2[it_2]
    it_2 += 1
  end
  result.uniq
end


def remove_min(arr)
  temp = arr.dup
  temp.delete_at(temp.find_index(temp.min))

  temp
end


# p merge_arrays([1, 3, 5, 7, 9, 11, 11], [1, 2, 3, 4, 5, 10, 11, 11, 12])
p remove_min([3, 2, 3, 1, 2, 1, 2323, 1])