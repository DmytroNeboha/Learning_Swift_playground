import Foundation

// Наследование. Урок 18 Ian Solomein



// создаём класс Dog и внутри создадим хранимые свойства, вычесляемые свойства и метод
class Dog {
    
    var name: String
    var breed: String
    
    // вычесляемое свойство (Computed property)
    var info: String {
        return "The breed of \(name) is a \(breed)"
    }
    
    // создадим метод
    func makeNoize() -> String {
        return "Hello"
    }
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
        
        
    }
    
    
}

// создаём дочерний класс
class Corgi: Dog {
    
    var isHappy: Bool
    
    override var info: String {                         // расширим родительское хранимое свойство
        return name + " is " + breed
    }
    
    override func makeNoize() -> String {               // расширим родительский метод
        return super.makeNoize() + " " + "Sir"          // super - указывает на родительский класс
    }
    
    init(isHappy: Bool) {
        self.isHappy = isHappy
        super.init(name: "Alisa", breed: "Corgi")
    }
}

// создадим экземпляр дочернего класса Corgi
var corgi = Corgi(isHappy: true)

//corgi.name = "Alisa"
//corgi.breed = "Corgi"
//corgi.makeNoize()
//corgi.info
//corgi.isHappy
//
//print(corgi.info + " and shi's happy? - \(corgi.isHappy).")

corgi.name
corgi.breed
corgi.isHappy
corgi.info
corgi.makeNoize()
corgi.self



//                                                              Книга Усова. 6 издание



// Наследование поддерживает только классы


// суперкласс
class Quadruped {
    var type = ""
    var name = ""
    func walk() {
        print("Walk")
    }
}

// подклас
class Dog1: Quadruped {
    func bark() {
        print("woof")
    }
    func printName() {
        print(self.name) // доступ к свойству суперкласса производится также как к своим свойствам, через self
    }
}


var dog1 = Dog1()
dog1.type = "dog"
dog1.walk()
dog1.bark()
dog1.name = "Jack"
dog1.printName()



// 24.2. Перепределение наследуемых элементов
class NoisyDog1: Dog1 {
    override func bark() {
        print("Вика привет!!")
        print("woof1")
        print("woof1")
    }
}

var badDog1 = NoisyDog1()
badDog1.bark()
badDog1.bark()



// Доступ к преопределенным элементам суперкласса
class NoisyDog2: Dog1 {
    override func bark() {
        for _ in 1...3 {
            super.bark() // super - доступ к преопределенным элементам суперкласса.
        }
    }
}

var badDog2 = NoisyDog2()
badDog2.bark()



// Переопределение инициализаторов
class Dog2: Quadruped {
    override init() {
        super.init()
        self.type = "dog2"
    }
    func bark() {
        print("woof2")
    }
    func printName() {
        print(self.name)
    }
}

var dog2 = Dog2()
dog2.type



// 24.3. Модификатор final - разрешает наследовать но запрещает переопределение.

/*
 
 final class
 final var
 final func
 final subscript
 
 */



// 24.4 Подмена экземпляров классов
var animalsArray: [Quadruped] = []      // масив буде приймати тільки обʼєкти типу Quadruped

var someAnimal = Quadruped()
var myDog = Dog1()
var sadDog = NoisyDog2()

animalsArray.append(someAnimal)
animalsArray.append(myDog)
animalsArray.append(sadDog)


// 24.5. Приведение типов (иерархия классов)

/*
 
 Путем приведения типов можно выполнить следующее:
 - проверить тип конкретного экземпляра класса на соответствие некоторому типу или протоколу.
 - преобразовать тип конкретного экзмепляра в другой тип той же иерархии классов
 
 */


// Проверка типа:
for item in animalsArray {      // проверяем все элементы в масиве на соответсвие классу Dog1
    if item is Dog1 {
        print("Yap")            // нашли 2 элемента, которые связаны с классом Dog1. Поэтому принт 2 раза
    }
}



// Преобразование типа:
for item in animalsArray {
    if var animal = item as? NoisyDog2 {
        animal.bark()
    } else if var animal = item as? Dog1 {
        animal.bark()
    } else {
        item.walk()
    }
}






