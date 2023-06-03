import Foundation




// перечисления определяют общий тип для группы связанных значений.
// пересчисления как говорят - это "Типы первого класса в Swift"



let result = "failure"
let result2 = "failed"
let result3 = "fail"



// Определяем наше перечесление Result
enum Result {
    case success
    case failure
}

// защитили себя от использования разных строк
var result4 = Result.failure

// меняем значения
result4 = .success



let result5: Result

result5 = .success



// создаем новый Enum
enum Activity {
    case dancing
    case running
    case talking
    case singin
}


let currentActivity = Activity.dancing


// Проверяем c помощю switch нашу константу currentActivity.
// Работая с конструкцией switch перебирая case внутри enum нам defoult case не нужно писать, но мы объязаны перечислить все case этого enum.
switch currentActivity {
    
case .dancing: print("Dance")
case .running: print("Run")
case .singin: print("Song")
case .talking: print("Talk")
}


// асоциативные значения
enum Activity2 {
    case dancing
    case running(dectination: String)
    case talking(topic: String)
    case singin(volume: Int)
}

let talking = Activity2.talking(topic: "Football")



// В перечеслениях есть rawVoule. При определении чистых значений нужно определить их тип

// перечисление с типом данных Int. rawVoule = индексы по умолчанию ИЛИ явно заданные индексы
enum Planet: Int {
    case mercury // тут по умолчанию rawVelue = от 0 и т.д.
    case venus = 2 // можем явно указать своё rawVelue = 2
    case earth
    case mars
}

let earth = Planet(rawValue: 3)



// перечисление с типом данных String с явно задаными значениями. rawVoule = явно заданые значения
enum Phone: String {
    case Apple = "iPhone 8"
    case Samsung = "Galaxy S10"
    case Google = "Pixel 2"
}

// добираемся до rawVelue
var myPhone = Phone.Apple
print(myPhone)
print(myPhone.rawValue)



// перечисление с типом данных String с НЕ явно задаными значениями. rawVoule = будет строка с названием case
enum Phone2: String {
    case Apple // apple - строка с названием case
    case Samsung
    case Google
}

// добираемся до rawVelue
var myPhone2 = Phone2.Apple
print(myPhone2)
print(myPhone2.rawValue)



/*
 
 Резюмируем:
 
 1) Перечисления определяют общий тип для группы связаных значений, чтобы проще было их использовать
 2) Добраться к кейсу в перечислении можно через точку
 3) Также в перечислениях есть асоциативные значения которые помогают добавить нам больше информации о кейсе
 4) Также у перечислениях есть rawVaule или чистые значения так как иногда удобно присвоить значение нашим кейсам.
 
 
 */



// Книга Усова. 6 издание.



// 19.1. Синтаксис перечислений
// создаём перечисление Enum. Вариант записи 1:
enum CurrencyUnit {
    case euro
    case dollar
    
}


// создаём перечисление Enum. Вариант записи 2:
enum CurrencyUnit2 {
    case euro, dollar
}


// создание параметров и инициализация им членов перечисления CurrencyUnit
var euroCurrency: CurrencyUnit = .euro
var otherCurrenncy: CurrencyUnit = .dollar
otherCurrenncy = .euro
otherCurrenncy



// enum имеющее ассоциированные параметры
enum AdvancedCurrencyUnit {
    case euro(countris: [String], shortName: String)   // можно и не указывать именя параметров
    case dollar(countris: [String], shortName: String) // можно и не указывать имена параметров
}

// в этой константе хранится член перечисления euro с его ассоциативными параметрами - countris, shortName.
let euroCurrenncy: AdvancedCurrencyUnit = .euro(countris: ["German", "France"], shortName: "EUR")



// 19.2. Ассоциированные параметры. Вариант 1.

enum DollarCountries {
    case USA
    case Canada
    case Australia
}



enum AdvancedCurrencyUnit2 {
    case euro(countris: [String], shortName: String)
    case dollar(countris: DollarCountries, shortName: String)
}

var dollarCurrency: AdvancedCurrencyUnit2 = .dollar(countris: .USA, shortName: "USD")



// 19.3. Вложенные перечисления:
enum AdvancedCurrencyUnit3 {
    enum DollarCountries2 {      // enum DollarCountries2 обладает ограниченной областью видимости
        case USA
        case Canada
        case Australia
    }
    case euro(countris: [String], shortName: String)
    case dollar(nation: DollarCountries2, shortName: String)
}

