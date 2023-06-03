import Foundation
import os

// Clousers (клоужеры/замыкания). Ian Solomein. Урок 12



/*
 
 {  (параметры) -> тип результата in
 
 тело клоужера (выражение)
 
 }
 
 */


// Клоужер
let driving = {
    print("I'm driving in my car")
}

driving()


// in - обозначает конец списка параметров клоужера



// Принимать параметры
let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving2("Lviv")



// Функция которая принимает строку и целое число
func pay(user: String, amount: Int) {
    // code
}



let payment = {(user: String, amount: Int) in
    // code - тело клоужера
}


// Пример тюпла, в чем разница с клоужером
// let payment2 = (user: String, amount: Int)



// Клоужер кторый возращает строку, а не печатает её на прямую
let drivingWithReturn = {(place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("Odesa")
print(message)


// Клоужер принимает один параметр и ничего не возращает
let payment2 = { (user: String) in  // так как клоужер ничего не возращает можно написть -> Void in
    print("Paying \(user)...")
}

let userPayed = payment2
userPayed("Alex")


// Клоужер который принимает одина парметр и возращает один параметр типа аданных Bool
let payment3 = {(user: String) -> Bool in
    print("Paying \(user)...")
    return true
}
payment3("now")


let payment4 = {() -> Bool in
    print("Paying...")
    return true
}



// базовый клоужер передаём в функцию для запуска его в самой функции
let driving3 = {                                // 1й вариант
    print("I'm driving in my car")
}

// () -> Void  - клоужер ничего не принимает и ничего не возращает
func travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived")
}

travel(action: driving3)                       // 1й вариант


// трейлинг клоужер синтаксис               2й вариант. Только если последним параметром в функции является клоужер
travel {
    print("I'm driving in my car")
}



// функция принимает Double и клоужер который ничего не принимает и ничего не возвращает
func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation")
    animations()
}



// 1-й вариант вызова функции animate. Не очень красивый из-за скобки в конце
animate(duration: 3, animations: {
    print("Image")
})


// 2-й вариант вызова функции animate. Более красивый, но можно делать если клоужер в конце функции
animate(duration: 3) {
    print("Image 2")
}



// Часть 2. Видео 13



// функция travel с одним параметром action в котором клоужер, который принимает String и ничего не возращает
func travel2(action: (String) -> Void) {
    print("I'm getting ready to go!")  // внутри функции
    action("London") // клоужер
    print("I arrived!") // внутри функции
}

travel2 { (place: String) in
    print("I'm going to \(place) in my car")
}



// математичні дії
var summ1 = { (num1: Int, num2: Int) -> Int in
    return num1 + num2
}

func mult(num1: Int, num2: Int) -> Int {
    return num1 * num2
}


func calculate(number1: Int, number2: Int, action: (Int, Int) -> Int) -> Int {
    return action(number1, number2)
}

calculate(number1: 10, number2: 3, action: summ1)
calculate(number1: 3, number2: 3, action: mult(num1:num2:))







// клоужеры сами по себе принимают параметры
let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}

// функция принимает два параметра: name и engine - представляет из себя клоужер, который принимает целое число и ничего не возвращает
func buildCar(name: String, engine: (Int) -> Void) {
    // build the car
}



// функция принимает String и возращает String
func travel3(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

// 1 вариант (полная версия) - вызов функции travel3
travel3 {(place: String) -> String in
    return "I'm going to \(place) in my car"
}


// 1 вариант (сокращённая версия) - вызов функции travel3 в сокращенной форме + сокращенное имя параметра
travel3 {
    "I'm going to \($0) in my car"
}



// Функция принимает клоужер как единственный параметр, данный клоужер принимает String и Int + возращает String
func travel4(action: (String, Int) -> String) {
    print("I'm getting ready to go.")  // тело функции
    let description = action("London", 60) // клоужер
    print(description)      // клоужер
    print("I arrived!")  // тело функции
}

// вызов функции travel4 в скоращенной форме(трейлинг клоужер синтаксис) + сокращение имен параметров(желательно применять когда 1-2 параметра)
travel4 {
    "I'm going to \($0) at \($1) miles per hour"
}



// функция travel5 ничего не принимает но возвращает клоужер принимающтй строку и ничего не возвращает
func travel5() -> (String) -> Void {
    return {
        print("I'm going to \($0)")   // клоужер
    }
}

let result = travel5()
result("London")




// Захват значений. Как часто возращаемый клоужер запрашивается. Например, мы хотим отследит как часто возращаемый клоужер запрашивается
func travel6() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")  // клоужер
        counter += 1
    }
}

let result2 = travel6()
result2("London")
result2("London")
result2("London")




// Книга Усова, 6 издание



// 13.1. Виды замыкания (closure)


// 13.2. Безимянные функции:
let functionInLet = { return true }
functionInLet()


// массив с купюрами
var wallet = [10, 50, 100, 100, 5000, 100, 50, 50, 500, 1000]

