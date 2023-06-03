import Foundation



// книга Усова, 6 издание


// Ленивые вычесление - это те элементы, вычесление которых откладывается до момента обращения к ним.


/*
 
 Есть 2 вида:
 
 lazy-by-name - значение элемент авычесляется при каждому обращению к нему
 lazy-by-need - значение вычесляется один раз при первом обращении после чего фиксируется и больше не изменяется.
 
 */



// Замыкания в ленивых вычеслениях
var arrayOfNames = ["Helga", "Bazil", "Alex"]
print(arrayOfNames.count)

let nextName = { arrayOfNames.remove(at: 0)}
arrayOfNames.count
nextName()              // значение поменялось в момент ображение к хранящемуся в ней замыканию
arrayOfNames.count




//
let baseCollection = [1, 2, 3, 4, 5, 6]
let myLazyCollection = baseCollection.lazy

let collection = myLazyCollection.map{$0 + 1}

let resultCollection = [1, 2, 3, 4, 5, 6].lazy.map{$0 + 1}.filter{$0 % 2 == 0}
Array(resultCollection)
