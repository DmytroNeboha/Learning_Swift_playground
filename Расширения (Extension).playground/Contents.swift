import Foundation


// Расширения. Урок 19 Видео



// Создаём расширение, которое расширяет функционал этой структуры
extension Int {
    
    func squared() -> Int {
        return self * self
    }
    
    func repetition(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    var isEven: Bool {
        return self % 2 == 0
    }
}

var number = 10

// применяем к нашей переменой метод squared
number.squared()
number.isEven
number.repetition {
    print("Hello")
}


extension Double {
    
    var m: Double {
        return self
    }
    
    var km: Double {
        return self * 1000
    }
    
    var cm: Double {
        return self / 100
    }
    
    var mm: Double {
        return self / 1000
    }
}


var doble = 5.0
doble.m
doble.km
doble.cm
doble.mm




// Книга Усова, 6 издание.



// Суть расширений - добавлять новые возможности но не изменять уже существующие.



// 31.1. Вычисляемые свойства в расширениях



// программа оперирует расстояниями в метрах, тип Double. Но нужно организовать оперативный перевод метров в другие еденицы.
extension Double {
    var asKM: Double { return self / 1000.0 }
    var asM: Double { return self }
    var asCM: Double { return self * 100.0 }
    var asMM: Double { return self * 1000.0 }
}

let length: Double = 25 // 25 метров
length.asKM
length.asMM



// применение геттеров и сеттеров для вычесляемых свойств позволит использовать их возмжности по максимуму
extension Double {
    var asFT: Double {
        get {
            return self / 0.3048
        }
        set(newValue) {
            self = newValue * 0.3048
        }
    }
}

var distance: Double = 100 // расстояние 100 метров
distance.asFT // расстояние 100 метров в футах - 328.08 фута
distance.asFT = 150 // установили растояние в футах, но он будет сохраненно в метрах




// 31.2. Методы в расширениях



extension Int {
    func repetitions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetition {
    print("Swift")
}




// для изменение свойств перечислений и структур используем модификатор mutating
extension Int {
    mutating func squared2() {
        self = self * self
    }
}

var someInt = 3
someInt.squared2()




// 31.3. Инициализаторы в расширениях



struct Line {
    var pointOne: (Double, Double)
    var pointTwo: (Double, Double)
}

extension Double {
    init(line: Line) {
        self = sqrt(
            pow((line.pointTwo.0 - line.pointOne.0), 2) +
            pow((line.pointTwo.1 - line.pointOne.1), 2)
        )
    }
}

var myLine = Line(pointOne: (10, 10), pointTwo: (14, 10))
var lineLenght = Double(line: myLine)




// 31.4. Сабскрипты в расширениях



extension Int {
    subscript(digitIndex: Int) -> Int {
        var base = 1
        var index = digitIndex
        
        while index > 0 {
            base *= 10
            index -= 1
        }
        return (self / base) % 10
    }
}

746381295[0] // 5
746381295[1] // 9
746381295[3] // 1


// если у числа отсутствует цифра с запрошенным индексом, возвращается 0.




// 31.5 Расширение протоколов



// подпись объектного типа на протокол
protocol TextRepresentable {
    func asText() -> String
}

extension Int: TextRepresentable {
    func asText() -> String {
        return String(self)
    }
}

5.asText()      // "5"



// Расширение протоколов и реализация по умолчанию
protocol Descriptional {
    func getDescription() -> String
}

// расширение протоколоа и указание реализации метода по умолчанию
extension Descriptional {
    func getDescription() -> String {
        return "Описание объектного типа"
    }
}

// подпишем класс на протокол
class myClass: Descriptional {}
print(myClass().getDescription())


// ! Реализация методов по умолчанию для протоколов доступна только при испльзовании расширений. Вы не можете наполнить метод непосредственно при объявлении протокола. При этом вы всегда можете переопределить реализацию по умолчанию непосредственно в самом объектном типе.

struct myStruct: Descriptional {
    func getDescription() -> String {
        return "Описание структуры"
    }
}

myStruct().getDescription()



//
extension TextRepresentable {
    func about() -> String {
        return "Данный тип поддерживает протокол TextRepresentable"
    }
}

5.about()


