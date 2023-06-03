import Foundation

// Множества (Set). Ian Solomein, Урок 9

// пустое Set
var set = Set<String>()
type(of: set)




// создаём Set. Set не имеет индексов
var listOfSports: Set = ["Badminton", "Bowling", "Tennis", "Hockey", "Running"]




listOfSports.count                          // количество элементов в Set
listOfSports.isEmpty                        // проверка пустой или нет
listOfSports.insert("Fishing")              // добавляем элемент.
listOfSports
listOfSports.remove("Bowling")              // удаление данного значения из множества
listOfSports
listOfSports.contains("Tennis")             // проверка на наличие данного значения в множестве


// сортируем множество методом .sorted
for sports in listOfSports.sorted() {           // метод .sorted сортирует элементы по возрастанию (числа, буквы)
    print(sports)
}


var numbers: Set = [5, 1, 3, 2, 9]
for number in numbers.sorted() {
    print(number)
}

// пример дублей
let colors1 = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "green"]) // 2 дубля



let oddNumbers: Set = [0, 1, 3, 5, 7, 9]

let evenNumbers: Set = [0, 2, 4, 6, 8]

oddNumbers.union(evenNumbers).sorted()                          // .union - объеденяет множества с удалением дублей
oddNumbers.intersection(evenNumbers).sorted()                   // .intersection - только то значение, которое есть у обох множеств


let primeNumbers: Set = [2, 3, 5, 7, 2]
print(primeNumbers)

oddNumbers.subtracting(primeNumbers).sorted()                   // .substracting - оставляет уникальные элементы только первго Set, игнорируя одинаковые
oddNumbers.symmetricDifference(primeNumbers).sorted()           // .symmetricDifference - оставляет уникальные элементы из обоих Set, игнорируя одинаковые


type(of: oddNumbers.symmetricDifference(primeNumbers).sorted())



// используем множества:
// 1. Если не важен порядок
// 2. Если нужно убрать дублирование элементов
// 3. Если производительность важна



// Книжка Василий Усов. 6 издание



// явно указаный тип данный множества с использованием функции arrayLiteral:
let mySet = Set<Int>(arrayLiteral: 5, 66, 12)



// Все варианты создания множества:
var dishes: Set<String> = ["Хлеб", "Овощи", "Тушенка"]
var dishesTwo: Set = ["Хлеб", "Овощи", "Тушенка"]
var members = Set<String>(arrayLiteral: "Энакин", "Оби Ван", "Йода")
var membersTwo = Set(arrayLiteral: "Энакин", "Оби Ван", "Йода")



// создаём пустое множество
let emptySet = Set<String>()



// множество
var setWithValues = Set<String>(arrayLiteral: "Bread", "Milk")

//уничтожаем данные в множестве
setWithValues
setWithValues = [] // очистили множество
setWithValues



// методы с множествами:


// пустое множество
var musicStyleSet: Set<String> = []

musicStyleSet.insert("Jazz") // добавили в наше множество значение того же типа!
musicStyleSet.insert("Jazz") // возвращается кортеж false, так как это значение в множестве уже есть
musicStyleSet
musicStyleSet.remove("Jazz") // убрали значение из множества
musicStyleSet


