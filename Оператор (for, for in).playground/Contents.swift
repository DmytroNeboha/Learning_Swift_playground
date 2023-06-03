import Foundation



// Книга Усова, 6 издание


// 10.5. Оператор повторения for
let numArray: Array<Int> = [1, 2, 3, 4, 5]
var result: Int = 0

for number in numArray {
    result += number
}
result  // 15


// аналогично, только передадим диапазон
var result1: Int = 0
for number1 in 1...5 {
    result1 += number1
    print(number1)
}
result1


// передадим строку и распичатаем по букве в консоле
for number2 in "Swift" {
    print(number2)
}



// пример того как внешние переменные и константы не пересекаются с одноименными внутреними в цикле for in
var myChar = "a"
let myString = "Swift"

// цикл использует связанный параметр с именем, уже используемым глобальной переменной
for myChar in myString {
    // локальная константа вне цикла уже существует с таким именем
    let myString = "Char is"
    print("\(myString) \(myChar)")
}
myChar
myString



// когда нужно просто 3 раза что-то повторить
for _ in 1...3 {
    print("Повторяющеяся строка")
}



// создадим Dictionary
var countriesAndBlocks = ["Украина": "СНГ", "Франция": "ЕС"]

for (countryName, orgName) in countriesAndBlocks {
    print("\(countryName) вступила в \(orgName)")
}


// если нужно использовать только ключи
var countriesAndBlocks1 = ["Украина": "СНГ", "Франция": "ЕС"]

for (_, orgName) in countriesAndBlocks {
    print("Организация - \(orgName)")
}



// если хотим получить последовательность состоящую из ключей или значений, можно исп. keys, value
var countriesAndBlocks2 = ["Украина": "СНГ", "Франция": "ЕС"]

for countryName2 in countriesAndBlocks.keys {
    print("Страна - \(countryName2)")
}
for orgName2 in countriesAndBlocks2.values {
    print("Организация - \(orgName2)")
}



// если при работе с массивом для каждого элемента значения требуется получить и индекс - исп. метод enumerated()
print("Немного фактов обо мне:")
let myMusicStyles = ["Rock", "Jazz", "Pop"]

for (index, musicName) in myMusicStyles.enumerated() {
    print("\(index + 1). Я людблю \(musicName)")
}



// Функция stride(from:through:by:)
for i in stride(from: 1, through: 10, by: 3) {
    print(i)
}

// to - исключает данное значение - 10
for i in stride(from: 1, to: 10, by: 3) {
    print(i)
}


// вычислянем сумму всех не чётных чисел c помощю функции stride(from:through:by:)
var result9 = 0
for i in stride(from: 1, through: 1000, by: 2) {
    result9 += i
}
result9



// Использование where в коснтрукции for-in
var result10 = 0
for i in 1...10 where i % 2 == 0 {
    result10 += i
}
result10



// с помощю where можно уйти от использования вложенных друг в друга операторов for в if
var isRun = true

// вариант 1
if isRun {
    for _ in 1...10 {
        // тело оператора
    }
}

// вариант 2 - более читабельно. Но если isRun будет false, то это будет нагружать систему, оператор будет проверать всё 10 раз.
for _ in 1...10 where isRun {
    // тело оператора
}



// Многомерные коллекции в конструкции for-in


// словарь с результатом игры
let resultOfGames = ["Red Wings": ["2:1", "2:3"], "Capitals": ["3:6", "5:5"], "Penguins": ["3:3", "1:2"]]

for (teamName, results) in resultOfGames {
    for oneResult in results {
        print("Игра с \(teamName) - \(oneResult)")
    }
}



// Использование сontinue в конструкции for-in
for i in 1...10 {
    if i % 2 == 0 {
        continue
    } else {
        print(i)
    }
}



// используется break в конструкции for-in
for i in 1... {
    let randNum = Int(arc4random_uniform(10))
    if randNum == 5{
        print("Итерация номер \(i)")
        break
    }
}


mainLoop: for i in 1...5 { // mainLoop: - метка - произвольный набор символов, ставится перед оператором повторения и отделяется от него двоеточием
    for y in i...5 {
        if y == 4 && i == 2 {
            break mainLoop
        }
        print("\(i) - \(y)")
    }
}



// Оператор досрочного выхода guard

// guard - выполняет код только когда значение вернуло false





