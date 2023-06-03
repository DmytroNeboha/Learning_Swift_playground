import Foundation

// Функции. Ian Solomein, урок 11


// объявление функции
func greetings() {
    print("Hello, Swift")
}


// Вызываем функцию
greetings()



// Принимает параметры
func square(number: Int) {
    print(number * number)
    
}
square(number: 7)



// Возвращает параметр
func square1(number: Int) -> Int {
    number * number                 // return можно убрать так как у нас одно выражение
}

var result = square1(number: 8)
print(result)


func sum1() -> Int {
    5 + 5                           // return можно убрать так как у нас одно выражение
}



// Возвращать два или более значений функции
func getUser() -> [String] {
    ["Ivan", "Ivanov"]
}

let user = getUser()
print(user[0])



func getUser1() -> [String: String] {
    ["firstName": "Ivan", "secondName": "Ivanov"]
}

let user1 = getUser1()
print(user1["firstName"])



func getUser2() -> (first: String, second: String) {
    (first: "Ivan", second: "Ivanov")
}

let user2 = getUser2()
print(user.first)



// Имена параметров (внетреннего и внешнего имени)
func square2(number: Int) {
    print(number * number)
}

square2(number: 7)

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Ian")



// Пропуск имен параметров
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Ian")



// Параметры по умолчанию
print("Hello, world", terminator: " ")
print("Hello, world", terminator: " ")
print("Hello, world")



