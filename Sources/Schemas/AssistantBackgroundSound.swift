import Foundation

/// This is the background sound in the call. Default for phone calls is 'office' and default for web calls is 'off'.
/// You can also provide a custom sound by providing a URL to an audio file.
public enum AssistantBackgroundSound: Codable, Hashable, Sendable {
    case assistantBackgroundSoundZero(AssistantBackgroundSoundZero)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(AssistantBackgroundSoundZero.self) {
            self = .assistantBackgroundSoundZero(value)
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
        case .assistantBackgroundSoundZero(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}