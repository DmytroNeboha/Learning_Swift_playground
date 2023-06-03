import Foundation


// Базовые ОПЕРАТОРЫ. (Урок 3 - Ian Solomein)



// Унарные префиксные: -а, !b, (постфиксные c!) - это будет позже
// Оператор ЗАМКНУТОГО / ЗАКРЫТОГО диапазона - (а...b), оператор полузамкнутого/полузакрытого диапазона - (а..<b) - это будет в Теме "Циклы for in"


// Бинарные: 1 + 2


// Оператор присваивания: =
let x = 22
let y = 5



// Арифметические операторы: +, -, *, /,
x + y
x - y
x * y
x / y



// Конкотинация строк (сложение строк): +
let hh = "Hello "
let p = "Swift"
let g = hh + p



// Остаток от деления: %
let result = x % y
print(result)



// Составные операторы присвыивания: +=, -=
var ab = 2
ab += 5
print(ab)
ab -= 1
ab += 2



var count = 0
count += 1
print(count)



// опператоры сравнения  ==, !=, >, <, >=, <=
let q = 10
let s = 7

x == s
q != s
q > s
q < s
q >= s
q <= s



// Тернарный условный оператор: a ? b : c - если а true выполняем b, если false выполняем с
var firstCards = 21
let secondCards = 22

firstCards == secondCards ? print("Cards are the same") :  print("Cards are different") // пример тернарного оператора
firstCards != secondCards ? print("Cards are different") :  print("Cards are the same") // пример тернарного оператора



var cards1 = 20
var cards2 = 20
cards1 += 1
firstCards

cards1 == firstCards ? print("Cards 1 and 2 the same") : print("Cards 1 and 2 are different")



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


