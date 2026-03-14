import Foundation

print("Hello, World from Swift!")

// A simple structure to demonstrate Swift basics
struct Person {
    let name: String
    let age: Int
    
    func introduce() {
        print("Hi, my name is \(name) and I am \(age) years old.")
    }
}

// Create an instance and call the method
let person = Person(name: "Swift Developer", age: 10)
person.introduce()

// A simple loop demonstration
print("\nCounting to 3:")
for i in 1...3 {
    print(i)
}
