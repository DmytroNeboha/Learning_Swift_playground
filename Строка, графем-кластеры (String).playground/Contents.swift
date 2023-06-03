import Foundation


// Книга Усова. 6 издание

// Строки - это упорядоченые коллекции!



// 9.1. Character в составе String
let str = "Hello!"
str.count



// 9.2. Графем-кластеры. 1 способ:
let char: Character = "\u{E9}"
char


// символ é (латинскае е со знаком ударения), 2 способ:
let anotherChar: Character = "\u{65}\u{301}" // латинская е + знак ударения
anotherChar

char == anotherChar


// однаковое количество символов. Так как символ - это графем-кластер.
let cafeSimple = "caf\u{E9}"
let cafeCombine = "cafe\u{301}"
cafeSimple.count
cafeCombine.count



// * один символ может состоять из нескольки символов
// * значение типа Character - не отдельный символ, а графем-кластер.



// емодзи
let thumbsUp = "\u{1f44d}"
let blackSkin = "\u{1f3fd}"
let combine = "\u{1f44d}\u{1f3fd}"  // комбинируем



// 9.3. Строковые индексы
let name = "e\u{301}lastic"

// получаем первый графем-кластер.
let index = name.startIndex
let firstChar = name[index]

type(of: firstChar)
type(of: index)


// Если попробовать endIndex - будет ошибка!
let indexLastChar = name.endIndex
//name[indexLastChar]


// метод index(before:)
let lastCharIndex = name.index(before: indexLastChar)
name[lastCharIndex]


// метод index(after:)
let secondCharIndex = name.index(after: name.startIndex)
name[secondCharIndex]


// метод index(_:offsetBy:)
let fourCharIndex = name.index(name.startIndex, offsetBy: 3)
name[fourCharIndex]


// **
name.count // 7
name.unicodeScalars.count // 8



// 9.4. Подстроки (Substring)
let abc = "hdgjhcdicijefdoed"
let firstCharIndex = abc.startIndex
let fourthCharIndex = abc.index(firstCharIndex, offsetBy: 3)

let subAbc = abc[firstCharIndex...fourthCharIndex]
subAbc
type(of: subAbc)                                                // тип Substring (подстрока)


// преобразуем подстроку в строку
let subStr = abc[fourthCharIndex...]
subStr



