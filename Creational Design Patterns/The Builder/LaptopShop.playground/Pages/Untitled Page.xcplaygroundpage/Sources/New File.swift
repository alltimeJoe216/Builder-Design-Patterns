import Foundation

//MARK: - New Protocol

public protocol LaptopBuilder {
    var size: Size {get set}
    var processor: Processor {get set}
    var graphics: Graphics {get set}
    
    // mutating keyword, because it changes the internal state of the builder.
    mutating func buildParts(configuration: [String: String])
    
    func getLaptop() -> Laptop
}

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

extension Laptop: CustomStringConvertible {
    public var description: String {
        return "\(size) laptop\nProcessor: \(processor)\nGraphics: \(graphics)"
    }
}

public enum Size: String, CustomStringConvertible {
    case thirteenInch = "13-inch"
    case fifteenInch = "15-inch"
    
    public var description: String {
        return self.rawValue
    }
}

public enum Processor: String, CustomStringConvertible {
    case i5 = "Intel Core i5"
    case i7 = "Intel Core i7"
    case i9 = "Intel Core i9"
    
    public var description: String {
        return self.rawValue
    }
}

public enum Graphics: String, CustomStringConvertible {
    case intelUHD617 = "Intel UHD Graphics 617"
    case intelIrisPlus645 = "Intel Iris Plus Graphics 645"
    case radeonProVega20 = "Radeon Pro Vega 20"
    
    public var description: String {
        return self.rawValue
    }
}

//MARK: - Extension of protocol LaptopBuilder declared at top

extension LaptopBuilder {
    mutating public func buildParts(configuration: [String: String]) {
        
        if let customSize = configuration["size"] {
            switch customSize {
            case "13-inch":
                size = Size.thirteenInch
            case "15-inch":
            size = Size.fifteenInch
            default:
                print("Invalid value")
            }
        }
        
        if let customProcessor = configuration["processor"] {
            switch customProcessor {
            case "i5":
                processor = Processor.i5
            case "i7":
                processor = Processor.i7
            case "i9":
                processor = Processor.i9
            default:
                print("Invalid value")
            }
        }
        
        if let customGraphics = configuration["graphics"]
        {
            switch customGraphics {
            case "intel-uhd-graphics-617":
                graphics = Graphics.intelUHD617
            case "intel-iris-plus-graphics-645":
                graphics = Graphics.intelIrisPlus645
            case "radeon-pro-vega-20":
                graphics = Graphics.radeonProVega20
            default:
                print("Invalid value")
            }
        }
    }
    
    //instantiated with the values above
    public func getLaptop() -> Laptop {
        return Laptop(size: size, processor: processor, graphics: graphics)
    }
}

// MARK: - Builder Classes

public class BudgetLaptopBuilder: LaptopBuilder {
    
    public var size = Size.thirteenInch
    public var processor = Processor.i5
    public var graphics = Graphics.intelUHD617
    public init() {}
}

public class OfficeLaptopBuilder: LaptopBuilder {
    public var size = Size.fifteenInch
    public var processor = Processor.i7
    public var graphics = Graphics.intelIrisPlus645
    public init() {}
}

public class HighEndLaptopBuilder: LaptopBuilder {
    
    public var size = Size.thirteenInch
    public var processor = Processor.i5
    public var graphics = Graphics.intelUHD617
    public init() {}
}

//MARK: - Director class. Defines an init that takes a (Laptop)Builder class as an argument
public class Director {
    
    private var builder: LaptopBuilder?
    
    public init(builder: LaptopBuilder?) {
        self.builder = builder
    }
    
    /// This method relies on the builder of this class to parse the configuration and create the parts
    public func constructLaptop(configuration: [String: String]) {
        builder?.buildParts(configuration: configuration)
    }
}

