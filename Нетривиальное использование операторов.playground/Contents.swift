import Foundation



// Нетривиальное использование операторов. Книга Усова, 6 издание.



// Операторные функции


// структура описывающая вектор на плоскости
struct Vector2D {
    var x = 0.0, y = 0.0
}

// собственная реализация оператора сложения (+)
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector



// Префиксные и постфиксные операторы

// реализуем префиксный оператор унарного минуса для структуры Vector2D
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive



// Составной оператор присваивания
func += (left: inout Vector2D, right: Vector2D) {
    left = left + right
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd



// Оператор эквивалентности и неэквивалентности
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)

if twoThree == anotherTwoThree {
    print("Эти два вектора эквивалентны")
}



// 36.2. Пользовательские операторы


// Собственные операторы объявляются с помощю ключового слова operator и модификаторов prefix, infix, postfix


// реализуем новый оператор +++
prefix operator +++
prefix func +++ (vector: inout Vector2D) -> Vector2D {
    vector += vector
    return vector
}

var toBeDouble = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDouble
toBeDouble         // (2.0, 8.0)
afterDoubling      // (2.0, 8.0)
