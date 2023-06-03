import Foundation

// ОПЦИОНАЛЬНЫЕ ТИПЫ ДАННЫХ - nil.  (Урок 7 - Ian Solomein)





// nil - полное отсутствие какого-либо значения

// 1. Жесткое (прямое) извлечение из-под опционала (force unwrapping) - !
var nameCompany: String? = "KFC"
print(nameCompany!)



if nameCompany == nil {
    print("It's nil")
} else {
    print (nameCompany!)
}



var str5 = "5a"
var number5 = Int(str5) // nil



// 2. Косвенное извелечение из-под опционала с помощю ветвлей?
// 3. Оператор опционального объеденения (optional binding)
var yourAge: Int? = nil
if var safeAge = yourAge {
    safeAge += 1
    print(safeAge)
    
}




var name: String? = nil
let defaultName = "Гость"
let nameForGretting = name ?? defaultName
print("Привет, \(nameForGretting)")


var number12: Int! = nil
number12 = 10
number12 += 7



// Задача 1: *имя и возраст. * - объязательно указывать. Нужно вывести полную информацию о человеке в консоле.

let nameUser = "Alex"
var ageUser: Int? = 25

ageUser != nil ? print("Name: \(nameUser), Age: \(ageUser!)") : print("Age \(nameUser)")

// Задача 2: имя и *возраст. * - объязательно указывать. Нужно вывести полную информацию о человеке в консоле.

var nameNextUser: String? = ""
let ageNextUser = 19

nameNextUser != nil ? print("Name: \(nameNextUser!), Age: \(ageNextUser)") : print("Age: \(ageNextUser)")




// Книга Усова, 6 изданеие.


let possibleString = "1945"
let convertPossibleString = Int(possibleString)     // опциональный Int

let unpossibleString = "Одна тысяча сто десять"
let convertUnpossibleString = Int(unpossibleString) // опциональный Int

// определим тип данных
type(of: convertPossibleString)
type(of: convertUnpossibleString)


let x1 = Int("12")
let x2 = Int("4.2")

type(of: x1)
type(of: x2)



// Пример полной формы записи опционала:
let optionalCharacter: Optional<Character> = "A"

// Пример сокращеннй формы записи опционала:
let optionalCharacter1: Character? = "A"

// И пример сокращённой формы записи опционала без заданого значения:
let optionalCharacter2: Character?


// можно прям сразу указать, что эта переменная может в какой-то момент не иметь вообще значения
var xCoordinate: Int? = 12 // 12

xCoordinate = 5            // теперь 5
xCoordinate = nil          // теперь никаких нет значений
xCoordinate = 7            // теперь 7



// если мы создадим переменную типа опционал, но не проинициалировать её значение, то по умолчанию будет равна nil
var someOptional: Bool?


// также для создания опционала помимо явного указания типа можно использовать функцию Optional(_:)
var optionaVar = Optional("StringValue")
optionaVar = nil
optionaVar
type(of: optionaVar)



// Опционалы в кортежах
var tuple: (code: Int, message: String)? = nil
tuple = (404, "Page not found")


// можно использовать опционал для отдельных элементов кортежа
var tupleWithOptElements: (Int?, Int) = (nil, 100)



// 11.2. Извлечение опционального значения


// нельзя производить прямые операции с разными типами даных
let a: Int = 4
let b: Int? = 6
// a+b  - ошибка


// Чтобы можно было производить операции опционал c другим базовым типом данных, выделют 3 способа:

/*
 
 1. Принудительное извлечение (force unwrapping) - не безопасный метод
 2. Косвеное извлечение (implicity unwrapping)
 3. Операции объединение с nil (optional binding)
 
 */



// 1. Принудительное извлечение значения опционала (force unwrapping)
var optVar: Int? = 12
var intVar: Int = 34
let result = optVar! + intVar       // знак ! - принудительное извлечение значения опционала
type(of: result)    // базовый тип даных Int



// 2. Косвенное извлечение значения (implicity unwrapping)
var wrapDouble: Double! = 3.14
wrapDouble + 0.12
wrapDouble


// 11.3. Проверка наличия значения в опционале

let optOne: UInt? = nil
let optTwo: UInt? = 32

optOne != nil
optTwo != nil



// если 5-ки есть, то вычесляем количество пироженных, которые нужно приобрести в качестве награды
var fiveMarkCount: Int? = 8
var allCakesCount = 0

if fiveMarkCount != nil {
    let cakeForEachFiveMark = 2
    allCakesCount = cakeForEachFiveMark * fiveMarkCount!    // ставим знак ! так как проверку уже сделали, поэтому это безопасно делать
}

allCakesCount



// 11.4. Опциональное связывание (optional binding)
let markCount: Int? = 8

// при проверке создаём константу и говорим - если в markCount что-то есть, то передай в эту константу, а потом распечатай, что туда передалось
if let mark = markCount {                      // тут НЕ можем заменить имя константы на _ так как имя используется в функции print
    print("Всего \(mark) оценок")
}

// ещё один такой пример
var pointX: Int? = 10
var pointY: Int? = 3

if let _ = pointX, let _ = pointY {             // если мы используем константу только внутри оператора, то имя можно не писать, а оставить _
    print("Точка установлена на плоскости")
}


if let x = pointX, x > 5 {
    print("Точка очень далеко от вас")
}



// 11.5. Опциональное связывание как часть оптимизация кода
var coinsInNewChest = "140"
var allCoinsCount = 1301

if Int(coinsInNewChest) != nil {
    allCoinsCount += Int(coinsInNewChest)!
} else {
    print("У нового дракона отсутствует золото")
}


// пример оптимального кода выше
let coinsInNewChest1 = "140"
var allCoinsCount1 = 1301

var coins = Int(coinsInNewChest1)
if coins != nil {
    allCoinsCount1 += coins!
} else {
    print("У нового дракона отсутствует золото")
}


// ещё больше оптимизируем код. Избавились от повторного вызова функции Int(_:) и минимизировали затраты оперативной памяти
let coinsInNewChest2 = "140"
var allCoinsCount2 = 1000

if let coins2 = Int(coinsInNewChest2) {
    allCoinsCount2 += coins2
} else {
    print("У нового дракона отсутствует золото")
}



// 11.6. Оператор объединения с nil (nil coalescing).
// оператор ?? возвращает либо значение опционала, либо значение по умолчанию(если опционал равен nil)


let optionalInt: Int? = 20
var mustHaveResult = optionalInt ?? 0   // переменная mustHaveResult приняла 20, так как там есть значение. Если optionalInt = nil, то mustHaveRessult приняла 0.


// код ниже аналогичен верхнему
let optionalInt1: Int? = 20
var mustHaveResult1: Int = 0

if let unwrapped = optionalInt1 {
    mustHaveResult1 = unwrapped
} else {
    mustHaveResult1 = 0
}



// !!! наиболее безопасным способом извлечения значений из опционалов является Опциональное связывание и nil coalescing
