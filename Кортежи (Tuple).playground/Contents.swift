import Foundation


// Контейнерные типы данных (СОСТАВНОЙ ТИП) - Tuple (КОРТЕЖИ). Урок 6 - Ian Solomein

let j = 10
let h = "Hello"

// пример кортежей
var tuple1 = (j, h)
var tuple2 = (12, "Hello")
var tuple3: (Int, String)
tuple3 = (23, "Swift")



// сравнение типов данных кортежей
let tuple10 = (200, "In work", true)
let tuple11 = (true, "On work", 200)
print(type(of: tuple10) == type(of: tuple11)) // false



// объявление кортежв с явно заданым типом
let floatStatus: (Float, String, Bool) = (200.2, "In Work", true)



// объявляем псевдоним для типа Int
typealias numberType = Int
let numbersTuple: (Int, Int, numberType, numberType) = (0, 1, 2, 3)
numbersTuple



// записываем значения кортежа в переменные
let myProgramStatus = (200, "In work", true)
var (statusCode, statusText, statusConnect) = myProgramStatus
print("Код ответа - \(statusCode)")
print("Текст ответа - \(statusText)")
print("Связь с сервером - \(statusConnect)")



// две переменные с одновременным объявлением значений
var (myName, myAge) = ("Дракон", 140)
print("Моё имя - \(myName) и мне \(myAge) лет.")



// получаем только необходимые значения кортежа
let myWorkStatus = (200, "Work", true)
let (statusCode2, _, _) = myWorkStatus
print("Код ответа - \(statusCode2)")



// вывод значения с помощю индекса
var tuple4 = (name: "Igor", age: 22, isMarried: true, weight: 190.5)
tuple4.0
tuple4.1
tuple4.2
tuple4.3
print("Имя пользвателя: \(tuple4.0)")



// вывод значения с помощю имени
var tuple5 = (name1: "Igor", age1: 22, isMarried1: true, weight1: 190.5)
tuple5.name1
tuple5.age1
tuple5.isMarried1
tuple5.weight1
print("Имя пользвателя: \(tuple5.name1)")



// объявление кортежа с именем елемнетов в описании типа
let anotherStatusTuple: (statusCode: Int, statusText: String, statusConect: Bool) = (200, "In work!", true)
anotherStatusTuple.statusCode
anotherStatusTuple.statusText




// копируем значение одного кортежа в другой
var point1 = (x:4, y:3)
var point2 = (x:2, y:6)
point2 = point1



// изменяем значение отдельного елемента
var someTuple = (200, true)
someTuple.0 = 150
someTuple.1 = false



// сравнение кортежей
(1, "alpha") < (2, "beta")
(4, "beta") < (4, "gamma")
(3.14, "pi") == (3.14, "pi")





