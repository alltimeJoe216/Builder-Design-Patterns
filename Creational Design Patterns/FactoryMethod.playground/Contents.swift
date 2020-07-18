import UIKit
/*
 
 “The factory method pattern is a good choice if we want to prevent exposing all the implementation types to our callers. Callers must only know about the protocol or the base class, which reduces the dependencies within the system.

 This pattern allows changing the existing implementation types or adding new ones without exposing their details to the components that rely on them.

 Note that the factory method design pattern cannot be applied when there is no common protocol or shared base class.”
 */

//MARK: - This is the stupid way
protocol Theme {
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
}

struct LightTheme: Theme {
    var backgroundColor = UIColor.white
    var textColor = UIColor.black
}

struct DarkTheme: Theme {
    var backgroundColor = UIColor.black
    var textColor = UIColor.white
}

struct BrownTheme: Theme {
    var backgroundColor = UIColor.brown
    var textColor = UIColor.white
}

let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 44))
label.text = "Butt Fuck My Mouth"

//let lightTheme = LightTheme()
//label.backgroundColor = lightTheme.backgroundColor
//label.textColor = lightTheme.textColor
//
//let darkTheme = DarkTheme()
//label.backgroundColor = darkTheme.backgroundColor
//label.textColor = darkTheme.textColor
//
//let brownTheme = BrownTheme()
//label.backgroundColor = brownTheme.backgroundColor
//label.textColor = brownTheme.textColor

//MARK: - Start Use of Factory Method

enum Themes {
    case light
    case dark
    case brown
}

func makeTheme(_ type: Themes) -> Theme {
    let result: Theme
    switch type {
    case .light:
        result = LightTheme()
    case .dark:
        result = DarkTheme()
    case .brown:
        result = BrownTheme()
    }
    return result
}

let darkTheme = makeTheme(Themes.dark)

label.backgroundColor = darkTheme.backgroundColor
label.textColor = darkTheme.textColor

//MARK: - Same case but not in a global function (better idea)

struct ThemeFactory {
    static func makeTheme(_ type: Themes) -> Theme {
        let result: Theme
        switch type {
        case .light: result = LightTheme()
        case .dark: result = DarkTheme()
        case .brown: result = BrownTheme()
        }
        return result
    }
}
