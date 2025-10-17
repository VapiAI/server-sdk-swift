import Foundation

public enum VonagePhoneNumberHooksItem: Codable, Hashable, Sendable {
    case callRinging(CallRinging)
    case callEnding(CallEnding)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .on)
        switch discriminant {
        case "call.ringing":
            self = .callRinging(try CallRinging(from: decoder))
        case "call.ending":
            self = .callEnding(try CallEnding(from: decoder))
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
        case .callRinging(let data):
            try data.encode(to: encoder)
        case .callEnding(let data):
            try data.encode(to: encoder)
        }
    }

    public struct CallRinging: Codable, Hashable, Sendable {
        public let on: String = "call.ringing"
        /// Only the first action will be executed. Additional actions will be ignored.
        public let `do`: [PhoneNumberHookCallRingingDoItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            do: [PhoneNumberHookCallRingingDoItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.do = `do`
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.do = try container.decode([PhoneNumberHookCallRingingDoItem].self, forKey: .do)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.on, forKey: .on)
            try container.encode(self.do, forKey: .do)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case on
            case `do`
        }
    }

    public struct CallEnding: Codable, Hashable, Sendable {
        public let on: String = "call.ending"
        /// Optional filters to decide when to trigger - restricted to assistant-request related ended reasons
        public let filters: [PhoneNumberCallEndingHookFilter]?
        /// This is the action to perform when the hook triggers
        public let `do`: PhoneNumberHookCallEndingDo?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            filters: [PhoneNumberCallEndingHookFilter]? = nil,
            do: PhoneNumberHookCallEndingDo? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.filters = filters
            self.do = `do`
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.filters = try container.decodeIfPresent([PhoneNumberCallEndingHookFilter].self, forKey: .filters)
            self.do = try container.decodeIfPresent(PhoneNumberHookCallEndingDo.self, forKey: .do)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.on, forKey: .on)
            try container.encodeIfPresent(self.filters, forKey: .filters)
            try container.encodeIfPresent(self.do, forKey: .do)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case on
            case filters
            case `do`
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case on
    }
}