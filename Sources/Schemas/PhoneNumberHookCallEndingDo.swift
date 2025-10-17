import Foundation

/// This is the action to perform when the hook triggers
public enum PhoneNumberHookCallEndingDo: Codable, Hashable, Sendable {
    case transfer(Transfer)
    case say(Say)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "transfer":
            self = .transfer(try Transfer(from: decoder))
        case "say":
            self = .say(try Say(from: decoder))
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
        switch self {
        case .transfer(let data):
            try data.encode(to: encoder)
        case .say(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Transfer: Codable, Hashable, Sendable {
        public let type: String = "transfer"
        /// This is the destination details for the transfer - can be a phone number or SIP URI
        public let destination: TransferPhoneNumberHookActionDestination?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            destination: TransferPhoneNumberHookActionDestination? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.destination = destination
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.destination = try container.decodeIfPresent(TransferPhoneNumberHookActionDestination.self, forKey: .destination)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.destination, forKey: .destination)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case destination
        }
    }

    public struct Say: Codable, Hashable, Sendable {
        public let type: String = "say"
        /// This is the message to say
        public let exact: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            exact: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.exact = exact
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.exact = try container.decode(String.self, forKey: .exact)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.exact, forKey: .exact)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case exact
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}