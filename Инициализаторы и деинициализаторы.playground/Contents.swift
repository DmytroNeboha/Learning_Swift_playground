
import Foundation


// книга Усова, 6 издание. Инициализаторы и деинициализаторы



// Существуют: назначенные инициализаторы и вспомогательные инициализаторы


// суперкласс
class Quadruped {
    var type = ""
    var name = ""
    func walk() {
        print("Walk")
    }
}

// пример вспомогательного инициализатора:
class Dog: Quadruped {
    override init() {
        super.init()
        self.type = "dog"
    }
    
    convenience init(text: String) {
        self.init()
        print(text)
    }
    
    func bark() {
        print(self.name)
    }
}

var someDog = Dog(text: "Экземпляр класса Dog создан")  // появилось на выбор 2 инициализатора - init() и init(text:)



// Наследование инициализаторов

// ! Если подкласс имеет собственный назначенный инициализатор суперкласса, то родительский класс не наследуется
// ! Если подкласс переопределяет все назначенные инициализаторы суперкласса, то он наследует и все вспомогательные инициализаторы




// Отношения между инициализаторами

// ! Назначенный инициализатор подкласса должен вызвать инициализатор суперкласса
// ! Всопомагтельный инициализатор должен вызвать назначенный инициализатор того же объектного типа
// ! Вспомогательный инициализатор в конечном счете должен вызвать назнченный инициализатор.



// Проваливающееся инициализаторы (failable) - возвращают nil при попытке создания экземпляра. Для создания служит ключевое слово init?
class Rectangle {
    var height: Int
    var weight: Int
    
    init?(height h: Int, wright w: Int) {
        self.height = h
        self.weight = w
        
        if !(h > 0 && w > 0) {
            print("Данные не могут быть меньше или равно 0")
            return nil
        }
    }
}

var rectangle = Rectangle(height: 56, wright: -32)
rectangle



//
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")


// аналогично коду выше в перечислениях можно использовать rawValue
enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
let fahrenheitUnit2 = TemperatureUnit2(rawValue: "K")



// Объязательные инициализаторы


// Обязательный инициализатор (required) - это инициализатор, который объязательно должен быть определен во всех покласах данного класса.

/*
 
 required init(параметры) {
 тело инициализатора
 }
 
 */

// при реализации в подклассе ключевое слово override не используется.



// Динициализаторы


// Деинициализатор (деструктор) - это спеиальный метод, который автоматически вызывается во время уничтожения экзмепляра класса. Доступны только для классов.

/*
 
 deinit {
 тело деинициализатора
 }
 
 */



class SuperClass {
    init?(isNil: Bool) {
        if isNil == true {
            return nil
        } else {
            print("Экземпляр создан")
        }
    }
    deinit {
        print("Деинициализатор суперкласса")
    }
}


class SubClass: SuperClass {
    deinit {
        print("Деинициализатор подкласса")
    }
}


var obj = SubClass(isNil: false)
obj = nil


