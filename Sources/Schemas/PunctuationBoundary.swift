import Foundation

public enum PunctuationBoundary: String, Codable, Hashable, CaseIterable, Sendable {
    /// 。
    case circle = "。"
    /// ，
    case fullWidthComma = "，"
    /// .
    case dot = "."
    /// !
    case exclamation = "!"
    /// ?
    case question = "?"
    /// ;
    case semicolon = ";"
    /// )
    case parenthesis = ")"
    /// ،
    case arabicComma = "،"
    /// ۔
    case urduFullStop = "۔"
    /// ।
    case bengaliFullStop = "।"
    /// ॥
    case doubleDanda = "॥"
    /// |
    case pipe = "|"
    /// ||
    case doublePipe = "||"
    /// ,
    case halfWidthComma = ","
    /// :
    case colon = ":"
}