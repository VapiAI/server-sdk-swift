import Foundation

/// Optional timing metadata. Shape depends on `timing.type`:
/// 
/// - `word-alignment` (ElevenLabs): per-character timing at playback
///   cadence. words[] includes space entries. Best consumed by tracking
///   a running character count: join timing.words, add to a char cursor,
///   and highlight text up to that position. No interpolation needed.
/// 
/// - `word-progress` (Minimax with voice.subtitleType: 'word'): cursor-
///   based word count per TTS segment. Use wordsSpoken as the anchor,
///   interpolate forward using segmentDurationMs or timing.words until
///   the next event arrives.
/// 
/// When absent, the event is a text-only fallback for providers without
/// word-level timing (e.g. Cartesia, Deepgram, Azure). Text emits once
/// per TTS chunk when audio is playing. Optionally interpolate a word
/// cursor at ~3.5 words/sec between events for approximate tracking.
public enum ClientMessageAssistantSpeechTiming: Codable, Hashable, Sendable {
    case wordAlignment(AssistantSpeechWordAlignmentTiming)
    case wordProgress(AssistantSpeechWordProgressTiming)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "word-alignment":
            self = .wordAlignment(try AssistantSpeechWordAlignmentTiming(from: decoder))
        case "word-progress":
            self = .wordProgress(try AssistantSpeechWordProgressTiming(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .wordAlignment(let data):
            try container.encode("word-alignment", forKey: .type)
            try data.encode(to: encoder)
        case .wordProgress(let data):
            try container.encode("word-progress", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}