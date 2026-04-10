import Foundation

/// This is the background sound in the transfer assistant call. Default for phone calls is 'office' and default for web calls is 'off'.
/// You can also provide a custom sound by providing a URL to an audio file.
public enum TransferAssistantBackgroundSound: Codable, Hashable, Sendable {
    case string(String)
    case transferAssistantBackgroundSoundZero(TransferAssistantBackgroundSoundZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(TransferAssistantBackgroundSoundZero.self) {
            self = .transferAssistantBackgroundSoundZero(value)
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
        case .transferAssistantBackgroundSoundZero(let value):
            try container.encode(value)
        }
    }
}