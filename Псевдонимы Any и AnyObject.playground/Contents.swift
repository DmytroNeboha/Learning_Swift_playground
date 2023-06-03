import Foundation




//                                              Псевдонимы Any, AnyObject.  Книга Усова. 6 издание



// AnyObject - соответствует произвольному экзмепляру класса.
// Any - соответсвует произвольному типу данных.


var things = [Any]()  // пустой массив
things.append(0)
things.append(0.0)
things.append(42)
things.append("Hello")
things.append((3.0, 5.0))
things.append({(name: String) -> String in "Hello, \(name)"})
things

// для анализа элемента нужно необходимо сделать приведение типа.


for thing in things {
    switch thing {
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x,y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Troll"))
    default:
        print("something else")
    }
}




// Разбор псевдонимои Any and AnyObject

class Dog {
    var type = "dog!"
    
}

class NoisyDog: Dog {}

//екземпляры
let dog = Dog()
let dog1 = Dog()
let dog2 = NoisyDog()


// массив экзмепляров
let someObjects: [AnyObject] = [Dog(), NoisyDog(), Dog()]


// Приведение типа AnyObject
for object in someObjects {
    let animal = object as! Dog     // опасно делать, тк если класс NoisyDog не будет подписан на Dog и у него будет другое свойство, то будет фатал ерор.
    print(animal.type)
}


// для сокращения записи кода выше:
for object in someObjects as! [Dog] {
    print(object.type)
}



// Безопасная запись кода выше:
for object in someObjects {
    guard let animal = object as? Dog else {
        continue
    }
    print(animal.type)
}


// Безопасная сокращенная запись кода выше:
for object in (someObjects as? [Dog] ?? []) {
    print(object.type)
}
