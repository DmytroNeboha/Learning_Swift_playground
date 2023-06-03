import Foundation


// Структуры. Урок 16.



// создаём класс Human
class Human {
    
    var age: Int
    var name: String
    
    // в классах свойства нужно инициализировать
    init(age: Int, name: String) {
        self.age = age
        self.name = name
        
    }
    
    
}

// создаём экземпляр human класса Human
let human = Human(age: 20, name: "Igor")  // экземпляр класса может быть как var так и let


// Добираемся к свойствам экземпляра класса и поменяем значение на 25
human.age
human.age = 25
human.age



// Cоздаём экземпляр human3 класса Human
var human3 = Human(age: 50, name: "String")

human3.age
human3.name


// присвоим экземпляру human3 класса Human значения экземпляра human класса Human
human3 = human // ссылка на один и тот же объект в памяти

// поменяем теперь значения human3 на другие, и посмотрим что произойдёт с экземпляром human
human3.age = 60
human3.name = "Vitaliy"

// смотрим что произошло human после смены значений human3 - проявление ссылочного типа (reference type)
human.age
human.name




// Структуры



// Создаём структуру
struct Human1 {
    
    var age: Int
    var name: String
    
    // в структурах свойства не нужно инициализировать
}

// создаём экземпляр структуры Human1
var human1 = Human1(age: 25, name: "Maria")     // уже встроенный инициализатор + может быть только var


// Добираемся к свойствам экземпляра структуры и поменяем значение
human1.age
human1.age = 35 // чтобы менять свойство экземпляр должен быть var и свойства структуры var
human1.age


/*
 
 2 верховных типа данных:
 
 value type - Int, String, Bool, Array, struct
 reference type - enum, class
 
 */


// Создаём ещё один экземпляр human2 структуры Human1
var human2 = Human1(age: 30, name: "Olga")

human2.age
human2.name


// присвоим экземпляру human2 значения экземпляра human1
human2 = human1 // происходит копирование значений - в этом проявляется Value type

//теперь поменяем значения human2
human2.age = 45
human2.name = "Veronika"

// после того как мы поменяли значения после присвоения наши значения исходные human1 остались прежние. Vaule type
human1.age
human1.name




// Методы в структуре

struct Person {
    var name: String                    // если мы изменяем наше свойство в структуре, мы должны использовать mutating func. В кдассах этого не нужно делать.
    
    mutating func makeAnonymous() {              // метод, который присваивает
        name = "Anonymous"              // нашей propert name строку "Anonymous"
    }
}


// Посмотрим что наша строка это value type. Строка является структорой внутри Swift
let string = "Do or do not, there is no try"

// так как Строка является структурой, то у неё есть свойства и методы, пример популярных:
print(string.count)                     // число символов в строке
print(string.hasPrefix("Do"))           // строка начинается с Do?
print(string.uppercased())              // перевёл строку в верхний регистр
print(string.sorted())                  // отсортировал строку по умолчанию по алфавиту


// Int, String, Bool, Array, struct - это тоже структуры и к ним можно применить разные методы.



// Книга Усова. 6 издание



// 20.1. Синтаксис объявления структур
struct CheesPlayer {}

// свойство Any - свойство структуры, может быть произвольного типа данных


// добавим в структуру два свойства:
struct CheesPlayer1 {
    var name: String
    var victories: UInt
}


// * структуры имеют встроенный инициализатор init. Его не нужно объявлять


// создаём экземпляр струкутры CheesPlayer1:
var playerHarry = CheesPlayer1.init(name: "Гарри Поттер", victories: 32)


// 20.3 Стркутура как пространство имен
playerHarry.name
playerHarry.victories
playerHarry.victories += 1  // изменили значение
playerHarry.victories



// 20.4. Собственные инициализаторы. * Если мы объвили свой инициализатор, то автоматический удаляется!
struct ChessPlayer2 {
    var name: String = "Игрок"
    var victories: UInt = 0
    
    init(name: String) {
        self.name = name
    }
}


var playerHelgaPotaki = ChessPlayer2(name: "Ольга")
playerHelgaPotaki.victories

// var newPlayer = ChessPlayer2()   - ошибка, так как мы создали собственный init, то структура больше не имеет встроенного init



// 20.5. Методы в структурах
struct ChessPlayer3 {
    var name: String = "Игрок"
    var victories: UInt = 0
    
    init(name: String) {
        self.name = name
    }
    func description() {
        print("Игрок \(name) имеет \(victories) побед")
    }
}

var andrey = ChessPlayer3(name: "Андрей")
andrey.description()



// Изменяющие методы. Чтобы метод изменял свойства структуры нужно добавить - mutating
struct ChessPlayer4 {
    var name: String = "Игрок"
    var victories: UInt = 0
    
    init(name: String) {
        self.name = name
    }
    func description() {
        print("Игрок \(name) имеет \(victories) побед")
    }
    mutating func addVictories(count: UInt = 1) {
        victories += count
    }
}

var harold = ChessPlayer4(name: "Гарольд")
harold.victories
harold.addVictories()
harold.victories
harold.addVictories(count: 3)
harold.victories



