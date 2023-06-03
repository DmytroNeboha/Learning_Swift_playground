import UIKit


// Классы. Урок 15. Ian Solomein


// Человек - 2 руки, голова, 2 ноги = шаблон - класс. А вот конкретный человек с именем, возрастом - объект нашого класса - -экземпляр класса.


// 1. Вариант класса
class Human {
    
    // свойства класса инициализированы
    var age = 25
    var name = "Maria"
    
    // функция внутри класса - метод
    func move() {
        print("\(name) is moving")
    }
    
}

// создаем екземпляр класса Human.
var maria = Human() // () - инициализатор по умолчанию, просто круглые скобки.


// после создания екземпляра Human, мы можем обращаться к свойства maria через точку
maria.age
maria.move()











// 2. вариант класса
class Human2 {
    
    // свойства класса не инициализированы
    var age2: UInt
    var name2: String
    
    // вычисляемые свойства
    var status: String {
        get {   // если мы НЕ устанавлием set, то get {} можно убрать
            if isQualified {
                return "\(name2) is qualified for this job"
            } else {
                return "\(name2) isn't qualified for this job"
            }
        }
    } // * если убираем get, то убираем и эту скобку.
    var isQualified: Bool
    
    
    
    // функция внутри класса - метод
    func move2() {
        print("\(name2) is moving")
    }
    
    // кастомный инициализатор создаём в том случае когда свойства класса (age2 и name2) НЕ инициализированы.
    init(age2: Int, name2: String, isQualified: Bool) {
        if age2 < 0 {
            self.age2 = 0 // тут потрібно викинути помилку
            print("Помилка вік не може бути менше 0")
        } else {
            self.age2 = UInt(age2)
        }
        self.name2 = name2
        self.isQualified = isQualified
    }
    
    
}

// Создаём экземпляр класса Human2
var olga = Human2(age2: 30, name2: "Olga", isQualified: true)
olga.name2
olga.move2()
olga.isQualified


// Создадим ещё раз экземпляр класса Human2
var igor = Human2(age2: 20, name2: "Igor", isQualified: false)
igor.status



/*
 
 
 Cвойства класса:
 
 
 1. Хранимые свойства - stored properties: age2, name2. У этих  свойств есть так называемые наблюдатели свойств - (проперти абзьорвис), они следят за изменяемыми значений свойств и при необходимости могут реагировать на эти изменения. Обозреватели свойств вызываются каждый раз при установки нового значения свойства, даже если новое значение не отличается от старого.
 
 Могут быть двух значений: willSet и didSet
 
 willSet (параметр) {
 выражение
 }
 didSet (параметр){
 выражения
 }
 }
 
 
 2. Вычисляемые свойства - computed properies - они не хранят значения, а только вычисляюи их. Схема:
 
 var имя свойства: тип данных {
 get {
 вычесление значения
 }
 set (параметр) {
 установка значения
 }
 }
 
 
 */



// Вычисляемые свойства у которого есть get и set
// Пример: програма которая вычисляет прибль при вложении определенной суммы на определенный период в банке



class Account{
    
    // сумма вклада
    var sum: Double { // вычесляемое свойство(или поле)
        // блок willSet устанавливается ПЕРЕД установки нового значения
        
        
        // краще не викорситовувати як функціоналі
        willSet(newSum) {
            print("Previus sum: \(self.sum) / New sum: \(newSum)")
        }
        
        // краще не викорситовувати як функціоналі
        // блок didSet устанавливается ПОСЛЕ установки нового значения
        didSet(oldSum){
            print("Sum increased by: \(self.sum - oldSum)")
        }
    }
    
    var rate: Double = 0.01 // процентная ставка. Хранимое свойство/поле
    
    var profit: Double{  // вычесляемое свойство(или поле)
        
        get {
            return sum + sum * rate
        }
        set(newProfit){    // сокращенно: можем убрать (newProfit)
            self.sum = newProfit / (1 + rate) // и установить имя по умолчанию, которое называется newValue
        }
    }
    
    init(sum: Double, rate: Double){
        
        self.sum = sum
        self.rate = rate
        
    }
}

// создаем экземпляр класса Account
var myAcc: Account = Account (sum: 1000, rate: 0.1)
print(myAcc.profit)

// ожидаемая прибль
myAcc.profit = 2000

// распечатаем необходимую сумму вклада для получения прибили в 2000
print(myAcc.sum)





/*
 Резюмируем:
 
 1. Рассмотрели классы также свойства классов, вычесляемые свойства и хранимые свойства
 2. Методы
 3. Классы имеют инициализаторы. И чтобы инициализировать екземпляр класса мы должны вручную прописать инициализатор если у нас свойства изначально не инициализировано.
 4. Хранимые свойства имеют такие блоки как willSet и didSet. В основном блок willSet не используетсяя, а используется только блок didSet. Также у вычесляемых свойствах есть блоки get и set - они вычисляют значения, а блок set также вычислет нвое значение при изменение. set можно также не использовать, а использование get очень распространено.
 
 
 */



//                                          Книга Усова. 6 издание





// опишем сущность - шахматная фигура используя class, вложеный enum
class Chessman {
    // type фигур
    enum ChessmanType {
        case king, castle, bishop, pawn, knight, queen
    }
    
    // color фигур
    enum ChessmanColor {
        case white, black
    }
    // свойства класса
    let type: ChessmanType
    let color: ChessmanColor
    var cordinates: (String, Int)? = nil    // опциональный кортеж, если фигура будет убрана с поля, то будет nil
    let figureSymbol: Character
    // 1й инициализатор класса
    init(type: ChessmanType, color: ChessmanColor, figure: Character) {
        self.type = type
        self.color = color
        figureSymbol = figure               // self можно и не писать, так как имя другое
    }
    // 2й инициализатор класса
    init(type: ChessmanType, color: ChessmanColor, figure: Character, coordinates: (String, Int)) {
        self.type = type
        self.color = color
        figureSymbol = figure
        setCordinates(char: coordinates.0, num: coordinates.1)
    }
    // 1й метод - установка координат
    func setCordinates(char c:String, num n: Int) {
        cordinates = (c, n)
    }
    // 2й метод - взятие фигуры
    func kill() {
        cordinates = nil
    }
}

// создаём экземпляр фигуры белый король
var kingWhite = Chessman(type: .king, color: .white, figure: "\u{2654}") // координаты не заданы
kingWhite.cordinates                                                              // значит будет nil
kingWhite.setCordinates(char: "E", num: 1)

// создаём экземпляр фигуры черная дама
var queenBlack = Chessman(type: .queen, color: .black, figure: "\u{2655}", coordinates: ("A", 6))


// чтобы получить доступ к вложеному enum нужно указать имя родительского типа:
let linkToEnumValue = Chessman.ChessmanType.bishop
