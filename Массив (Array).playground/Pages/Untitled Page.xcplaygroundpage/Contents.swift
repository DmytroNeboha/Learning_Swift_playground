import UIKit


//   Массивы (Array), Множество (Set), Словарь (Dictionary) Урок 8
    
var array1 = Array<String>()
var array2 = [String]()

let apple = "Apple"
let lemon = "Lemon"
let orange = "Orange"
let strawwbery = "Strawwbery"

let fruits = [apple, lemon, orange, strawwbery]


var shoppingList = ["eggs", "milk", "bread", "flour", "sweets"]
    shoppingList.count
    shoppingList.append("butter")
    shoppingList[0]
    shoppingList[2]

    shoppingList[0] = "salt"
    shoppingList
    shoppingList.count

    shoppingList.insert("oil", at: 0)
    shoppingList.count

    shoppingList.insert("Sprite", at: 7)
    shoppingList.count

    for item in shoppingList {
        print(item)
}










