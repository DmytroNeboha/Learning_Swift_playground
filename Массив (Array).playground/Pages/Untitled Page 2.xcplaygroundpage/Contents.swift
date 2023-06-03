
import Foundation

// Коллекции: Массив (Array) Урок 8 - Ian Solomein


// Массив с помощю литерала

var array1 = Array<String>()  // полная запись массива, тип String
var array2 = [String]() // сокращённая запись масива, тип String

let apple = "apple"
let lemon = "lemon"
let orange = "Orange"
let strawberry = "strawberry"


let fruits = [apple, lemon, orange, strawberry]
var shoppingList = ["eggs", "milk", "bread", "flour", "sweets"]

shoppingList.count                  // колличество елементов в массиве shoppingList
shoppingList.isEmpty                // пустой или не пустой массив shoppingList
shoppingList.append("butter")       // добавляем новый елемент в конец массива
shoppingList[0]                     // показывает значение под индексом 0
shoppingList[1] = "salt"            // заменили значение елемента под индексом 1 на новый елемент
shoppingList[2...4] = ["apple"]     // заменили диапазон индексов новым значением
shoppingList
shoppingList.insert("sugar", at: 0) // добавляет новый елемент под заданым индексом не удаляя ничего другого



// пройтись по всему массиву распечатывая все значения
for item in shoppingList {
    print(item)
}



// индекс массива и само значение распечатаь -> метод enumerated
for (index, value) in shoppingList.enumerated() {
    print("Item \(index): \(value)")
}


// складываем массивы
shoppingList += ["pepper"]


let numbers1 = [1, 2, 3, 4, 5]
let numbers2 = [6, 7, 8]
let numbers3 = numbers1 + numbers2



                                                                // Книга Усова, 6 издание


// масив с помощю Array(arrayLiteral:)
Array(arrayLiteral: 1, 1, 2, 3, 5, 8, 12)



// создание массива с помощю передачи списка значений
let newAlphabetArray = Array(arrayLiteral: "a", "b", "c")
newAlphabetArray



// создание массива с помощю Array(_:)
Array(1...10)



// Создание массива с помощю Array(repeating:count)
Array(repeating: "Ура", count: 3)


// Создаём копию массива и заменяем елемент
let parentArray = ["one", "two", "three"]
var copyParentArray = parentArray
copyParentArray[1] = "four"
copyParentArray



// Создание пустого массива с пмощю переданого значения
let emptyArray: [String] = []



// Создание пустого массива с пмощю специальной функции
let anotherEmptyArray = [String]()



// сравниваем массивы один из которых состоит из константов
let a1 = 1
let a2 = 2
let a3 = 3
var someArray = [1, 2, 3]
someArray == [a1, a2, a3]



// многомерные массивы
var arrayOfArrays = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]  // коллекция с множеством массивов
arrayOfArrays[2]  // получаем вложенный массив
arrayOfArrays[2][1] // получсем элемент вложеного массива



// свойсвто count, чтобы получить требуемые элементы
var numArray = [1, 2, 3, 4, 5]
let sliceOfArray = numArray[numArray.count-3...numArray.count-1]
numArray.count

numArray.append(6)                   // добавили новый элемент 6 в конец массива
numArray.first                       // возвращает первый элемент в массиве
numArray.last                        // возвращает последний элемент в массиве
let subArray = numArray.suffix(3)    // возвращаем последние 3 элемента массива

numArray.insert(100, at: 2)          // добавили значение 100 в индекс 2
numArray.remove(at: 2)               // удалили значение с индексом 2
numArray.removeFirst()               // удалили первый элемент массива
numArray.removeLast()                // удалили последний элемент массива
numArray
numArray.dropLast()                  // возвращаем массив без последнего элемента но НЕ удаляя его из массива

let anotherNumArray = numArray.dropFirst(3) // удаляем 3 первых елемента
anotherNumArray



numArray
let resultTrue = numArray.contains(4)       // проверка массива на значение - 4
let resultFalse = numArray.contains(10)     // проверка массива на значение - 10


let randomArray = [3, 2, 4, 5, 6, 4, 7, 5, 6]
randomArray.min()                                // поиск минимального элемента в массиве
randomArray.max()                                // поиск минимального элемента в массиве


var myAlphaArray = ["a", "b", "ccc"]
myAlphaArray.reverse()                           // меняем порядок следования всех элементов на противоположный


let unsortedArray = [3, 2, 5, 22, 8, 1, 29]
let sortedArray = unsortedArray.sorted()        // сортирует элементы по возрастанию НЕ изменяя массив


var unsortedArray2 = [3, 2, 5, 22, 8, 1, 29]    // сортирует элементы по возрастанию изменяя массив
unsortedArray2.sort()
unsortedArray2
// Обычно если метод заканчивается на -ed значит он не трогает исходное значение


// вибираем рандомный элемент
let moneyArray = [50, 100, 500, 1000, 5000]
var randomMoneyElement = moneyArray.randomElement()  // если Var то будет счётчик
randomMoneyElement



// Срезы массивов (ArraySlice)

//нужно если исходный массив поменяет свои значения, чтобы let slice не потеряла свои значения, такое происходит при использовании разных методов.
let arrayOfNumbers = Array(1...10)   // тип данных Array<Int>
type(of: arrayOfArrays)
arrayOfNumbers[5]

let slice = arrayOfNumbers[4...6]
type(of: slice)                     // тип данных ArraySlice<Int>
slice[5]                            // индексы у Слайса соответствует индексу исходной коллекции



let arrayFromeSlice = Array(slice)  // тип данных Array<Int>
type(of: arrayFromeSlice)


//let newArray: Array<UInt> = arrayOfNumbers.dropLast