// функция отбора купюр
func handle100(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if banknote == 100 {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}

handle100(wallet: wallet)


// расширим функцию выше
func handleMore1000(wallet: [Int]) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if banknote >= 1000 {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}

handleMore1000(wallet: wallet)


// в резултате отбора купюр реализовано уже 2 функции. В дальнейшем будет появляться больше таких функций. Для решения проблемы дублирования:

/*
 
 - реализоваь всю функциональность отбора купюр в одной функции, а в качества аргументов передавать условие (функция будет очень большой и нечитабельной)
 - реализовать всю функциональность в виде 3х функций: первая будет груперовать повторяющиеся код и принимать в виде аргумента одну из двух функций. Переданная функция будет производить проверку условия в теле главной функции.
 
 */


// единая функция формирования результирующего массива
func handle(wallet: [Int], closure: (Int) -> Bool) -> [Int] {
    var returnWallet = [Int]()
    for banknote in wallet {
        if closure(banknote) {
            returnWallet.append(banknote)
        }
    }
    return returnWallet
}

// функция сравнения с числом 100
func compare100(banknote: Int) -> Bool {
    return banknote == 100
}
// функция сравнения с числом 1000
func compareMore1000(banknote: Int) -> Bool {
    return banknote >= 1000
}

// отбор
let resultWalletOne = handle(wallet: wallet, closure: compare100)
let resultWalletTwo = handle(wallet: wallet, closure: compareMore1000)



// в подобной ситуации выше можно отказаться от создания отдельных функций и передавать в handle(wallet:closure:) условие отбора в виде безымянной функции.



// отбор купюр достоинством выше 1000 аналог передачи compareMore1000
handle(wallet: wallet, closure: { (banknote: Int) -> Bool in
    return banknote >= 1000
})

// отбор купюр достоинством 100, аналог передачи compare100
handle(wallet: wallet, closure: {(banknote: Int) -> Bool in
    return banknote == 100
})



// 13.3. Возможности замыканий



// Пропуск указания типов

// отбор купюр достоинством выше 1000
handle(wallet: wallet, closure: { banknote in
    return banknote >= 1000
})



// Неявное возвращение значения
handle(wallet: wallet, closure: { banknote in banknote >= 1000})



// Сокращенные имена параметров
handle(wallet: wallet, closure: {$0 >= 1000})



// Вынос замыкания за скобки
handle(wallet: wallet) { $0 >= 1000 }


handle(wallet: wallet) { banknote in
    for number in Array(arrayLiteral: 100, 500) {
        if number == banknote {
            return true
        }
    }
    return false
}

// аналогично коду выше можно:
let successBanknotes = handle(wallet: wallet) { [100, 500].contains($0) }
successBanknotes



// Вынос несколько замыканий за скобки
func networkQuery(url: String, success: (String) -> (), error: (Int) -> () ) -> () {
    // код запроса на сервер
}


// классический вариант
networkQuery(url: "https://weather.com", success: {data in}, error: { errorCode in })


// новый вариант (часто используют в SwiftUI)
networkQuery(url: "https://weather.com") { data in
    // ...
} error: { errorCode in
    // ...
}



// 13.4 Безымянные функции в параметрах


let closure: () -> Void = {
    print("Замыкающее выражение")
}

closure()



// передача в функцию строкового значения
let closurePrint: (String) -> Void = { text in
    print(text)
}
closurePrint("Text")



// передача в функцию целочисленных значений с осуществлением доступа черех краткий синтаксис $0 и $1
var sum: (_ numOne: Int, _ numTwo: Int) -> Int = {
    $0 + $1
}
sum(10, 34)



// 13.5. Пример использования замыканий при сортировке массива


let array = [1, 44, 81, 4, 277, 50, 101, 51, 8]
var sortedArray = array.sorted(by: { (first: Int, second: Int) -> Bool in
    return first < second
})

sortedArray


/*
 
 Теперь применим все расмотренные способы оптимизации замыкающих выражений
 
 - уберем функциональный тип замыкания
 - уберем оператор return
 - заменим имена переменных именами сокращенной формой
 
 */

sortedArray = array.sorted(by: {$0 < $1})
sortedArray

// ещё сократим, так как в коде выше один бинарный оператор, то можно убрать имена параметров
sortedArray = array.sorted(by: <)



// 13.6. Захват переменных


var a = 1
var b = 2
let closureSum: () -> Int = {
    a + b
}

closureSum()
a = 3
b = 4
closureSum()


// замыкание захватывает первоначальное значение a и b
var x = 1
var y = 2
let closureSum2: () -> Int = { [a, b] in
    a + b
}

closureSum2() // 7
x = 5
y = 5
closureSum2() // 7



// Захват вложенной функции
func makeIncrement(forIncrement amount: Int) -> () -> Int {
    var runingTotal = 0
    func increment() -> Int {
        runingTotal += amount
        return runingTotal
    }
    return increment
}

var incrementByTen = makeIncrement(forIncrement: 10)
var incrementBySeven = makeIncrement(forIncrement: 7)
incrementByTen()
incrementByTen()
incrementByTen()
incrementBySeven()
incrementBySeven()
incrementBySeven()



// 13.7. Замыкания передаются по ссылке


var incrementByFive = makeIncrement(forIncrement: 5)
var copyIncrementByFive = incrementByFive

incrementByFive()
copyIncrementByFive()
incrementByFive()



// 13.8. Автозамыкания


var arrayOfNames = ["Helga", "Brazil", "Alex"]
func printName(nextName: String) {
    print(nextName)
}

printName(nextName: arrayOfNames.remove(at: 0))


// ленивое замыкание
func printName2(nextName: () -> String) {
    // ...
    print(nextName())
}

printName2(nextName: {arrayOfNames.remove(at: 0) })


// перепишем код выше
func printName3(nextName: @autoclosure () -> String) {         // почитати доку
    print(nextName())
}
printName3(nextName: arrayOfNames.remove(at: 0))



// 13.9. Входящие (сбегающие) замыкания


// * если передаём замыкание в ввиде параметра, можно использовать модификатор inout вместо @escaping
var arrayOfClosures: [() -> Int] = []

func addNewClosureInArray(_ newClosure: @escaping () -> Int) {
    arrayOfClosures.append(newClosure)
}

addNewClosureInArray({return 100})
addNewClosureInArray({return 1000})
arrayOfClosures[0]()
arrayOfClosures[1]()
