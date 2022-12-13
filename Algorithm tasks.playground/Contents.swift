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


// Бинарный поиск

func binarySearch(array: [Int], item: Int) -> Int? {
    var low = 0   // нижняя граница
    var high  = array.count - 1 // верхняя граница
    var midIndex = 0 // среднее значение
    var mid = 0 //мы догадываемся , nа вот это ли число
    
    while low <= high {
        midIndex = (low + high) / 2
        mid = array[midIndex]
        
        if mid == item {
            return midIndex
        } else if item < mid {
            high = midIndex - 1
        } else {
            low = midIndex + 1
        }
    }
    return  nil
}

let binaryTestArray = [1, 3, 6, 7, 9, 12, 18]
binarySearch(array: binaryTestArray, item: 9)


// пример

func sumOrMulty() {
    let testArray = [1, 2, 3, 4, 5, 6]
    
//    for element in testArray {
//        print(element)
//    }
//
//    for index in 0..<testArray.count {
//        print(index)
//    }
    /*
     O(n)
     O(n + 1) = O(n)
     O(2n) = O(n)
     */

    
    
    for element in testArray {
        for index in 0..<testArray.count {
            print(element, index)
        }
}
}
sumOrMulty()

/*
 вложенный цикл практически всегда n^2
O(n^2)
O(n^2 + n) = O(n^2)
 O(5 * n^2 + 10 * n^100) = O(2^n)
 O(n^2 + B) -  пока не знаем как растет B, не можем его убрать
 */

