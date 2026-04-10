import Foundation

/// This is the provider-specific ID that will be used.
public enum TavusVoiceVoiceId: Codable, Hashable, Sendable {
    case string(String)
    case tavusVoiceVoiceIdZero(TavusVoiceVoiceIdZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(TavusVoiceVoiceIdZero.self) {
            self = .tavusVoiceVoiceIdZero(value)
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
        case .string(let value):
            try container.encode(value)
        case .tavusVoiceVoiceIdZero(let value):
            try container.encode(value)
        }
    }
}