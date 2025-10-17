import Foundation

public enum TemplateProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case make
    case gohighlevel
    case function
}