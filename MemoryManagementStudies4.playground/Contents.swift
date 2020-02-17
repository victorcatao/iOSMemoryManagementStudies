import Foundation

/*
 Studies of closures and memory management
 */

var value = 0
let show = {
    print(value)
}
show() // 0
value = 10
show() // 10

let show2 = { [value] in
    print(value)
}
show2() // 10
value = 12
show2() // 10 => still printing the last value before show2 was created because show2 store the value at that point

let show3 = { [v = value, b = value+1] in
    print(v, b)
}
show3() // 12, 13
value = 40
show3() // 12,13 => the same here


// Example with Cat
class Cat {
    func speak() { print("Meow!") }
}

var play: () -> Void

do {
    let garfield = Cat()
    play = { [weak cat = garfield] in
        guard let cat = cat else {
            print("No playing today because I'm lost :'(")
            return
        }
        cat.speak()
    }
    play()
}
play() // lost the reference because it's not inside "do" block anymore
