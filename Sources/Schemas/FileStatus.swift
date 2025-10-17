import Foundation

public enum FileStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case done
    case failed
}