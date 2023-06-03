import Foundation



//                                             Subscripts.  Книга Усова. 6 издание



// Сабскрипты доступны для струкутр и классов



/* 23.2. Синтаксис сабскриптов
 
 
 subscript(входные параметры) -> тип_возвращаемого_значения {
 get {
 тело геттера
 }
 set(ассоциированныйПараметр) {
 тело сеттера
 }
 }
 
 
 */

// вначале вставим код с прошлой темы

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
    var coordinates: (String, Int)? = nil    // опциональный кортеж, если фигура будет убрана с поля, то будет nil
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
        setCoordinates(char: coordinates.0, num: coordinates.1)
    }
    // 1й метод - установка координат
    func setCoordinates(char c:String, num n: Int) {
        coordinates = (c, n)
    }
    // 2й метод - взятие фигуры
    func kill() {
        coordinates = nil
    }
}



// создадим шахматную доску
class GameDesk {
    var desk: [Int:[String:Chessman]] = [:]
    init() {
        for i in 1...8 {
            desk[i] = [:]
        }
    }
    // создаём сабскрипт
    subscript(alpha: String, number: Int) -> Chessman? {
        get {  // даёт возможность получать информацию об отдельной ячейке
            return self.desk[number]![alpha]
        }
        set {
            if let chessman = newValue {
                self.setChessman(chess: chessman, coordinates: (alpha, number))
            } else {
                self.desk[number]![alpha] = nil
            }
        }
    }
    
    // создаём метод, который устанавливает ссылку на фигуру в свойство desk и проверяет переданные координаты на корректность
    func setChessman(chess: Chessman, coordinates: (String, Int)) {
        let rowRange = 1...8
        let colRange = "A"..."Z"
        if (rowRange.contains(coordinates.1) && colRange.contains(coordinates.0)) {
            self.desk[coordinates.1]![coordinates.0] = chess
            chess.setCoordinates(char: coordinates.0, num: coordinates.1)
        } else {
            print("Coordinates out of range")
        }
    }
}

var game = GameDesk()
var queenBlack = Chessman(type: .queen, color: .black, figure: "\u{265B}", coordinates: ("A", 6))
queenBlack.coordinates
game.setChessman(chess: queenBlack, coordinates: ("B", 2))
queenBlack.coordinates
game.setChessman(chess: queenBlack, coordinates: ("A", 3))


// реализовали возможность получать информацию об отдельной ячейке с помощю subscript get
game["A", 3]?.coordinates
game["B", 4]?.coordinates

// реализовали возможность устанавливать фигуру на новые координаты с помощю subscript set
game["C", 5] = queenBlack
game["C", 5]
game["C", 5] = nil
game["C", 5]



// subscripts не могут использоваться как хранилища, то есть через них мы организуем только доступ к хранилищам значений

