import Foundation

/// This is the action to perform when the hook triggers
public enum PhoneNumberHookCallEndingDo: Codable, Hashable, Sendable {
    case say(SayPhoneNumberHookAction)
    case transfer(TransferPhoneNumberHookAction)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "say":
            self = .say(try SayPhoneNumberHookAction(from: decoder))
        case "transfer":
            self = .transfer(try TransferPhoneNumberHookAction(from: decoder))
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
        case .say(let data):
            try container.encode("say", forKey: .type)
            try data.encode(to: encoder)
        case .transfer(let data):
            try container.encode("transfer", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}