import Foundation


// ОПЕРАТОРЫ УПРАВЛЕНИЯ (Урок 4 - Ian Solomein)

// if else


let thirdCard = 7
let seventhCard = 11

// Стандартный синтаксис оператора if
if thirdCard + secondCard >= 18 {
    print("You are win")
} else {
    print("It's regular combination ")
}



let age1 = 17
let age2 = 21

// Оператор && - и
if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

// Оператор || - или
if age1 > 18 || age2 > 18 {
    print("At least one over 18")
}


let cards1 = 12
let cards2 = 20

if cards1 > 1 && cards2 > 20 {
    print("Плохая комбинация")
} else {
    print("Хорошая комбинация")
}



// ЛОГИЧЕСКИЕ ОПЕРАТОРЫ !а - не а, && - и, || - или.
let areYouHappy = false

if !areYouHappy {        // !a - не а.
    print("Good for you")
} else {
    print("What can I do for you?")
}


if cards1 != cards2 {
    print("Cards 1 and 2 the same")
} else {
    print("Cards 1 and 2 are different")
}



let nextday = false

if !nextday {
    print("Not good")
} else {
    print("Very good")
}



let isTheWeatherGood = true

if areYouHappy && isTheWeatherGood { // && - будет false если хотяб один оперсант будет false
    print ("Go outside")
} else {
    print("Stay home")
}



let haveMoney = true
let goodWather = false

if haveMoney && goodWather {
    print("We gong to resturante")
} else {
    print("We going to resturante on the car")
}



let todayHaveMoney = false
let nextDayHaveMoney = true
if todayHaveMoney && nextDayHaveMoney {
    print("I go to resturante")
} else {
    print("I'll go to resturante tomorrow ")
}



let isTheWeatherNextDay = false
if areYouHappy || isTheWeatherNextDay {  // || - будет false если оба оперсанта будут false
    print ("Go outside")
} else {
    print("Stay home")
}



if haveMoney || goodWather {
    print("Go to resturante")
} else {
    print("Stay home")
}



let fistCard = 9
let secondCard = 11

// Расширенный синтаксис оператора if
if fistCard + secondCard == 21 {
    print("You are win")
} else if (fistCard + secondCard) > 18 && (fistCard + secondCard) < 21 {
    print("Good cards")
} else {
    print("Its regular cards")
}



//                                      Книга Усова. 6 издание



// 10.1. Утверждения


/*
 
 Утверждение с двумя аргументами
 assert(someVar > 100, "Данные неверны")
 
 Утверждаение с одним аргументом
 assert(anotherVar <= 10)
 
 */



// Пример:
let strName = "Дракон"
let strYoung = "молод"
let strOld = "стар"
let strEmpty = " "



//var dragonAge = 220
//
//// assert
//assert(dragonAge <= 235, strName+strEmpty+strOld)   // утверждение true - программа продолжает свою работу
//assert(dragonAge >= 225, strName+strEmpty+strYoung)     // утверждение false - программа останавливает свою работу
//assert(dragonAge == 200, "Дракону не 200")
//print("Программа успешно завершила свою работу")



// Оператор условия if - возвращает только true либо false!
var userName = "Alex"
if userName == "Alex" {
    print("Привет, администратор")
}


var logicVar = true

// стандартный вариант
if logicVar == true {
    print("Переменная logicVar истина")
}

// сокращенный вариант
if logicVar {
    print("Переменная logicVar истина")
}

logicVar = false
if logicVar {
    print("Переменная logicVar истина")
}


logicVar = false

// полная форма проверки на отрицание
if logicVar == false {
    print("Переменная logicVar ложна")
}


// сокращенная форма проверки на отрицание
if !logicVar {
    print("Переменная logicVar вновь ложна")
}



// if else

var userName1 = "Alex"
if userName1 == "Alex" {
    print("Привет администратор")
} else {
    print("Привет пользователь")
}



var logicVar1 = false
if logicVar {
    print("Переменная истина")
} else {
    print("Переменная ложна")
}



var a = 1054
var b = 952

if a+b > 1000 {
    print("сумма больше 1000")
} else {
    print("сумма меньше 1000")
}



var firstLogicVar = false
var secondLogicVar = false

if firstLogicVar || secondLogicVar {
    print("Одна или две переменны истины")
} else {
    print("обе переменны ложны")
}



// вложенный оператор условия в друг друга
if firstLogicVar && secondLogicVar {
    print("Две переменны истины")
} else {
    if firstLogicVar || secondLogicVar {
        print("Только одна из двух перемен ложная")
        
    } else {
        print("Снова обе переменны ложны")
    }
}



var userName2 = "Piter"

if userName2 == "Alex" {
    print("Привет администратор")
} else if userName2 == "Brazil" {
    print("Привет модератор")
} else if userName2 == "Helga" {
    print("Привет редактор")
} else {
    print("Привет пользователь")
}



