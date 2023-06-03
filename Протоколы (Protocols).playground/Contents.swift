import Foundation



// Протоколы. Видео 15. iCode School

protocol Movable {
    var speed: Int {get}
    func move()
    
}




// класс 1
class Human:Movable{
    var speed: Int = 3
    
    func move() {
        print("Человек идет со скоростью \(speed) км/ч")
    }
    
    var firstName: String
    init(firstName: String) {
        self.firstName = firstName
    }
}


// структура 1
struct Car:Movable {
    var speed: Int = 100
    
    func move() {
        print("Машина едет со скоростью \(speed) км/ч")
    }
    
    var mark: String
}


// структура 2
struct Cat:Movable {
    var speed: Int = 20
    
    func move() {
        print("Кошка бежит со скоростью \(speed) км/ч")
    }
    
    var name: String
}


// создаём экземпляры
let human = Human(firstName: "Steven")
let car = Car(mark: "BMW")
let cat = Cat(name: "Tomas")


let objects:[Movable] = [human, car, cat]

for object in objects {
    object.move()
}




// Книга Усова, 6 издание. Протоколы



/*
 Если к типу данных применяется протокол, значит:
 
 - тип данных подписан на протокол
 или
 - тип данных принимает протокол к реализации
 или
 - тип данных принимает требования протокола
 или
 - тип данных соответствует протоколу
 
 
 */



// 30.2. Требуемые свойства



protocol SomeProtocol {
    var mustBeSettable: Int { get set }      // свойство должно быть доступно для чтения и для изменения.
    var doesNotNeedToBeSettable: Int { get } // свойсвто должно иметь как минимум get но также может реализовывать и set
}


// реализация требования протокола SomeProtocol + содержит дополнительный метод, который возвращает сумму свойств
struct SomeStruct: SomeProtocol {
    var mustBeSettable: Int
    let doesNotNeedToBeSettable: Int
    
    func getSum() -> Int {
        return self.mustBeSettable + self.doesNotNeedToBeSettable
    }
}


// для указания требвания к реализации свойства типа необходимо использовать модификатор static
protocol AnotherProtocol {
    static var someTypeProperty: Int { get }
}


// реализация протокола AnotherProtocol и SomeProtocol
struct AnotherStruct: SomeProtocol, AnotherProtocol {
    var mustBeSettable: Int
    let doesNotNeedToBeSettable: Int
    static var someTypeProperty: Int = 3
    
    func getSum() -> Int {
        return self.mustBeSettable + self.doesNotNeedToBeSettable + AnotherStruct.someTypeProperty // реализация static тут должна быть?
    }
}

var s1 = AnotherStruct(mustBeSettable: 2, doesNotNeedToBeSettable: 10)
var s2 = AnotherStruct(mustBeSettable: 1, doesNotNeedToBeSettable: 5)


// 30.3. Требуемые методы



// static - требование реализации метода
// mutating - для измененяющего метода


// требование к реализации метода
protocol RandomNumberGenerator {
    var randomCollection: [Int] { get set }
    
    
    func getRandomNumber() -> Int
    
    mutating func setNewRandomCollection(newValue: [Int])
}


// Струкутра и класс принимающие протокол RandomNumberGenerator но имеют некоторые различия в реализации
struct RandomGenerator: RandomNumberGenerator {
    var randomCollection: [Int] = []
    
    func getRandomNumber() -> Int {
        return randomCollection.randomElement() ?? 0
    }
    
    mutating func setNewRandomCollection(newValue: [Int]) {
        if newValue.count == 0 {
            // todo throw excaption
        }
        self.randomCollection = newValue
    }
}

class RandomGeneratorClass: RandomNumberGenerator {
    var randomCollection: [Int] = [1, 2, 3, 4, 5]
    
    func getRandomNumber() -> Int {
        if let randomElement = randomCollection.randomElement() {
            return randomElement
        }
        return 0
    }
    
    // не используется модификатор mutating
    func setNewRandomCollection(newValue: [Int]) {
        self.randomCollection = newValue
    }
}




// 30.3. Требуемые инициализаторы



protocol Named {
    init(name: String)
}

class Person: Named {
    var name: String
    required init(name: String) {
        self.name = name
    }
}




// 30.5. Протокол в качестве типа данных



// Протокол указывающий на множество типов. Универсальный шаблон generic
func getHash<T: Hashable>(of value: T) -> Int {
    return value.hashValue
}

getHash(of: 5)
getHash(of: "Swift")



// Протокол и операторы as? и as!
protocol HasValue {
    var value: Int { get set }
}

class ClassWithValue: HasValue {
    var value: Int
    init(value: Int) {
        self.value = value
    }
}

struct StructWithValue: HasValue {
    var value: Int
}

// коллекция элементов
let objects2: [Any] = [2, StructWithValue(value: 3), true, ClassWithValue(value: 6), "Usov"]

// теперь нам нужно перебрать все элементы коллекции и выбрать те которые соответствуют протоклу HasVaule

for object in objects2 {
    if let elementWithValue = object as? HasValue {
        print("Значене \(elementWithValue.value)")
    }
}


// Протокол и оператор is
for object in objects2 {
    print(object is HasValue)
}




// 30.6. Наследование протоколов



protocol GeometricFigureWithXAxis {
    var x: Int { get set }
}

protocol GeometricFigureWithYAxis {
    var y: Int { get set }
}


protocol GeometricFigureTwoAxis: GeometricFigureWithXAxis, GeometricFigureWithYAxis {
    var distanceFromeCenter: Float {get}
}


struct Figure2D: GeometricFigureTwoAxis {
    var x: Int = 0
    var y: Int = 0
    var distanceFromeCenter: Float {
        let xPow = pow(Double(self.x), 2)
        let yPow = pow(Double(self.y), 2)
        let length = sqrt(xPow + yPow)
        return Float(length)
    }
}




// 30.7. Классовые протоколы


// Можно ограничить применение протокола исключительно на классы. Запретив для структур и перечеслений. Для этого пишем : class
protocol SuperProtocol { }
protocol SubProtocol: class, SuperProtocol { }

class ClassWithProtocol: SubProtocol { }    // корректно
//struct StructWithProtocol: SubProtocol { }  = ошибка




// 30.8 Композиция протоколов



// пример - два протокола кобинируются в единое требование с помощю &
protocol Named2 {
    var name: String { get }
}

protocol Aged2 {
    var age: Int { get }
}

struct Person2: Named2, Aged2 {
    var name: String
    var age: Int
}

func wishHappyBirthday(celerator: Named2 & Aged2) {                               //
    print("С Днем рождения, \(celerator.name)! Тебе уже \(celerator.age)!")
}

let birthdayPerson = Person2(name: "Джон Уик", age: 46)
wishHappyBirthday(celerator: birthdayPerson)

