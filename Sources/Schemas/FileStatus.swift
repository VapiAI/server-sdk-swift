import Foundation

/// The current processing status of the uploaded file.
public enum FileStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case processing
    case done
    case failed
}