//: Playground - noun: a place where people can play

import Cocoa

//声明一个字符串然后赋值
var str = "Hello, playground"
//变量可以重复赋值
str = "1"

//声明一个浮点型常量，然后赋值
let a:Float = 30.00

//格式化数据
let format = String(format:"%.2f",a)

//\()把其他的类型转换为string类型
print("double:\(format)")

var myVariable = 42
myVariable = 50
let myConstant = 42

//声明变量的类型（double类型），后面用冒号分割
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

shoppingList = [String]()
print(shoppingList)



var occupations = [ "Malcolm": "Captain", "Kaylee": "Mechanic", ]
occupations["Malcolm"] = "Public Relations"
print(occupations)

let emptyArray = [String]()
print(emptyArray)

let emptyDictionary = Dictionary<String, Float>()
print(emptyDictionary)

let individualScores = [75, 43, 103, 87, 12]

for score in individualScores{
    print(score)
}

var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

teamScore

print(teamScore)


var optionalString: String? = "Hello"

var greeting = "Hello!"

if let name = optionalString {
    greeting = "Hello, \(name)"
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
    print(x)
    
default:
    let vegetableComment = "Everything tastes good in soup."
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

largest

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
    repeat{
    m = m * 2
}
while m < 100
m

var firstForLoop = 0
for i in 0...3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

greet("bob", day: "tuseday")


func eat(today: String,num:String)->String {
    return "\(today),\(num)"
}


eat("tuse", num: "2")

func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
getGasPrices()




func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

sumOf(1,2,3)


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)


func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition: lessThanTen)


numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "\(name) with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5, name: "my test square")
test.area()
test.simpleDescription()



enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Jack
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}


enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()



struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()



enum ServerResponse {
    case Error(String)
    case Result(String, String)
    
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")


switch success {
    

case let .Error(error):
    let serverResponse = "Failure... \(error)"
    
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    
}



protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust() }


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var aa = SimpleClass()
aa.adjust()
let aDescription = aa.simpleDescription


struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

var a1 = Int()

a1.adjust()

enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

var inPut:NSString = "hello"


/*
let π = 3.14159
/*
let x = "你好世界"
*/
print(x)
*/

let cat = "🐱";
print(cat) // 输出 "🐱"


let minValue = UInt8.min // minValue 为 0，是 UInt8 类型的最小值
let maxValue = UInt8.max // maxValue 为 255，是 UInt8 类型的最大值


let anotherPi = 3 + 0.14159

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

let i = 1

if i == 1{
    
}



let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error


print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

print("The status code is \(http404Error.0)")

let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("\(possibleNumber) has an integer value of \(convertedNumber!)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}


if let actualNumber = Int(possibleNumber) {
    print("\(possibleNumber) has an integer value of \(actualNumber)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}

var serverResponseCode: Int? = 404

serverResponseCode = nil


let possibleString: String? = "An optional string."

print(possibleString!)

let assumedString: String! = "An implicitly unwrapped optional string."

print(assumedString)
if (assumedString != nil) {
    print(assumedString)
}

let age = 3
assert(age >= 0, "A person's age cannot be less than zero")

var a2 = 0
let b2 = ++a2 // a 和 b 现在都是 1
let c2 = a2++ // a 现在 2, 但 c 是 a 自增前的值 1


let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3, 或 "负负3"


for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count-1
for i in 0...count {
    print("第 \(i + 1) 个人叫 \(names[i])")
}


let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

let wiseWords = "\"我是要成为海贼王的男人\" - 路飞"

var emptyString = "hello"               // 空字符串字面量
var anotherEmptyString = String()  // 初始化 String 实例

var a4 = [1,2]

//NSUTF8StringEncoding
var nums = emptyString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

if emptyString.isEmpty {
    print("什么都没有")
}else{
    print("有")
}

var variableString = "Horse"
variableString += " and carriage"

var constantString = "Highlander"
constantString += " and another Highlander"

let yenSign: Character = "$"


let string1 = "hello"
let string2 = " there"

let character1: Character = "!"
let character2: Character = "?"

let stringPlusString = string1 + string2 // 等于 "hello there"

var instruction = "look over"
instruction += string2

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona,A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell" ]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        ++act1SceneCount
    }
}
print("There are \(act1SceneCount) scenes in Act 1")


let normal = "Could you help me, please?"

let shouty = normal.uppercaseString // shouty 值为 "COULD YOU HELP ME, PLEASE?"
let whispered = normal.lowercaseString // whispered 值为 "could you help me, please?"

let dogString = "Dog!🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}


var shoppingLists:[String] = ["Eggs", "Milk"]

print("The shopping list contains \(shoppingLists.count) items.")
// 输出“The shopping list contains 2 items.”


if shoppingLists.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
} // 输出“The shopping list is not empty.”


shoppingLists.append("Flour")

shoppingLists += ["Chocolate Spread", "Cheese", "Butter"]

