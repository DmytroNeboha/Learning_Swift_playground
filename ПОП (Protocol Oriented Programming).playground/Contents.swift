import Foundation



//                                                                      Книга Усова, 6 издание
/*  В протоколах обеспечивается:
 
 1. Целосность типов данных
 2. Инкапсуляция
 3. Полиморфизм
 
 
 1. Целосность типов данных - если некоторый объект подписан на протокол, то в нём объязательно будут реализованы требования протокола.
 2. Инкапсуляция - это подход при котором данные и методы объеденяютя в одну сущность, при этом скрывают свою реализацию.
 
 
 Пример ниже:
 
 */

// сущность ТВ-шоу
class TVShow {
    //...
}


// протокол, описывающий функциональность работы с ТВ-шоу
protocol DisplayShow {
    func getShowList() -> [TVShow]
    func changeShowTo(show: TVShow) -> Void
    var currentShow: TVShow { get }
    // дополнительное требование ...
}


// протокол описывающий функциональность управления звуком
protocol ChangeVolume {
    var currentVolume: UInt8 { get set }
    func increase(by: UInt8) -> Void
    func decrease(by: UInt8) -> Void
    // дополнительные требования
}


// сущность Телевизор принимает протокол к исполнению
struct TV: DisplayShow, ChangeVolume {
    
    // реализация методов и свойств протоколов...
    func getShowList() -> [TVShow] {
        <#code#>
    }
    
    func changeShowTo(show: TVShow) {
        <#code#>
    }
    
    var currentShow: TVShow
    
    var currentVolume: UInt8
    
    func increase(by: UInt8) {
        <#code#>
    }
    
    func decrease(by: UInt8) {
        <#code#>
    }
}



/*
 
 3. Полиморфизм - это подход, предусматривающий возможность взаимодействовать с различными типами данных единым образом в отстутствии информации о конкретном типе данных объекта.
 
 */



struct DVDPlayer: ChangeVolume {
    var currentVolume: UInt8
    
    func increase(by: UInt8) {
        // реализация кода
    }
    
    func decrease(by: UInt8) {
        // реализация кода
    }
    
    // реализация кода
}


// Пример полиморфизма:
struct UniversalManager {
    var currentDevice: ChangeVolume
    func increaseVolum(by: UInt8) -> Void {
        self.currentDevice.increase(by: by)         // полиморфизм?
    }
    // ...
}


// начнем работу с DVD-плеером
//var manager = UniversalManager(currentDevice: DVDPlayer())
//manager.increaseVolume(by: 1)


// переключимся на работу с телевизором
//manager.currentDevice = TV()
//manager.increaseVolume(by: 5)





// Суть ПОП состоить в том, что в первую очередь описывем протоколы, а уже потом объектные типы, принимающие их к реализации.


// пример с уткой
protocol Walking {}
protocol Flying {}
protocol Swimming {}

// утку подписываем на все подходящие протоколы выше
struct Duck: Walking, Flying, Swimming {}

// пингвин, подпишем только на нужный протокол
struct Penguin: Walking, Swimming {}




// протокол
protocol SpeeadAuto {
    func getSpeed() -> UInt
}



struct Audi: SpeeadAuto {
    func getSpeed() -> UInt {
        return 150
    }
}
struct Mercedes: SpeeadAuto {
    func getSpeed() -> UInt {
        return 179
    }
}
struct BMW: SpeeadAuto {
    func getSpeed() -> UInt {
        return 190
    }
}






// 32.2. Где использовать классы и структуры.



/*
 Правила выбра между классом и структурой:
 
 Правило №1
 
 Отдавайте предпочтение структурам, нежели классам
 
 Правило №2
 
 Используйте классы только тогда, когда вам действительно нужны их особенности.
 
 */



// Классы - reference type
class UserClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}
// Струкутруы -  value type
struct UserStruct {
    var name: String
}

// создаем экземпляры
var userByClass = UserClass(name: "Vasily")
var userByStruct = UserStruct(name: "Vasily")

// инициализируем значения новым параметрам
var newUserByClass = userByClass                     // два параметра, которые указывают на один и тоот же объект в памяти
var newUserByStruct = userByStruct                   // два независимых значений




// Причины выбрать структуру:

// 1. Безопасность - структуры безопасней классов. Множественные копии объекта, в отличии от множественных ссылок, не способны привести  случайному, неконтролируемому изменению данных. Особенно важно для работы в среде мультипоточности (multithearding).
// 2. Утечка памяти - при использование структур значения передаются копиями, а не ссылками.
// 3. Раздутые объектные типы - Swift не поддерживает множественное наследование. Создание "комбайнов" для решения большого количества задач не лучшая идея!
// 4. Структуры быстрее классов.



// протестируем скорость выполнения 100 млн операций.
class ValueClass {
    var value: Int = 0
}


struct ValueStruct {
    var value: Int = 0
}

var operationArray = Array(1...100_000_000)

// опыт с классом
var startTime = Date().timeIntervalSince1970
var a = ValueClass()

for _ in operationArray {
    a.value += 1
}

var finishTime = Date().timeIntervalSince1970
print("Время выполнения операции с классом - \(finishTime-startTime)")


// опыт со структурой
startTime = Date().timeIntervalSince1970
var b = ValueStruct()

for _ in operationArray {
    b.value += 1
}

finishTime = Date().timeIntervalSince1970
print("Время выполнение операции со структурой - \(finishTime-startTime)")




// Причина выбрать класс:

// 1. Логическая передача объекта по ссылке. Пример: файловые дескрипторы, сетевые подключения открытые в приложениях, различные кнтроллеры, которые управляют объектами.
// 2. Совместимость с Objective-C





/* реализация контроллера с помощю класса
 
 struct User {
 var id: Int
 }
 
 class UserController {
 var users: [User]
 func add(user: User) {
 // ...
 }
 
 func removeBy(userID: Int) {
 // ...
 }
 
 func loadFromStorageBy(userID: Int) -> User {
 // ...
 }
 
 init(user: User) {
 // ...
 }
 }
 
 */


