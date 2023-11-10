import UIKit

// Class -> Reference type
class Country {
    var name: String
    var capital: String
    var area: Int

    init(name: String, capital: String, area: Int) {
        self.name = name
        self.capital = capital
        self.area = area
    }
}

var myCountry = Country(name: "Indonesia", capital: "Jakarta", area: 500)
var yourCountry = myCountry
yourCountry.capital = "Bandung"
print(myCountry.capital)

// Struct -> Value Type
/*
struct Country {
    var name: String
    var capital: String
    var area: Int
}

var myCountry = Country(name: "Indonesia", capital: "Jakarta", area: 500)
var yourCountry = myCountry
yourCountry.capital = "Bandung"
print(myCountry.capital)
print(yourCountry.capital)
*/


// When to use class or struct?
// when you need inheritance and reference type? use class
// when you need value type, lightweight and performant? use struct

