import UIKit

/*
 The Builder separates the creation of objects from their configuration. It simplifies the creation of instances that need many default values, and those values don’t frequently change when creating new objects.

 Don't use the Builder pattern when creating objects that require only a few configuration values, or when those values must change whenever a new instance gets created.

 The Builder is similar in purpose to the Factory Method design pattern - both encapsulate the creation logic. The key difference between 

 */

public class Laptop {
    public var size: Size
    public var processor: Processor
    public var graphics: Graphics
    
    public init(size: Size, processor: Processor, graphics: Graphics) {
        self.size = size
        self.processor = processor
        self.graphics = graphics
    }
}

//MARK: - Caller: this is where we call our Builder classes
func createBuilder(configuration: [String: String]) -> LaptopBuilder? {
    
    guard let model = configuration["base_model"] else {
        return nil
    }
    
    var laptopBuilder: LaptopBuilder?
    
    switch model {
    case "budget":
        laptopBuilder = BudgetLaptopBuilder()
    case "office":
        laptopBuilder = OfficeLaptopBuilder()
    case "high-end":
        laptopBuilder = HighEndLaptopBuilder()
    default:
        print("Idk bruh")
    }
    return laptopBuilder
}

//MARK: - Create builder. Instantiate a director by passing the ref of the builder.
var configuration = ["base_model": "budget"]
var laptopBuilder = createBuilder(configuration: configuration)
var director = Director(builder: laptopBuilder)

/// Invoke directors constructLoop()
director.constructLaptop(configuration: configuration)

/// Retreive the object by calling the builders getLaptop() method
if let laptop = laptopBuilder?.getLaptop() {
    print(laptop)
}







//extension Laptop: CustomStringConvertible {
//    public var description: String {
//        return "\(size) laptop\nProcessor: \(processor)\nGraphics: \(graphics)"
//    }
//}

//public enum Size: String, CustomStringConvertible {
//    case thirteenInch = "13-inch"
//    case fifteenInch = "15-inch"
//
//    public var description: String {
//        return self.rawValue
//    }
//}
//
//public enum Processor: String, CustomStringConvertible {
//    case i5 = "Intel Core i5"
//    case i7 = "Intel Core i7"
//    case i9 = "Intel Core i9"
//
//    public var description: String {
//        return self.rawValue
//    }
//}
//
//public enum Graphics: String, CustomStringConvertible {
//    case intelUHD617 = "Intel UHD Graphics 617"
//    case intelIrisPlus645 = "Intel Iris Plus Graphics 645"
//    case radeonProVega20 = "Radeon Pro Vega 20"
//
//    public var description: String {
//        return self.rawValue
//    }
//}
//
//func buildLaptop(configuration: [String: String]) -> Laptop? {
//
//    // Check if config == base_model
//
//    guard let model = configuration["base_model"] else {
//        return nil
//    }
//
//    var laptop: Laptop?
//
//    switch model {
//
//    case "budget":
//        laptop = Laptop(size: Size.thirteenInch, processor: Processor.i5, graphics: Graphics.intelUHD617)
//
//    case "office":
//        laptop = Laptop(size: Size.fifteenInch, processor: Processor.i7, graphics: Graphics.intelIrisPlus645)
//
//    case "high-end":
//        laptop = Laptop(size: Size.fifteenInch, processor: Processor.i9, graphics: Graphics.radeonProVega20)
//
//    default:
//        print("Nah Son")
//        return nil
//    }
//
//    guard let usersLaptop = laptop else {
//        return nil
//    }
//
//    if let customSize = configuration["size"] {
//        switch customSize {
//
//        case "13-inch":
//
//            usersLaptop.size = Size.thirteenInch
//
//        case "15-inch":
//
//            usersLaptop.size = Size.fifteenInch
//        default:
//            print("Invalid Value")
//        }
//    }
//
//    if let customProcessor = configuration["processor"] {
//        switch customProcessor {
//        case "i5":
//            usersLaptop.processor = Processor.i5
//        case "i7":
//            usersLaptop.processor = Processor.i7
//        case "i9":
//            usersLaptop.processor = Processor.i9
//        default:
//            print("Invalid value")
//        }
//    }
//
//    if let customGraphics = configuration["graphics"]
//    {
//        switch customGraphics {
//        case "intel-uhd-graphics-617":
//            usersLaptop.graphics = Graphics.intelUHD617
//        case "intel-iris-plus-graphics-645":
//            usersLaptop.graphics = Graphics.intelIrisPlus645
//        case "radeon-pro-vega-20":
//            usersLaptop.graphics = Graphics.radeonProVega20
//        default:
//            print("Invalid value")
//        }
//    }
//    return laptop
//}
//
//// Create a budget laptop
//if let laptop = buildLaptop(configuration: ["base_model": "budget"]) {
//    print(laptop)
//}