func greet1(_ person: String, nicely: Bool = true) {
    
    if nicely == true {
        print("Hello \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet1("Maria")
greet1("Alex", nicely: false)



// Вариативные функции и вариативные параметры - позволяют любое количество одного типа
print("Hello", "Hello2", "Hello3")


// Int...  (
func square2(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square2(numbers: 1, 2, 3, 4, 5)



// Сквозные параметры - если хотим изменить параметр на месте не передавая новое значение
func doubleIt(number: inout Int) {
    number *= 2
}

var myNumber = 10

doubleIt(number: &myNumber)




// Книга Усова, 6 издание. Функции


// входные параметры a и b
func myFirstFunc1(a: Int, b: String) {}
myFirstFunc1(a: 54, b: "Слово")



// функция принимает два апарметра типа Int, String, и возвращает String
func myFirstFunc2(a: Int, b: String) -> String {
    let word = "Swift"
    return String(a) + b + word
}



// 12.2. Входные параметры и возвращаемое значение


// Входные параметры
func sumTwoInt(a: Int, b: Int) {
    print("Результат операции - \(a + b)")
}

sumTwoInt(a: 10, b: 12)



// Внешние имена входных параметров
func sumTwoInt2(num1 a: Int, num2 b: Int) {
    print("Результат операции - \(a + b)")
}

sumTwoInt2(num1: 18, num2: 12)



// Без внешнего имени
func sumTwoInt3(_ a: Int, _ b: Int) {
    print("Результат операции - \(a + b)")
}

sumTwoInt3(10, 25)



// Возвращаемое значение
func SumTwoInt4(_ a: Int, _ b: Int) -> Int {
    let result = a + b
    print("Результат операции - \(result)")
    return result
}

SumTwoInt4(23, 23)



// Изменяемые копии входных параметров
func returnMessage(code: Int, message: String) -> String {
    var mutableMessage = message
    mutableMessage += String(code)
    return mutableMessage
}

var myMessage = returnMessage(code: 25, message: "Код сообщения - ")



// Сквозные параметры
func changeValue(_ a: inout Int, _ b: inout Int) -> Void {
    let tmp = a
    a = b
    b = tmp
}

var x = 150, y = 45
changeValue(&x, &y)
x
y



// Функция в качестве входного параметра
print(returnMessage(code: 400, message: "Сервер временно не доступен. Код сообщения - "))



// Входной параметр с переменным числом значений
func printRequestString(codes: Int...) -> Void {
    var codesString = ""
    for oneCode in codes {
        codesString += String(oneCode) + " "
    }
    print("Полуены ответы - \(codesString)")
}

printRequestString(codes: 2, 5, 10)
printRequestString(codes: 100, 34, 23)



// Кортеж в качестве возвращаемого значения
func getCodeDescription(code: Int) -> (code: Int, description: String) {
    let description: String
    
    switch code {
    case 1...100: description = "Error"
    case 101...200: description = "Correct"
    default: description = "Unknown"
    }
    
    return (code, description)
}

getCodeDescription(code: 25)

let request = getCodeDescription(code: 45)
request.description
request.code



// Значение по умолчанию для входного параметра
func returnMessage2(code: Int, message: String = "Код - ") -> String {
    message + String(code)
}

returnMessage2(code: 4)




// 12.3. Функциональный тип



// Простой функциональный тип

// функция ничего не принимает и ничего не возвращает
func someFunc() -> Void {}



// Сложный функциональный тип

// функция которая возвращает другую функцию которая ничего не возвращает: () -> () -> Void
// функция принимает Int возвращает функцию которая принимает значение String и возвращает Bool:  (Int) -> (String) -> Bool
// функция принимает на вход целое число и другую функцию, а возвращает логическое значение: (Int, (Int) -> Void) -> Bool




// 12.4. Функция в качестве входного и возвращаемого значениий


// Возвращаемое значение функционального типа
func printText() {
    print("Первая функция")
}

// функция, которая возвращает функцию
func returPrintTextFunction() -> () -> Void {
    print("Сейчас будет запущена первая функция")
    return printText
}

let newFunctionInLet = returPrintTextFunction()
newFunctionInLet()



// Входное значение функционального типа


// функция генерации случайного массива банкнот
func generateWallet(walletLength: Int) -> [Int] {
    let typesOfBanknotes = [50, 100, 500, 1000, 5000] // существующие типы банкнот
    var wallet: [Int] = []
    for _ in 1...walletLength {
        wallet.append(typesOfBanknotes.randomElement()!)
    }
    return wallet
}

// функция подсчета денег в кошельке:
func sumWallet(banknotesFunction wallet: (Int) -> [Int], walletLength: Int) -> Int? {
    let myWalletArray = wallet(walletLength)
    var sum: Int = 0
    
    for oneBanknote in myWalletArray {
        sum += oneBanknote
    }
    return sum
}

// передача функции в функцию
sumWallet(banknotesFunction: generateWallet, walletLength: 20)



// Параметры функционального типа для ленивых вычеслений
// ((Int) -> Int, (Int) -> Int) -> Int    - в эту функции передаем не результат двух функций, а сами две функции. Необходимое значение будет получено именно в момент, когда к нему произойдет обращение.



// 12.5. Возможности функций



// Вложеные функции
func oneStep(coordinates: inout (Int, Int), stepType: String) -> Void {
    func up(coords: inout (Int, Int)) {
        coords = (coords.0+1, coords.1)
    }
    
    func right(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1+1)
    }
    
    func down(coords: inout (Int, Int)) {
        coords = (coords.0-1, coords.1)
    }
    func left(coords: inout (Int, Int)) {
        coords = (coords.0, coords.1-1)
    }
    
    switch stepType {
    case "up": up(coords: &coordinates)
    case "right": right(coords: &coordinates)
    case "down": down(coords: &coordinates)
    case "left": left(coords: &coordinates)
    default: break
    }
}

var coordinates = (10, -5)
oneStep(coordinates: &coordinates, stepType: "up")
oneStep(coordinates: &coordinates, stepType: "right")
coordinates



// Перегрузка функций
func say(what: String) -> Void {}
func say(what: Int) -> Void {}

// в таком случае как выше мы должны явно указывать тип значения, пример ниже:

func cry() -> String {
    return "one"
}

func cry() -> Int {
    return 1
}

let resultString: String = cry()
let resultInt: Int = cry()



// Рекурсивный вызов - функция может вызывать саму себя
func countdown(firstNum num: Int) -> Void {
    print(num)
    if num > 0 {
        print(num)
        countdown(firstNum: num-1)
    }
}
countdown(firstNum: 2)
