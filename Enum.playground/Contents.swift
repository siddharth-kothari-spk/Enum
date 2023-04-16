import UIKit

enum Direction {
    case north
    case south
    case west
    case east
}

// Multiple cases can appear on a single line, separated by commas
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}


// Note
/*
Swift enumeration cases don’t have an integer value set by default, unlike languages like C and Objective-C. In the CompassPoint example above, north, south, east and west don’t implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are values in their own right, with an explicitly defined type of CompassPoint.
*/


var direction = Direction.north

print(type(of: direction)) // prints "Direction"


// --------------------------------------------------------------------------------------------

// Iterating over enum cases

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available") // // Prints "3 beverages available"


for beverage in Beverage.allCases {
    print(beverage)
}

// --------------------------------------------------------------------------------------------

// Associated values

// it’s sometimes useful to be able to store values of other types alongside these case values. This additional information is called an associated value, and it varies each time you use that case as a value in your code.

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOP")
print(productBarcode) // prints "qrCode("ABCDEFGHIJKLMNOP")"

productBarcode = .upc(8, 85909, 51226, 3)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).") // prints "UPC: 8, 85909, 51226, 3."
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}

// OR

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).") // prints "UPC: 8, 85909, 51226, 3."
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// --------------------------------------------------------------------------------------------

// Raw values
//  As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly Assigned Raw Values

enum SolarPlanet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//SolarPlanet.mercury has an explicit raw value of 1, SolarPlanet.venus has an implicit raw value of 2

enum CompassPoint: String {
    case north, south, east, west
}
// CompassPoint.south has an implicit raw value of "south"

let earthsOrder = SolarPlanet.earth.rawValue
// earthsOrder is 3
print(type(of: earthsOrder)) // Int


let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"


// Initializing from a Raw Value
let possiblePlanet = SolarPlanet(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus

// Note :The raw value initializer is a failable initializer, because not every raw value will return an enumeration case.

// --------------------------------------------------------------------------------------------
