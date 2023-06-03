import Foundation



// Книга Усова, 6 издание. Управление памятью.


// Статическая память - размещается код приложения, различные библиотеки, метаданные и глобальные переменные необходимы для работы.
// Автоматическая память - в которой харнятся все локальные для текущей области видимости параметры.
// Динамическая память - в которой память выделяется динамически по запросу.



// Автоматическая память




struct Application {                                    // после загрузки будет находится в статической памяти
    var name: String
}

// функция производящая загрузку ресурсов
func loadResources(forApp: Application) {
    let appPath = "./bin/\(forApp.name)"
    // ... последующие операции внутри функции
}


func main(testMode: Bool) {
    let app = Application(name: "Calculator")        // после загрузки будет находится в статической памяти
    loadResources(forApp: app)
    // ... последующие опперации внутри функции
    
    
}

// начало работы программы (автоматическая память)
main(testMode: true)                                // как только вызывается main - в стеке создается новый фрейм в котором выделяется место под локальные для этой                                                     области параметры и их значения




// Динамическая память



// Динамическая память (куча или heap) - в которой память выделяется динамически по запросу приложения.
class Application2 {
    var name: String
    
    init(name: String) {
        print("создание экзмепляра 2")
        self.name = name
    }
    
    deinit {
        print("уничтожение экземпляра 2")
    }
}

func loadResources2(forApp2: Application2) {
    print("начало функции loadResources2")
    let appPath = "./bin/\(forApp2.name)"
    // ... последующие операции внутри функции
    print("завершение функции loadResources2")
}

// функция - точка входа
func main2(testMode2: Bool) {
    print("начало функции main2")
    let app = Application2(name: "Calculator")
    loadResources2(forApp2: app)
    // ... последующие операции внутри функции
    print("завершение функции main2")
}

// начало работы программы
main2(testMode2: true)



// Колличество ссылок на экземпляр



class House {
    var title: String
    var owner: Human?
    
    init(title: String, owner: Human? = nil) {
        print("Дом \(title) создан")
        self.title = title
        self.owner = owner
        return
    }
    
    deinit {
        print("Дом \(title) уничтожен")
    }
}

class Human {
    var name: String
    
    init(name: String) {
        print("Владелец \(name) создан")
        self.name = name
        return
    }
    
    deinit {
        print("Владелец \(name) уничтожен")
    }
}


// создаём конструкцию if чтобы создать новую зону видимости, при выходе из которой должны удаляться записанные в память объекты.
if true { // шаг 1
    let houseOwner = Human(name: "Василий")
    
    if true { // шаг 2
        let house = House(title: "Частный дом", owner: houseOwner)
    } // шаг 3
    
    // шаг 4
    let secondHouse = House(title: "Квартира", owner: houseOwner)
} // шаг 5



// Утечки памяти и ARC



// закольцуем ссылки между двумя классами
//дом
class House2 {
    var title: String
    var owner: Human2?
    
    init(title: String, owner: Human2? = nil) {
        print("Дом \(title) создан")
        self.title = title
        self.owner = owner
        return
    }
    
    deinit {
        print("Дом \(title) уничтожен")
    }
}


// владелец дома
class Human2 {
    var name: String
    var house: [House2] = []
    
    init (name: String) {
        print("Владелец \(name) создан!")
        self.name = name
        return
    }
    
    func add(house: House2) {
        self.house.append(house)
    }
    
    deinit {
        print("Владелец \(name) уничтожен!")
    }
}

if true { // шаг 1
    let houseOwner = Human2(name: "Олег")
    
    if true { // шаг 2
        let house = House2(title: "Частный дом", owner: houseOwner)
        houseOwner.add(house: house)
    } // шаг 3
    
    // шаг 4
    let secondHouse = House2(title: "Квартира", owner: houseOwner)
    houseOwner.add(house: secondHouse)
}




// Сильные (strong), слабые (weak), бесхозные (unowned) ссылки

// Сильные (strong) - все создаваемые по умолчанию ссылки.



// Слабая ссылка (weak). Модификатор weak - говорит о том что по усмотрению Swift значение свойства может быть переведенно в nil, то есть уничтожено.
/*
 
 weak var имяСвойства: ОпциональныйТипДанных?
 
 */




// пример слабой ссылки.

// дом
class House3 {
    var title: String
    weak var owner: Human3?         // слаая ссылка (weak)
    
    init(title: String, owner: Human3? = nil) {
        print("Дом 3 \(title) создан")
        self.title = title
        self.owner = owner
        return
    }
    
    deinit {
        print("Дом 3 \(title) уничтожен")
    }
}

// владелец дома
class Human3 {
    var name: String
    var house: [House3] = []
    
    init (name: String) {
        print("Владелец 3 \(name) создан!")
        self.name = name
        return
    }
    
    func add(house: House3) {
        self.house.append(house)
    }
    
    deinit {
        print("Владелец 3 \(name) уничтожен!")
    }
}

// запуск
if true { // шаг 1
    let houseOwner = Human3(name: "Олег")
    
    if true { // шаг 2
        let house = House3(title: "Частный дом", owner: houseOwner)
        houseOwner.add(house: house)
    } // шаг 3
    
    // шаг 4
    let secondHouse = House3(title: "Квартира", owner: houseOwner)
    houseOwner.add(house: secondHouse)
}



// Если необходимо сделать слабую ссылку - безхозную, на экземпляр неопционалного типа данных, то используют модификатор unowned
class House4 {
    var title: String
    unowned var owner: Human4         // слаая ссылка (weak)
    
    init(title: String, owner: Human4) {
        print("Дом 4 \(title) создан")
        self.title = title
        self.owner = owner
        return
    }
    
    deinit {
        print("Дом 4 \(title) уничтожен")
    }
}

class Human4 {
    var name: String
    var house: [House4] = []
    
    init (name: String) {
        print("Владелец 4 \(name) создан!")
        self.name = name
        return
    }
    
    func add(house: House4) {
        self.house.append(house)
    }
    
    deinit {
        print("Владелец 4 \(name) уничтожен!")
    }
}

// запуск
if true { // шаг 1
    let houseOwner = Human4(name: "Олег")
    
    if true { // шаг 2
        let house = House4(title: "Частный дом", owner: houseOwner)
        houseOwner.add(house: house)
    } // шаг 3
    
    // шаг 4
    let secondHouse = House4(title: "Квартира", owner: houseOwner)
    houseOwner.add(house: secondHouse)
}



// Automatic Reference Counting (ARC) - это специальный механиз автоматического подсчета ссылок.



// Ссылки в замыканиях
// захват переменной в замыканиях
var a = 2
let f = { print(a)}
f()
a = 3
f()



//
class Man {
    var name = "Человек"
    deinit {
        print("Объект удален")
    }
}

var clouser: (() -> Void)?
if true {
    let man = Man()
    clouser = { [unowned man] in
        print(man.name)
    }
    clouser!()
}
print("программа завершена")



// ещё пример
/*
 
 let clouserWithSomeArgs = { [unowned human, weak house] in
 // тело замыкания
 }
 
 */


