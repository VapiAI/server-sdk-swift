import Foundation

/// This is the provider-specific ID that will be used.
public enum RimeAiVoiceId: Codable, Hashable, Sendable {
    /// Popular Rime AI voices across mist, mistv2, and arcana models. Any valid Rime AI voice ID is accepted, not just these suggestions.
    case rimeAiVoiceIdEnum(RimeAiVoiceIdEnum)
    /// Any valid Rime AI voice ID. See https://docs.rime.ai/docs/voices for the full catalog.
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(RimeAiVoiceIdEnum.self) {
            self = .rimeAiVoiceIdEnum(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .rimeAiVoiceIdEnum(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}