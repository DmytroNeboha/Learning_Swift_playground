import Foundation





// 35. Обработка ошибок


// пример работы с файлом
enum FileError: Error {
    case notExixts          // файл не существует
    case notRights          // нет прав доступа
}



// 35.1. Выбрасывание ошибок (используем enum и throws)


/* пример - Программа обеспечивает работу торгового аппарата по продаже еды. В процессе его работы могут возникнуть различные ошибки, которые не позволяют совершить покупкпку:
 
 - неправильный выбор
 - нехватка средств
 - отсутствие выбранного товара
 
 для описание этого создадим перечисление:
 */


enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


var productPrice: Int = 5
var accountBalans: Int = 25

// если монет не хватает
guard productPrice <= accountBalans else {
    // определяем сколько момент не хватает
    let diff = productPrice - accountBalans
    // выбрасываем ошибку о нехватке монет при этом передаем колличество монет
    throw VendingMachineError.insufficientFunds(coinsNeeded: diff)                  // чтобы выбросить ошибку (показать) нужно использовать оператор throws.
    
}



// 35.2. Обработка ошибок


/*
 Ошибку недостаточно выбросить, её необходимо перехватить и корректно обработать. Swift предлагает 4 способа обработать ошибок:
 
 - передача выброшенной ошибки в вышестоящий код
 - обработка ошибки оператором do-catch
 - переобразование ошибки в опционал
 - подавление выброса ошибки
 
 
 ! Если перед вызовом функции или метода он может вызвать ошибку, то перед имененм данной функции необходимо указывать слово try.
 
 */



// Передача ошибки - используем throws


// перечисление содержащее ошибки
enum CustumError: Error {
    case wrongName
}

// функция, которая выбрасывает ошибку и передаёт наверх
func funcThrowsError() throws {
    // ...
    //    throw CustumError.wrongName
    // ...
}

// функция, которая не выбрасывет ошибку, но получает ошибку, выброшенную функцией funcThrowsError посел чего передает её на верх
func funcGetsError() throws -> String {
    // ...
    try funcThrowsError()
    // ...
    return "TextResult"
}

// в данной области кода ошибка может быть получена и обработана
try funcGetsError()



// если функция не помечена ключевым словом throws
enum VendingMachineError2: Error {
    case invalidSelection                       // не правильный выбор
    case insufficientFunds(coinsNeeded: Int)    // не достаточно средств
    case outOfStock                             // нет в наличии
}


struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = ["Candy Bar": Item(price: 12, count: 7), "Chips": Item(price: 10, count: 4), "Pretzels": Item(price: 7, count: 11)]
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError2.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError2.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError2.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
    }
}



// Реализуем функцию, которая в автоматическом режиме пытается приобрести какой-либо товар. В данном примере словарь favoriteSnacks содержит указатель на любимое блюдо каждого из трех человек.

let favoriteSnacks = ["Alice": "Chips", "Bob": "Licorice", "Eve": "Pretzels"]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}


// Оператор do-catch чтобі перехвачевать и обрабатівать ошибки

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError2.invalidSelection {
    print("Неверный выбор")
} catch VendingMachineError2.outOfStock {
    print("Товара нет в наличии")
} catch VendingMachineError2.insufficientFunds(let coinsNeeded) {
    print("Недостаточно средств, пожалуйста, внесите ещё \(coinsNeeded) монет(ы)")
}



// Переобразование ошибки в опционал - исп. try?

func someThrowingFunction() throws -> Int {
    return 1
}

let x = try! someThrowingFunction()



// Подавление выброса ошибки - исп. try!
// let photo = try! loadImage("./Resources/John Appleseed.jpg")



// 35.3. Структуры и классы для обработки ошибок

struct NetworkError: Error {}

do {
    // принудительно вызываем исключительную ситуацию
    //    throw NetworkError()
    try someThrowingFunction()
} catch is NetworkError {
    print("it is network error")
} catch {
    // ...
}


// * но объектный тип, описывающий ошибку, может содержать произвольные свойства и методы
struct NetworkError2: Error {
    var code: Int
    
    func description() -> String {
        return "it is network error with code \(code)"
    }
}

do {
    // принудительно вызываем исключительную ситуацию
    throw NetworkError2(code: 404)
} catch let error as NetworkError2 {
    print(error.description())
} catch {
    // ...
}
