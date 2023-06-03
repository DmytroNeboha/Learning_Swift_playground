import Foundation


// видео Ian Solomein



// Switch (кейсы)
let weather = "sunny"

switch weather {
case "rain": print("Bring an umbrella")
case "snow": print("Wrap up warm")
case "sunny": print("Wear glasses")
default: print("Enjoy your day")
}


let weather1 = "Good wether"

switch weather1 {
case "raine": print("Bring un umbrella")
case "snow": print("Wrap up warm")
case "Good wether": print("Wear new glasses")
default: print("Enjoy your day")
}



var agePeople = 11
switch agePeople {
case 0...10: print("You are too young")
case 13..<20: print("You are teenager")
case 20...60: print("You are grown man")
case 80: print("You are old man")
default: print("How old are you?")
    
}

let youAge = 23
switch youAge {
case 0...10: print("Young")
case 11...20: print("Teenager")
case 22...30: print("Grown man")
default: print("How old are you?")
}






// Книга Усова, 6 издание.


let userMark = 4


// if else if
if userMark == 1 {
    print("Единица на экзмене это ужасно")
} else if userMark == 2 {
    print("С двойкой остаешся на второй год")
} else if userMark == 3 {
    print("Плохо учил материал в этом году")
} else if userMark == 4 {
    print("Уже хорошо")
} else if userMark == 5 {
    print("Бесплатное место в университете обеспеченно")
} else {
    print("Некоректные данные об оценке")
}


// пример выше можно более удобно исполнить с помощю switch.
switch userMark {
case 1,2:
    print("Экзамен не сдан")
case 3:
    print("Необходимо выполнить дополнительное задание")
case 4, 5:
    print("Экзамен сдан")
default:
    print("Указана некорректная оценка")
}


// улучшим код выше - вынесем функцию print за предел оператора switch
let messege: String
switch userMark {
case 1:
    messege = "Единица на экзмене это ужасно"
case 2:
    messege = "С двойкой остаешся на второй год"
case 3:
    messege = "Плохо учил материал в этом году"
case 4:
    messege = "Уже хорошо"
case 5:
    messege = "Бесплатное место в университете обеспеченно"
default:
    messege = "Указана некорректная оценка"
}

print(messege)



// Диапазоны в операторе switch
let userMark1 = 4

switch userMark1 {
case 1..<3:
    print("Экзамен не сдан")
case 3:
    print("Необходимо выполнить дополнительное задание")
case 4...5:
    print("Экзамен сдан!")
default:
    assert(false, "Указана некоректная оценка") // утвеждение, прерывающее програму
}



// Кортежи в операторе switch
var answer: (code: Int, message: String) = (code: 399, message: "Page not found")

switch answer {
case (100..<400, _):
    print(answer.message)
case (400..<500, _):
    assert(false, answer.message)
default:
    print("Получен некоректный ответ")
}


// Задача - определить дракона в какой вольер поместить.
/*
 
 Вольер 1 - для зеленых драконов с массой менее двух тонн.
 Вольер 2 - для красных драконов с массой менее двух тонн.
 Вольер 3 - для красных и зеленых с массой более двух тонн.
 
 */

let dragonCharacteristics: (color: String, weight: Float) = ("красный", 2.1)

switch dragonCharacteristics {
case ("зелёный", 0..<2):
    print("Вольер 1")
case ("красный", 0..<2):
    print("Вольер 2")
case ("зелёный", 2...), ("красный", 2...):
    print("Вольер 3!")
default:
    print("Мы не можем принять в стаю")
}



// Ключевое слово where в операторе switch

// дополнительное условие для вольеров: пометить дракона в вольер №3 можно только если там меньше 5 особей.
let dragonCharacteristics1: (color: String, weight: Float) = ("красный", 3)

var dragonsCount = 4
switch dragonCharacteristics1 {
case ("зелёный", 0..<2):
    print("Вольер 1")
case ("красный", 0..<2):
    print("Вольер 2")
case ("зелёный", 2...) where dragonsCount < 5,
                                            ("красный", 2...) where dragonsCount < 5:
    print("Вольер 3!!")
default:
    print("Мы не можем принять в стаю")
}



// Связываение значений


// дополнительное условие для вольеров: можно принять в 3 вольер дракона чей вес без остатка делится на еденицу.
let dragonCharacteristics2: (color: String, weight: Float) = ("красный", 3)

var dragonsCount2 = 4
switch dragonCharacteristics2 {
case ("зелёный", 0..<2):
    print("Вольер 1")
case ("красный", 0..<2):
    print("Вольер 2")
case ("зелёный", 2...) where dragonCharacteristics2.weight.truncatingRemainder(dividingBy: 1) == 0 && dragonsCount2 < 5,
                                                                                                                      ("красный", 2...) where dragonCharacteristics2.weight.truncatingRemainder(dividingBy: 1) == 0 && dragonsCount2 < 5:
    print("Вольер 3!!!")
default:
    print("Мы не можем принять в стаю")
}



// Связываение значений
// уходим от использования dragonCharacteristics2 в операторе switch, тк в будущем при изменении имени придется делать много  правок в switch
let dragonCharacteristics3: (color: String, weight: Float) = ("красный", 3)

var dragonsCount3 = 4
switch dragonCharacteristics3 {
case ("зелёный", 0..<2):
    print("Вольер 1")
case ("красный", 0..<2):
    print("Вольер 2")
case ("зелёный", let weight) where weight > 2 && weight.truncatingRemainder(dividingBy: 1) == 0 && dragonsCount3 < 5,
                                                                                                                   ("красный", let weight) where weight > 2 && weight.truncatingRemainder(dividingBy: 1) == 0 && dragonsCount3 < 5:
    print("Вольер 3!!!!")
default:
    print("Мы не можем принять в стаю")
}


// сокращаем код выше
let dragonCharacteristics4: (color: String, weight: Float) = ("красный", 3)
var dragonsCount4 = 4

switch dragonCharacteristics4 {
case ("зелёный", 0..<2):
    print("Вольер 1")
case ("красный", 0..<2):
    print("Вольер 2")
case let (color, weight) where
    (color == "зелёный" || color == "красный" ) && weight.truncatingRemainder(dividingBy: 1) == 0 && dragonsCount4 < 5:
    print("Вольер 3!!!!!")
default:
    print("Мы не можем принять в стаю")
}



// Оператор break в конструкции switch-case

let someInt = 0
switch someInt {
case 1...:
    print("Больше 0")
case ..<0:
    print("Меньше 0")
default:
    break               // данные не входят в наш кейс поэтому выражение останавливает свою работу (игнорируется)
}



// Ключевое слово faullthrough

// реализация мероприятия от уровня к уровню.

let level: Character = "Б"

switch level {
case "A":
    print("Выключить все эелктрические приборы")
    fallthrough
case "Б":
    print("Закрыть входные двери и окна")
    fallthrough
case "В":
    print("Соблюдать спокойствие")
default:
    break
}
