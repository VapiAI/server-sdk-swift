import Foundation

/// This is the provider-specific ID that will be used. Ensure the Voice is present in your 11Labs Voice Library.
public enum FallbackElevenLabsVoiceId: Codable, Hashable, Sendable {
    case fallbackElevenLabsVoiceIdEnum(FallbackElevenLabsVoiceIdEnum)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(FallbackElevenLabsVoiceIdEnum.self) {
            self = .fallbackElevenLabsVoiceIdEnum(value)
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
        case .fallbackElevenLabsVoiceIdEnum(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}