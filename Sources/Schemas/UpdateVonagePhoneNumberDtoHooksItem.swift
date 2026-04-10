import Foundation

public enum UpdateVonagePhoneNumberDtoHooksItem: Codable, Hashable, Sendable {
    case callEnding(PhoneNumberHookCallEnding)
    case callRinging(PhoneNumberHookCallRinging)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .on)
        switch discriminant {
        case "call.ending":
            self = .callEnding(try PhoneNumberHookCallEnding(from: decoder))
        case "call.ringing":
            self = .callRinging(try PhoneNumberHookCallRinging(from: decoder))
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
        case .callEnding(let data):
            try container.encode("call.ending", forKey: .on)
            try data.encode(to: encoder)
        case .callRinging(let data):
            try container.encode("call.ringing", forKey: .on)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case on
    }
}