shoppingLists[1...2] = ["Bananas", "Apples"]



shoppingLists.insert("Maple Syrup", atIndex: 0)

print(shoppingLists)

print("The shopping list contains \(shoppingLists.count) items.")

let app = shoppingLists.removeLast()
print(shoppingLists)

for item in shoppingList {
    print(item)
}

var someInts = [Int]()
print("someInts is of type Int[] with \(someInts.count) items.")
someInts.append(3)

var threeDoubles = [Double](count: 3, repeatedValue: 1)


var airports: Dictionary<String, String> = ["TYO": "Tokyo","DUB": "Tokyos"]

print("The dictionary of airports contains \(airports.count)items")

airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}


if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}


airports["APL"] = "Apple International"

airports["APL"] = nil


if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}


for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}


let airportCodes = Array(airports.keys)

let airportNames = Array(airports.values)

var namesOfIntegers = Dictionary<Int, String>()

namesOfIntegers[16] = "sixteen"

namesOfIntegers = [:]


for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}


let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}


let namess = ["Anna", "Alex", "Brian", "Jack"]
for name in namess {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


for var index = 0; index < 3; ++index {
    
    if index > 0{
        break
    }
    
    print("index is \(index)")
}




var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}


let finalSquare = 25

var square = 0
var diceRoll = 0


//while square < finalSquare {
//    
//    square += 2
//}


repeat{
    square += 2
}while(square < finalSquare)


let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}



let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}



let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

sayHello("nihao")


func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}
print(halfOpenRangeLength(1, end: 10))


func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())


func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")



func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
}

func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("hello,world")

printWithoutCounting("hello,world")


func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2
}


join("hello", s2: "world", joiner: ", ")


func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}

join(string: "hello", toString: "world", withJoiner: ", ")


func joins(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
    return s1 + joiner + s2
}

join(string: "hello", toString: "world", withJoiner: "-")



func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}


arithmeticMean(1, 2, 3, 4, 5)


func alignRight(var string: String, count: Int, pad: String) -> String {
    let amountToPad = 5
    for _ in 1...amountToPad {
        string = pad + string
    }
    return string
}

let originalString = "hello"
let paddedString = alignRight(originalString, count: 10, pad: "-")


func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoIntss(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}


var someInt = 3
var anotherInt = 107
swapTwoIntss(&someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}


func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

addTwoInts(1, b: 2)

multiplyTwoInts(12, b: 2)

func printHelloWorld() {
    print("hello, world")
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, a: 3, b: 5)


func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3

let moveNearerToZero = chooseStepFunction(currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


func chooseStepFunctions(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backwards ? stepBackward : stepForward
}

var currentValues = 4
let moveNearerToZeros = chooseStepFunctions(currentValues > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValues != 0 {
    print("\(currentValues)... ")
    currentValues = moveNearerToZeros(currentValues)
}
print("zero!")


let na = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

var directionToHead = CompassPoint.West

directionToHead = .East

directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

enum Plantss{
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let somePlanets = CompassPoint.North
switch somePlanets {
case .North:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}


struct Resolution {
    var width = 0
    var heigth = 0
}


class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

someVideoMode.resolution.width = 12880
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

let vga = Resolution(width: 320,heigth: 4)

print("The width of someVideoMode is now \(vga.width)")

let hd = Resolution(width: 1920, heigth: 1080)
var cinema =  hd
cinema.width = 2048

cinema.width

hd.width

let tenEighty = VideoMode()

let alsoTenEighty = tenEighty

if tenEighty === alsoTenEighty {
    print("tenTighty and alsoTenEighty refer to the same Resolution instance.")
}


var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East


if  1000 == 1000{
    print("1234")
}

var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
var copiedAges = ages

copiedAges["Peter"] = 24

print(ages["Peter"]) // 输出 "23"

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数0，1，2，3

class DataImporter {
    /*
    DataImporter 是一个将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这是提供数据导入功能
}
class DataManager {
    lazy var importer = DataImporter()
    var data = String()
    // 这是提供数据管理功能
}

let manager = DataManager()
manager.data += "Some data"
manager.data += " Some more data"

print(manager.data)
print(manager.importer.fileName)



struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var squares = Rect(origin: Point(x: 0.0, y: 0.0),size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = squares.center
squares.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(squares.origin.x), \(squares.origin.y))")
// 输出 "square.origin is now at (10.0, 10.0)”



struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet (oldVa){
            if totalSteps > oldVa  {
                print("Added \(totalSteps - oldVa) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
print("Added")

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // 将新电平值设置为阀值
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // 存储当前电平值作为新的最大输入电平
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// 输出 "7"
print(AudioChannel.maxInputLevelForAllChannels)
// 输出 "7"

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// 输出 "10"
print(AudioChannel.maxInputLevelForAllChannels)
// 输出 "10"


class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()

 class  Counters {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counters = Counters()
counters.incrementBy(5, numberOfTimes: 3)


//










