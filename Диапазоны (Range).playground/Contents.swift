import Foundation

// Диапазоны (Range) - YouTube, канал SwiftEasy. Урок 20


// оператор полуоткрытого диапазона - бинарный
var range = 1..<100
type(of: range)


var range1 = "a"..<"z"  // диапазон с елементами типа String
type(of: range1)


let someRangeInt: Range<Int> = 1..<10   // задаём тип данных Int явно
type(of: someRangeInt)


let rangeChar: Range<Character> = "a"..<"z"  // задаём тип данных Character явно
type(of: rangeChar)




// оператор полуоткрытого диапазона - префиксный
var range2 = ..<100
type(of: range2)



// оператор закртыого диапазона - бинарный
var range3 = 1...100
type(of: range3)



// оператор закрытого диапазона - постфиксный
var range4 = 1...
type(of: range4)


// оператор закрытого диапазона - префиксный
var range5 = ...100

range5.contains(5)  // проверяем есть ли в диапазоне число 5
range3.count        // посчитаем количесвто в диапазоне
range.isEmpty       // проверка пустой ли диапазон
range3.min()        // берём минимальное значение диапазона
range3.max()        // берём минимальное значение диапазона



// Диапазоны (Range) - теория с книги Усова, 6 издание.

// инициализируем диапазон испуользуя константу и переменную
let firstElement = 10
var lastElement = 18

let myBestRange = firstElement..<lastElement


// создём пустой диапазон без елементов. * можно только с оператором полуоткрытого диапазона
let emptyR = 0..<0
emptyR.count
emptyR.isEmpty

// диапазон с единственным елементом –– 0
let notEmptyR = 0...0
notEmptyR.count
notEmptyR.isEmpty

// определяем значение крайних границ
let anotherIntR = 20..<34
anotherIntR.lowerBound
anotherIntR.upperBound
anotherIntR.min()
anotherIntR.max()
