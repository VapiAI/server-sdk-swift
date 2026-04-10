import Foundation

/// This is the provider-specific ID that will be used.
public enum FallbackAzureVoiceId: Codable, Hashable, Sendable {
    case fallbackAzureVoiceVoiceIdZero(FallbackAzureVoiceVoiceIdZero)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(FallbackAzureVoiceVoiceIdZero.self) {
            self = .fallbackAzureVoiceVoiceIdZero(value)
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
        case .fallbackAzureVoiceVoiceIdZero(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}