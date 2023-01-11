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


// MARK: - Бинарный поиск

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

// рекурсия
var count = 0
//func recursion() {
//    sleep(1)
//    print(count)
//    count += 1
//    recursion()
//}
//recursion()

func recursion() {
    if count == 10 {
        sleep(1)
        print(count)
    } else {
        sleep(1)
        print(count)
        count += 1
        recursion()
    }
}

//recursion()

func countDownToZero(number: Int) {
    print(number)
    if number == 0 {
        print("Recursion stopped")
    } else {
        sleep(1)
        countDownToZero(number: number - 1)
    }
}

countDownToZero(number: 5 )
//фибоначчи

// MARK: - Сортировка выбором
// Отсортировать список по возрастанию

//метод который находит минимальные значения в массиве

func findMinValue(array: [Int]) -> Int {
    var minValue = array[0]
    var minIndex = 0
    
    for index in 0 ..< array.count {
        if array[index] < minValue {
            minValue = array[index]
            minIndex = index
        }
    }
    return minIndex
}


// метод для сортировки

func sortArray(array: inout[Int]) -> [Int] {
    var sortArray = [Int]()
    
    while array.count != 0 {
        let minValue = findMinValue(array: array)
        sortArray.append(array[minValue])
        array.remove(at: minValue)
    }
    return sortArray
}
var shuffledTestArray = [1, 2, 12, 0, -3, 22]
sortArray(array: &shuffledTestArray)
// сложность данного алгоритма (O(n^2))

// MARK: - Сортировка пузырьком

var number = [4, 6, 1, 12, 3, 22, 0, 14, -2]

func bubbleSort(array: inout[Int]) {
    for i in 0..<array.count {
        let index = array.count - 1 - i
        
        for j in 0..<index {
            if j == array.count - 1 { break }
            
            let number = array[j]
            let nextNumber = array[j + 1]
            
            if number > nextNumber {
                array[j] = nextNumber
                array[j + 1] = number
            }
        }
    }
    
}
bubbleSort(array: &number)


// MARK: - Метод двойного указателя

//палиндром
// сложность - О(n)
func isPalindrom(numberAsString: String) -> Bool {
   
    let resultString = numberAsString.replacingOccurrences(of: " ", with: "").lowercased()
    let characterArray = Array(resultString)
    var rightPointer = characterArray.count - 1
    
    if characterArray.count == 1 {
        true
    }
    
    for index in 0..<characterArray.count {
        if characterArray[index] != characterArray[rightPointer] {
            return false
        }
        rightPointer -= 1
    }
    return true
}

isPalindrom(numberAsString: "А роза Азора")
isPalindrom(numberAsString: "А роза VVV")


// Объединить 2  отсортированных массива , чтобы  сортировка по возрастанию сохрянялась

// сложность О(n)
let firstArray = [2, 8, 8, 19, 20, 21]
let secondArray = [3, 4, 5, 5, 10]

func twoPointers(aArray: [Int], bArray: [Int]) -> [Int] {
    var a = 0  // указатель в первой последовательности
    var b = 0 // указатель во второй последовательности
    var cArray = [Int]()
   
    while a < aArray.count && b < bArray.count {
        if aArray[a] < bArray[b] {
            cArray.append(aArray[a])
            a += 1
        } else {
            cArray.append(bArray[b])
            b += 1
        }
    }
    
    while b < bArray.count {
        cArray.append(bArray[b])
        b += 1
    }
    
    while a < aArray.count {
        cArray.append(aArray[a])
        a += 1
    }
    
    return cArray
}

twoPointers(aArray: firstArray, bArray: secondArray)


// MARK: - Скользящее окно





