import Foundation

// Словари Dictionary. Ian Solomey


// Dictionary <Key, Value> - полная форма записи
// [Key: Value] - краткая форма словаря

// пустой словарь
var dictionary = [Int: String]()



// пример словаря heights
var heights = ["Ian": 1.75, "Maria": 1.76, "Igor": 1.82, "Olga": 1.56]
heights["Ian"]



var results = ["Mathematics": 100, "English": 85, "Geography": 75]
results.count
results.isEmpty
results["History"] = 80
results
results["Mathematics"] = 90
results
results.updateValue(70, forKey: "History")
results
results.updateValue(50, forKey: "History")      // несуществующее значение
results.removeValue(forKey: "Mathematics")
results


for (subject, point) in results {
    print("\(subject): \(point)")
}

for subject in results.keys {
    print("Subject: \(subject)")
}

for points in results.values {
    print("Points: \(points)")
}

var keys = Array(results.keys)
var values = Array(results.values)



// Книга Усова. 6 издание



// сдлварь
let dictionary1 = ["One": "Один", "two": " два", "three": "три"] // "one" - ключ, "один" - значение.
dictionary1


// создаём словарь с помощю Dictionary(dictionaryLiteral:)
Dictionary(dictionaryLiteral: (100, "сто"), (200, "двести"), (300, "триста"))


// создаём словарь из массива кортежей с помощю функции uniqueWithValues:
let baseCollection = [(2, 5), (3, 6), (1, 4)]

let newDictionary = Dictionary(uniqueKeysWithValues: baseCollection)
newDictionary


// формируем одну последовательность с помощю функции zip(_:_:) и передаём её в функцию Dictionary(uniqueKeysWithValues:)
let nearestStarNames = ["Proxima Centauri", "Alpha Centauri A", "Alpha Centauri B"]     // массив звезд
let nearestStarDistances = [4.24, 4.37, 4.37]                                           // массив расстояний до звезд

// получение словаря, содержащего пары значений:
let starDistanceDict = Dictionary(uniqueKeysWithValues: zip(nearestStarNames, nearestStarDistances))
starDistanceDict



// 8.2. Тип данных словаря


//Словарь с неявно заданным типом данных [Int:String]
let codeDesc = [200: "Success", 300: "Warning", 400: "error"]
type(of: codeDesc)


//Словарь с явно заданными типами данных
let dictOne: Dictionary<Int, Bool> = [100: false, 200: true, 400: true]
let dictTwo: [String:String] = ["Jonh": "Dave", "Eleonor": "Green"]



// 8.3. Взаимодействия с элементами словаря
var countryDict = ["USA": "США", "FRA": "Франция", "UKR": "Украина"]


// получаем значение элемента
var countryName = countryDict["UKR"]
countryName

// изменяем значение элемента. Вариант 1:
countryDict["USA"] = "Соедененные Штаты Америки"
countryDict

// изменение значения. В случае успешного изменения будет возвращено старое значение элемента. Вариант 2:
var oldValueOne = countryDict.updateValue("France", forKey: "FF")
countryDict

var oldValueTwo = countryDict.updateValue("Эстония", forKey: "EST")
oldValueTwo

// создаём новый элемент в словаре
countryDict["TUR"] = "Турция"
countryDict

// удаляем элемент, 2 способа:
countryDict["TUR"] = nil
countryDict.removeValue(forKey: "FRA")
countryDict



// 8.4. Создание пустого словаря. 2 варианта:
let emptyDictionary: [String:Int] = [:]
let anotherEmptyDictionary = Dictionary<String, Int>()


// с помощю [:] можно уничтожить все элементы словаря если проинициализировать
var birthYears = [1991: ["John", "Ann", "Vasiliy"], 1993: ["Alex", "Boris"]]
birthYears = [:]
birthYears



// 8.5. Базовые свойства и методы словарей

var someDictionary = ["One": 1, "Two": 2, "Three": 3]
someDictionary.count                                     // количество элементов в словаре

var emptyDict: [String:Int] = [:]                        // если словарь пустой, то count = 0, isEmpty возвращает true
emptyDict.count
emptyDict.isEmpty

let keys1 = countryDict.keys                             // получить все ключи словаря
keys1

let values1 = countryDict.values                         // получить все значения словаря
values1



// переобразуем в множество
let keysSet = Set(keys1)
keysSet

// переобразуем в массив
let valuesArray = Array(values1)
valuesArray



/*
 
 8.7 Где использовать словари
 
 Словари используют для хранения переменного множества однотипных значений с кастомными индексами.
 Прядок добавления элементов не сохраняется. */

// Пример:
let capitals = ["Poland": "Warschawa", "USA": "Washington"]
let numbers = ["one": 1, "two": 2, "three": 3]
let symbolsCrypt = ["a": "z", "b": "x", "c": "w"]





