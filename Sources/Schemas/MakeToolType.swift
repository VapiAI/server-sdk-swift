import Foundation

/// The type of tool. "make" for Make tool.
public enum MakeToolType: String, Codable, Hashable, CaseIterable, Sendable {
    case make
}