// но мы можем создать параметр этого перечисления и вне перечисления AdvancedCurrencyUnit3
let australia: AdvancedCurrencyUnit3.DollarCountries2 = .Australia



// 19.4. оператор switch для enum
switch dollarCurrency {
case let .euro(countris, shortName):
    print("Евро. Страны: \(countris). Краткое наименование: \(shortName)")
case .dollar(let nation, let shortname):
    print("Доллар \(nation). Краткое наименование: \(shortname)")
}



// 19.5. Связанные значения членов перечисления
enum Smile: String {  // в качестве связаных значений указаны значения типа String
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
}


// в качестве связаных значений указаны значения типа Int
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune,
         pluto = 999
}


// доступ к связаным значениям:
let iAmHappy = Smile.joy
iAmHappy.rawValue // .rawValue - доступ к значению



// 19.6. Инициализаторы.

//Перечесления имеют только один инициализатор init(rawValue:)
let myPlanet = Planet.init(rawValue: 3)
var anotherPlanet = Planet.init(rawValue: 11) // nil



// 19.7. Свойства в перечислениях
enum Smile2: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    
    // вычисляемое свойство
    var description: String {return self.rawValue}
}
let mySmile: Smile2 = .joy // что тут выберем, то и вернется в description
mySmile.description



// 19.8. Методы в перечислениях
enum Smile3: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    
    var description2: String {return self.rawValue} // вычислемое свойство
    func about() {  // наш метод
        print("Перечисление содержит список смайликов")
    }
}
var otherSmile = Smile3.laugh
otherSmile.about() // вызываем метод
otherSmile.description2 // вызываем свойство



// Оператор Self
enum Smile4: String {
    case joy = ":)"
    case laugh = ":D"
    case sorrow = ":("
    case surprise = "o_O"
    
    var description4: String { return self.rawValue}
    
    func about4() {
        print("Перечисление содержит список смайликов")
    }
    func descriptionValue4() -> Smile4 {
        return self
    }
    func descriptionRawVaule4() -> String {
        return rawValue
    }
}


var otherSmile4 = Smile4.joy
otherSmile4.description4
otherSmile4.about4()
otherSmile4.descriptionValue4()
otherSmile4.descriptionRawVaule4()
otherSmile4.rawValue


// 19.10 Рекурсивные перечисления

enum ArithmeticExpression {
    //операция сложения
    case addition(Int, Int)
    // операция вычитания
    case substraction(Int, Int)
    func evaluate() -> Int {
        switch self {
        case .addition(let left, let right):
            return left + right
        case .substraction(let left, let right):
            return left - right
        }
    }
}
var expr = ArithmeticExpression.addition(10, 14)
expr.evaluate()


// пример выражения 20+10-34
enum ArithmeticExpression1 {
    //указатель на конкретное значение
    case number1(Int)
    // указатель на операцию сложения. indirect - чтобы разрешить членам перечисления обращаться к этому перечислению
    indirect case addition1(ArithmeticExpression1, ArithmeticExpression1)
    // указатель на операцию вычитания
    indirect case subtraction(ArithmeticExpression1, ArithmeticExpression1)
    
    // метод проводящий операцию
    func evaluate(_ expression: ArithmeticExpression1? = nil) -> Int {
        switch expression ?? self {
        case let .number1( value ):
            return value
        case let .addition1(vauleLeft, vauleRight):
            return evaluate(vauleLeft) + evaluate(vauleRight)
        case .subtraction(let vauleLeft, let vauleRight):
            return evaluate(vauleLeft) - evaluate(vauleRight)
        }
    }
}
let hardExpr = ArithmeticExpression1.addition1(.number1(20), .subtraction(.number1(10), .number1(34)))
hardExpr.evaluate()



/*
 
 Где использовать перечисления:
 
 Где необходимо сгруппировать множество альтернативных взаимозаменяемых значений.
 Перечисление позволяют повысить безопасность кода.
 
 */

// Пример:
enum Gender {
    case male
    case female
}

enum Movement {
    case left
    case right
    case up
    case down
}

enum TradeOperation {
    case buy(name: String, amount: Decimal)
    case sell(name: String, amount: Decimal)
}

enum Constant: Double {
    case p = 3.14159
    case e = 2.71828
    case x = 1.30357
}
