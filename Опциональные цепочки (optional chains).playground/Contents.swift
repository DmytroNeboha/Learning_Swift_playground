import Foundation




// Книга Усова, 6 издание. Опциональные цепочки





// Доступ к свойствам через опциональные цепочки
class Person {
    var residence: Residence?
}

class Residence {
    var rooms: [Room]?
}

struct Room {
    let square: Int
}

var man = Person()
man.residence
man.residence = Residence()
man.residence = nil


// наверняка не знаем есть ли там значение, поэтому во избежания ошибки проводим опциональное связывание
if let manResidence = man.residence {
    // действие с manResidence
}


// что если вложенность опциональных свойств окажется многоуровневой - решением будет опциональная цепочка
if let residence = man.residence {
    if let rooms = residence.rooms {
        // действие с коллекцией типа [Room]
    }
}

// Опциональная цепочка. Чтобы указать путь нужно ставить знак (?)
let room2 = Room(square: 10)
var residence2 = Residence()
residence2.rooms = [room2]
var man2 = Person()
man2.residence = residence2

if let rooms = man2.residence?.rooms {         // пример опциональной цепочки
    // действие с коллекцией [Room]
}


// man2.residence?.kitchen?.table?.move()  - пример опциоанльной цепочки



// Установка значений через опциональные цепочки
let room3 = Room(square: 15)
let room4 = Room(square: 25)
man.residence?.rooms = [room3, room4]






// 29.3. Доступ к методам через опциональные цепочки
class Person5 {
    var residence5: Residence5?
}


struct Room5 {
    let square: Int
}

class Residence5 {
    var rooms5: [Room5]?
    
    func roomsCount() -> Int {
        if let rooms5 = self.rooms5 {
            return rooms5.count
        } else {
            return 1
        }
    }
    
    func roomsSquare() -> Int {
        var squreRooms = 0
        // todo count
        return squreRooms
    }
}
var man5 = Person5()
man5.residence5 = Residence5()

// Установка значений через опциональные цепочки
let room5 = Room5(square: 15)
let room6 = Room5(square: 25)
man5.residence5?.rooms5 = [room5, room6]


// Доступ к методам через опциональные цепочки
man5.residence5?.roomsCount()




// 29.4. Доступ к сабскриптам через опциональные цепочки
let firstRoom = man5.residence5?.rooms5?[0]
type(of: firstRoom)


// такой способ можно использовать и для инициализации значений
man5.residence5?.rooms5?[0].square



