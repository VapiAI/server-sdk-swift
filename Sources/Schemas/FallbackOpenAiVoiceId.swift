import Foundation

/// This is the provider-specific ID that will be used.
/// Please note that ash, ballad, coral, sage, and verse may only be used with realtime models.
public enum FallbackOpenAiVoiceId: Codable, Hashable, Sendable {
    case fallbackOpenAiVoiceIdEnum(FallbackOpenAiVoiceIdEnum)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(FallbackOpenAiVoiceIdEnum.self) {
            self = .fallbackOpenAiVoiceIdEnum(value)
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
        case .fallbackOpenAiVoiceIdEnum(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}