import Foundation


// Книга Усова, 6 издание


// метод Map(_:)
let myArray = [2, 4, 5, 7]
var newArray = myArray.map{$0} // также преобрела вид map{$0}
newArray


let array = [2, 4, 5, 7]
var newArray2 = array.map({
    (value: Int) -> Int in
    return value
})
// замыкание никак не изменяет входной параметр, просто возвращает его.


// оптимизируем замыкание
var newArray3 = array.map{value in value}


// теперь можно убрать ключевое слово in и заменить value на сокращенное имя $0
var newArray4 = array.map{$0}



// теперь сделаем так чтоб метод map возводил каждый элемент в квадрат
var newArray5 = array.map{$0*$0}
newArray5



// логическое сравнение
let intArray = [1, 2, 3, 4]
let boolArray = intArray.map{$0 > 2}
boolArray



// Метод map(_:) - вернёт многомерный массив на основе базового
let numbers = [1, 2, 3, 4]
let mapped = numbers.map{ Array(repeating: $0, count: $0)}
mapped



// данный метод также работает с словарями. Пример перевода расстояния с милей в километры
let milesToDest = ["Kyiv": 120.0, "Dubai": 50.0, "Paris": 70.0]
let kmToDest = milesToDest.map{ name, miles in [name:miles * 1.6093]}
kmToDest



// 14.2. Метод mapVaules(_:) - обрабатыывает значение словаря но ключи останутся в исходном состоянии
let mappedCloseStars = ["Proxima Centauri": 4.24, "Alpha Centauri A": 4.37]
let newCollection = mappedCloseStars.mapValues{ $0+1 }
newCollection



// Метод flatMap(_:)
let numbersArray = [1, 2, 3, 4]
let flatMapped = numbersArray.flatMap{ Array(repeating: $0, count: $0)}
flatMapped


// Метод flatMap(_:) - вернет плоский одномерный масив
let someArray = [[1, 2, 3, 4, 5], [11, 44, 1, 6], [16, 403, 321, 10]]
let filterSomeArray = someArray.flatMap{ $0.filter{ $0 % 2 == 0}}
filterSomeArray



// Метод compactMap(_:) - тоже что и map, только разница в реакции на ситуацию, когда преобразование не может быть приведено
let stringArray = ["1", "2", "3", "four", "5"]
let intFromStringArray = stringArray.compactMap() { Int($0) }
intFromStringArray



// Метод filter(_:)
let numArray = [1, 4, 10, 15]
let even = numArray.filter{ $0 % 2 == 0 }
even


// также
let starDistanceDict = ["Wolf 359": 7.78, "Alpha Centauri B": 4.37, "Barnard's Star": 5.96]
let closeStars = starDistanceDict.filter { $0.value < 5.0 }
closeStars



// Метод reduce(_:_:) - позволяет объеденить все элементы коллекции в одно значение в соответсвии переданым замыканием.
let cash = [10, 50, 100, 500]
let total = cash.reduce(210, +)
total


// также
let multiTotal = cash.reduce(210, { $0 * $1 })
multiTotal



// метод zip(_:_:) - берет два первых элемента с каждой последовательности и групирует, и потом след. элементы также
let collectionOne = [1, 2, 3]
let collectionTwo = [4, 5, 6]

let zipSequence = zip(collectionOne, collectionTwo)
Array(zipSequence)
let newDictionary = Dictionary(uniqueKeysWithValues: zipSequence)
newDictionary



// Оператор guard для опционалов



// задача: необходимо реализовать механизм вывода на консоль количесвто сторон в данной фигуре


// возвращает количество сторон фигуры по названию
func countSidesOfShape(shape: String) -> Int? {
    switch shape {
    case "треугольник":
        return 3
    case "квадрат":
        return 4
    case "прямоугольник":
        return 4
    default:
        return nil
    }
}

// выводит сообщение на консоль
func maybePrintContSides(shape: String) {
    guard let sides = countSidesOfShape(shape: shape) else {
        print("Неизвестно колличество сторон фигуры \(shape)")
        return
    }
    print("Фигура \(shape) имеет \(sides) стороны")
}


countSidesOfShape(shape: "квадрат")
maybePrintContSides(shape: "треугольник")



// Оператор отложеных действий defer - делает действия в обратном порядке
func someFunction() {
    defer {
        print("action in defer")
    }
    defer {
        print("another action in defer")
    }
    print("action in function")
}
someFunction()
