import Foundation

/// This is the tag for the token. It represents its scope.
public enum TokenTag: String, Codable, Hashable, CaseIterable, Sendable {
    case `private`
    case `public`
}