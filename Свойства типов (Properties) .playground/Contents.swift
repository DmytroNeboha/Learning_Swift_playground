import UIKit
import CoreGraphics
import Darwin
import Foundation

// Свойства типов. Урок 17


// создаём класс Dog
class Dog {
    
    var name: String
    var age: UInt {
        didSet {            // создаём наблюдатель свойства, если значение будет больше ageMax, то значение остаётся предыдущее.
            if age > Dog.maxAge {
                age = oldValue
            }
        }
    }
    
    lazy var questions = "Can I ask a question?"
    
    static var maxAge = 30 // ограничение макс возраста. Используем static, чтобы свойсвто не инициализировать в каждом экземпляре. Значение задавать Объязательно!
    static var howManyDogs = 0     // создадим счётчик, который считатет сколько экземпляров создано
    
    init(name: String, age: UInt) {
        self.age = age
        self.name = name
        Dog.howManyDogs += 1
        
    }
    
}



// создаём экземпляр класса Dog
var dog = Dog(name: "Bobik", age: 5)   // свойства экземпляра
var dog2 = Dog(name: "Bobik2", age: 10)   // свойства экземпляра

dog
dog.questions
dog

dog.age
dog.name
Dog.howManyDogs


// didSet в действии
dog.age
dog.age = 35
dog.age



// создаём структуру
struct Cat {
    
    var name: String
    var age: UInt {
        didSet {            // создаём наблюдатель свойства, если значение будет больше 30, то останется значение предыдущее.
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    static var maxAge = 30         // ограничение макс возраста. Используем static, чтобы это свойсвто не инициализировать в каждом экземпляре
    static var howManyCats = 0     // создадим счётчик, который считатет сколько экземпляров создано
    
    init(name: String, age: UInt) {
        self.age = age
        self.name = name
        Cat.howManyCats += 1
        
    }
    
    
}

// создаём экземпляры структуры
var cat = Cat(name: "Tomas", age: 3)            // свойства экземпляра
var cat2 = Cat(name: "Tosha", age: 25)          // свойства экземпляра

Cat.howManyCats


// didSet в действии
cat.age
cat.age = 34
cat.age

cat2.age
cat2.age = 35
cat2.age



//                                        Книга Усова. 6 издание


// Хранимые свойства - используют в структурах и классах.
// Вычисляемое свойство - используют в перечислениях, структурах, класса.
// Ленивое свойство (lezy) - не создаётся до момента первого обращения к нему.


class Person {
    var firstName = "Имя"
    var secondName = "Фамилия"
    lazy var wholeName: String = self.generateWholeName()
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
    func generateWholeName() -> String {
        return firstName + " " + secondName
    }
}

// создаём экземепляр класса
var me = Person(name: "Егор", secondName: "Петров")
me.wholeName

// lazy var (lazy-by-need) НЕ меняет больше значение после первого обращения
me.wholeName
me.secondName = "Иванов"
me.wholeName                    // не поменялось




// lazy var (lazy-by-name) - 2 вариант. С помощю замыкания
class Person1 {
    var firstName = "Имя"
    var secondName = "Фамилия"
    lazy var wholeName: () -> String = {"\(self.firstName) \(self.secondName)"} // self можно только с lazy использовать. Ссылка на объект
    init(name: String, secondName: String) {
        (self.firstName, self.secondName) = (name, secondName)
    }
}

// создаём экзмепляр
var otherMan = Person1(name: "Alex", secondName: "Trump")
otherMan.wholeName()                // пустые скобки так как используется замыкание
otherMan.secondName = "Durov"
otherMan.wholeName()                // свойство поменялось.



// сделаем свойство wholeName в классе Person2 вычисляемым
class Person2 {
    var firstName = "Name"
    var secondName = "Family"
    var wholeName: String { return "\(self.firstName) \(self.secondName)"}
    
    init(name: String, secoundName: String) {
        (self.firstName, self.secondName) = (name, secoundName)
    }
}
// создаём экзмепляр
var otherMan2 = Person2(name: "Aleksey", secoundName: "Oleynik")
otherMan2.wholeName
otherMan2.secondName = "Durov"
otherMan2.wholeName                // свойство поменялось.



// 22.2 Контроль значений свойств



// Геттер (get) - выполняет некоторый код при попытке получить значение вычесляемого свойства
// Сеттер (set) - выполняет некоторый код при попытке установить значение вычисляемому свойству


struct Circle {
    var coordinates: (x: Int, y: Int)
    var radius: Float
    var perimetr: Float {
        get {
            // высчитаем значение, используя текущее значение радиуса
            return 2.0 * 3.14 * radius
        }
        set {
            // изменим текущее значение радиуса
            radius = newValue / (2 * 3.14)
        }
    }
}

var myNewCircle = Circle(coordinates: (0, 0), radius: 10)
myNewCircle.perimetr
myNewCircle.perimetr = 31.4
myNewCircle.radius



// Наблюдатели хранимых свойств


// Наблюдатели - это специальныее функции, которые вызывают либо перед установкой нового значения хранимого свойства, либо сразу после неё.

// willSet - вызывается перед установкой новго значения
// didSet - вызывется после установки нового значения


struct Circle1 {
    var coordinates: (x: Int, y: Int)
    var radius: Float {
        willSet (newValueOfRadius) {
            print("Вместо значения \(radius) будет установлено значение \(newValueOfRadius)")
        }
        didSet (oldValueOfRadius) {
            print("Значение \(oldValueOfRadius) изменено на \(radius)")
        }
    }
    var perimetr: Float {
        get {
            // высчитаем значение, используя текущее значение радиуса
            return 2.0 * 3.14 * radius
        }
        set {
            // изменим текущее значение радиуса
            radius = newValue / (2 * 3.14)
        }
    }
}

var myNewCircle1 = Circle1(coordinates: (0, 0), radius: 10)
myNewCircle1.perimetr
myNewCircle1.perimetr = 31.4
myNewCircle1.radius



// 22.3 Свойства типа - static

// Свойства типа могут быть созданы для enum, struct, class


struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}



enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 2
    }
}



class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 3
    }
    class var overrideableComputedTypeProperty: Int {      // исключение в классах которые могут быть переопределены в подклассе.
        return 4
    }
}


// Пример свойства типа в структуре

// Структура AudioChanel моделирует аудиоканал у которго есть два апараметра: 1 - максимальная возм. громкость ограниченна для всех каналов, 2 - текущая громкость ограничена максимальной громкостью

struct AudioChannel {
    static var maxVolume = 5
    var volume: Int {
        didSet {
            if volume > AudioChannel.maxVolume {
                volume = AudioChannel.maxVolume
            }
        }
    }
}

var leftChanel = AudioChannel(volume: 2)
var rightChanel = AudioChannel(volume: 3)

rightChanel.volume = 6
rightChanel.volume

AudioChannel.maxVolume
AudioChannel.maxVolume = 10
AudioChannel.maxVolume

rightChanel.volume = 8
rightChanel.volume
