//
//  Localization.swift
//  IOS-Playground
//
//  Created by Roman Makeev on 24.12.2022.
//

import Foundation

protocol ILocalization{
    var value: String { get }
}

struct LocalizationResource: ILocalization {
    var key: String
    var value: String { get{ return NSLocalizedString(key, comment: "") } }
    
}
struct LocalizedString: ILocalization {
    var _default: () -> String
    var russian: () -> String
    var value: String {
        get{
            switch(LocalizedString.currentLocale){
                case "ru": return russian()
                default: return _default()
            }
        }
    }
    
    static var currentLocale: String { get { return Locale.current.language.languageCode?.identifier ?? "en" } }
}

class Strings {
    static var helloWorld = LocalizationResource(key: "hello_world")
    
    static var chooseScreen = LocalizedString {
        return "Choose screen"
    } russian: {
        "Выберите экран"
    }
    
    static private var _currentLocale = LocalizedString {
        return "Current locale: %locale%"
    } russian: {
        "Текущая локаль: %locale%"
    }
    static func currentLocale(localeCode: String) -> String {
        return _currentLocale.value.replacingOccurrences(of: "%locale%", with: localeCode)
    }

}
