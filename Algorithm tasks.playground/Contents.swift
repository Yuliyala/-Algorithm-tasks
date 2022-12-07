import Foundation

// Найти 2 индекса из массива  сумма  значения которых равна заданному числу. Ответ массив индексов.

class Solution {
    func twoSum(array: [Int], target: Int) -> [Int] {
        var resultArray: [Int] = []
        var dictionary: [Int: Int] = [:]
        
        for (i,j) in array.enumerated() {
            if  let index = dictionary[target - j] {
                resultArray.append(index)
                resultArray.append(i)
                return resultArray
            }
            dictionary[j] = i
        }
       return resultArray
    }
}

let example = Solution()
example.twoSum(array: [3, 7, 6, 8, 16, 5], target: 15)



// Удаление одинаковых значений из массива и вернуть количество оставшихся элементов.

func removeDuplicates(input: inout[Int]) -> Int {
    var last: Int?
    var index: Int = 0
    
    while index < input.count {
        if input[index] == last {
            input.remove(at: index)
        } else {
            last = input[index]
            index += 1
        }
    }
    return input.count
}
var array = [1,1,2,2,3,4,5,6,7,8]
removeDuplicates(input: &array)
