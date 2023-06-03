import Foundation



// ЦИКЛЫ - for in, while, repeat while, выход из цикла break. (Урок 5) Ian Solomein


// for in
let count3 = 1...10
for index in count3 {     // цикл for in
    print("\(index) умножить на 3 равно \(index * 3)")
}



let count4 = 0...10
for index in count4 {
    print(("\(index) умножить на 4 равно \(index * 4)"), "- 1 равно \((index * 4)-1)")
}



for number in 1...5 {
    print("Hello \(number)")
}


// while
var num4 = 1
while num4 <= 20 {
    print(num4)
    num4 += 1
}
print("Start")



var rep2 = 10
while rep2 >= 0 {
    print(rep2)
    rep2 -= 1
}
print("Go")



// repeat while
var rep = 10
repeat {
    print(rep)
    rep += 1
} while rep <= 11
print("Finish")



// Оператор - brake. Выход из цикла
var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("Go now!")
        break
    }
    countDown -= 1
}



//                                      Книга Усова, 6 издание


// Цикл - иттерации пофторяются пока выраение возвращает true

var i = 1
var resultSum = 0
while i <= 10 {
    resultSum += i
    i += 1
}
resultSum // 1+2+3+4+5+6+7+8+9+10 = 55



// оператор repeat while
var y = 1
var result = 0

repeat {
    result += y
    y += 1
} while y <= 10

result


// если программа встречает continue, то она незамедлительно переходит к новой итерации

// производим сложение всех четных чисел в интервале от 1 до 10. Для этого производим проверку на четность
var x = 0
var sum = 0

while x <= 10 {
    x += 1
    if x % 2 == 1 {
        continue
    }
    sum += x
}
sum



// использование оператора break. Пример: подсчет сумы всех чисел от 1 до 54, и если сумма будет 450, то произойдет выход из оператора
let lastNum = 54
var currentNum = 1
var sumOfInts = 0

while currentNum <= lastNum {
    sumOfInts += currentNum
    if sumOfInts > 450 {
        print("Число заполнено. Последнее обработанное число - \(currentNum)")
        break
    }
    currentNum += 1
}




