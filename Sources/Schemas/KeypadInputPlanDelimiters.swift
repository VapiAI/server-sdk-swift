import Foundation

/// This is the delimiter(s) that will be used to process the input.
/// Can be '#', '*', or an empty array.
public enum KeypadInputPlanDelimiters: String, Codable, Hashable, CaseIterable, Sendable {
    case hash = "#"
    case asterisk = "*"
    case empty = ""
}