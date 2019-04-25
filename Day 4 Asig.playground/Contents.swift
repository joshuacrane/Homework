import UIKit

//2.1 The filter function should call the closure on each item in the array. If the closure evaluates to true this item should be saved into a new array that holds all the 'true' values. After all the items have been evaluated by your closure, return an array of only the ones that evaluated to true.

func myFilter(array: [Int], filterClosure: (Int) -> Bool) -> [Int] {
    var filterNumbers = [Int]()
    for num in array {
        if filterClosure(num) {
            filterNumbers.append(num)
        }
    }
return filterNumbers
}

let filteredList = myFilter(array: [5,9,1,8,2,3,7,6,4], filterClosure: {(num) -> Bool in
    return num < 5
})
print(filteredList)



//2.2 This function should evaluate every combination of two distinct items in the array that is passed in using the closure that is also passed in. It should then order the items correctly, and return the ordered items in an array.

func para( array:[Int], closure: (Int,Int) -> Bool) -> [Int] {
    var sortedArray = [Int].init(repeating: 0, count: array.count)
    
    for num in array {
        var x = 0
        for num2 in array {
            if closure(num,num2){
                x += 1
            }
        }
        sortedArray[x] = num
    }
    return sortedArray
}


print(para(array: [5,9,1,8,2,3,7,6,4], closure:{(var1,var2) in
    return var1 > var2
}))



