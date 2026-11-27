import Foundation

/// This is how the value came through.
/// - exact: letter for letter, or as an accepted variant
/// - near: a close spelling, at most about one wrong letter in five
/// - missed: not found
public enum TranscriptKeyValueResultVerdict: String, Codable, Hashable, CaseIterable, Sendable {
    case exact
    case near
    case missed
}