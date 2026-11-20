import Foundation

/// The object type. This is always `file`.
public enum FileObject: String, Codable, Hashable, CaseIterable, Sendable {
    case file
}