import Foundation




                                                // Дженерики. Книга Усова, 6 издание



// Универсальные шаблоны (Generic)



// Универсальные шаблоны представлены тремя базовыми элементами:

// - универсальные функции
// - универсальные протоколы
// - универсальные объектные типы



// код меняющий значения между собой
var first = 3
var second = 5

func change(a: inout Int, b: inout Int) {
    let tmp = first
    first = second
    second = tmp
}
//change(a: &first, b: &second)
//first
//second




// теперь если нам нужно будет написать функцию и для String, Double и тд.. чтобы не дублировать код нужно использовать Generic


// <T> - заполнитель типа
// T - параметр типа

// при нескольких заполнителях в пределах одного дженерика используйте T1, T2 и тд


// в данном случае a и b имеют идентичный тип данных T
func change<T>(a: inout T, b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var firstString = "one"
var secoundString = "two"

change(a: &firstString, b: &secoundString) // заполнитель типа при вызове функции опускается

firstString
secoundString


// функция с разными типами
func printValues<T1, T2>(a: T1, b: T2) {
    print("Значение 1 - \(a), значение 2 - \(b)")
}

printValues(a: "book", b: 15)
printValues(a: 4, b: 5)



// можно использовать и для возвращаемого значения
func getSelf<T>(_ a: T) -> T {
    return a
}

getSelf(15)




// 34.3. Ограничения типа


//func sum<T>(_ a: T, _ b: T) -> T {
//    return a + b                          - нельзя сумировать не конкретные типы данных.
//}


// Ограничение типа можно указать двумя способами:
// 1. Непосредтвенно в заполнении типа, через двоеточие после параметра (подпишем на протокол Numeric)
func sum<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}
sum(1, 6)
sum(1.1, 7.8)
//sum("one", "two") - вызовет ошибку



// 2. Способ: указываем после сигнатуры функции where
func sum2<T>(_ a: T, _ b: T) -> T where T: Numeric {
    return a + b
}
sum2(1, 6)
sum2(1.1, 7.8)
//sum("one", "two") - вызовет ошибку



// функция производящая поиск переданого значения в переданом массиве
func search<T: Comparable>(value: T, in collection: [T]) -> Bool {
    for item in collection {
        if item == value {
            return true
        }
    }
    return false
}

var array = [1, 7, 9, 11]
search(value: 1, in: array)
search(value: 8, in: array)




// 34.4. Универсальные объектные типы


// пример структуры, которая хранит и оперирует значением типа Int
struct StackInt {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.insert(contentsOf: [item], at: 0)
    }
    
    mutating func pop() -> Int {
        return items.removeFirst()
    }
}

var intStorage = StackInt(items: [1, 2, 3, 4, 5])
intStorage.items
intStorage.pop()
intStorage.push(9)
intStorage.items



// чтобы можно было работать с другими типами структуры выше будем использовать дженерики
struct Stack<T> {
    var items2 = [T]()
    mutating func pushT(_ item: T) {
        items2.insert(contentsOf: [item], at: 0)
    }
    
    mutating func pop() -> T {
        return items2.removeFirst()
    }
}

var genericIntStorage = Stack(items2: [1, 2, 3, 4, 5, 6])
genericIntStorage.items2

var genericStringStorage = Stack(items2: ["Bob", "Alice", "Mark", "Yan"])
genericStringStorage.items2



// пример стека, который хранит только числовые значения
struct Stack2<T: Numeric> {
    var items = [T]()
    mutating func replaceFirst(_ newValue: T) {
        items[0] = newValue
    }
}

var genericIntStorage2 = Stack2(items: [1, 2, 3, 4, 5])
genericIntStorage2.replaceFirst(10)
genericIntStorage2.items



// Расширение универсального типа
extension Stack2 {
    mutating func replaceFirst2(_ newValue: T) {
        items[0] = newValue
    }
}

var genericIntStorage3 = Stack2(items: [1, 2, 3, 4, 5])
genericIntStorage3.replaceFirst(10)
genericIntStorage3.items



        
// 34.5. Универсальные протоколы


func search<T1, T2>(value: T1, in collection: T2) -> Bool where T1: Comparable, T2: Collection, T1 == T2.Element {
    for item in collection {
        if item == value {
            return true
        }
    }
    return false
}



// протокол, который станет основой структуры выше
protocol StackProtocol {
    associatedtype ItemType
    var items: [ItemType] { get set }
    mutating func push(_: ItemType)
    mutating func pop() -> ItemType
}


extension StackProtocol {
    mutating func push(_ item: ItemType) {
        items.insert(contentsOf: [item], at: 0)
    }
    
    mutating func pop() -> ItemType {
        return items.removeFirst()
    }
}


//  Использование ассоциированных параметров
struct Stack3<T>: StackProtocol {
    typealias ItemType = T
    var items = [T]()
}


var myStack = Stack3(items: [2, 4, 6, 8])
myStack.pop()
myStack.push(9)
myStack.items



// 34.6. Непрозрачные типы (Opaque types)


// Вариант 1

// Задача: нужно описать несколько типов транспортных средств.
protocol Vehicle {
    var uid: Int { get set }
    init()
}

// машина
struct Car: Vehicle {
    var uid: Int = 0
}

// грузовик
struct Truck: Vehicle {
    var uid: Int = 5
}

// используем протокол. Решение ниже
func getObject<T: Vehicle>() -> T {
    return T()
}

let car: Car = getObject()
//let truck: Truck = getObject()


// Как использовать протокол в качестве возвращаемого значения и при этом не получить ошибку?
// Вариант 1 - использовать дженерики.
// Вариант 2 - использовать непрозрачные типы.



// Вариант 2

// используем ключевое слово some, которое говорит, что Vehicle является непрозрачным типом (Opaque type)
func getCar() -> some Vehicle {
    return Car(uid: 54)
}

let mayCar = getCar()



// Подитожим:


// Generic:
func getCar2<T: Vehicle>() -> T {
    return Car(uid: 22) as! T
}

// тип возвращаемого значения определяется тут
let a: Car = getCar2()


// Opaque type
func getCar3() -> some Vehicle {
    return Car(uid: 54) // тип возвращаемого значения определяется тут. Функция должна возвращать значение только одноготипа!
}

let b = getCar3()



// Opaque types позволяет указать тип возвращаемого значения с помощю протокола, используя связанные типы ( или ключевое слово self) в своей реализации. Это одно из нововведений в Swift
// Opaque types позволяет определить тип возвращаемого значения внутри самой функции. 
