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
