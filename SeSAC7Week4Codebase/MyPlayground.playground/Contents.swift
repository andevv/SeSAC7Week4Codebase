import UIKit

class User {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jack = User(name: "J", age: 11) //class
jack.age = 55
// jack.name = "D"

let person = Person(name: "F", age: 12) //struct
// person.age = 66
// person.name = "A"


struct Person {
    let name: String
    var age: Int
}

struct Food {
    static let phone = "010-1234-1234"
    static var owner = "Den"
    let title: String //저장, 인스턴스
    var totalMoney: Int //저장, 인스턴스
    
    var order: Int { //연산
        get {
            return totalMoney / 5000
        }
        set {
            totalMoney += (newValue * 5000)
            //인스턴스 연산 프로퍼티에 타입 저장프로퍼티를 활용할 수도 있다.
            Food.owner = "JJJJJ"
        }
    }
}

struct Restaurant {
    
    static let title = "jack"
    var totalMoney = 0
    
    //타입 연산프로퍼티에 인스턴스 저장프로퍼티를 활용할 수는 없다.
    static var order: Int {
        get {
            return totalMoney / 5000
        }
        set {
            totalMoney += (newValue * 5000)
        }
    }
    func abc() {
        
    }
    static func asd() {
        
    }
}
Restaurant.order

Food.phone
Food.owner

var den = Food(title: "덴마카세", totalMoney: 0)

den.order = 5
den.order = 3
den.order = 1

print(den.totalMoney)
print(den.order)

Food.owner = "jj"
Food.owner
