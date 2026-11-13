import Foundation

/// How Reson8 renders filler words in transcripts. Provider default `natural`.
public enum FallbackReson8TranscriberFillerMode: String, Codable, Hashable, CaseIterable, Sendable {
    case clean
    case natural
    case verbatim
}