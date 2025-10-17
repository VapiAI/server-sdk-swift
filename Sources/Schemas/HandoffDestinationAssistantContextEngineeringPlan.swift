import Foundation

/// This is the plan for manipulating the message context before handing off the call to the next assistant.
public enum HandoffDestinationAssistantContextEngineeringPlan: Codable, Hashable, Sendable {
    case lastNMessages(LastNMessages)
    case none(None)
    case all(All)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "lastNMessages":
            self = .lastNMessages(try LastNMessages(from: decoder))
        case "none":
            self = .none(try None(from: decoder))
        case "all":
            self = .all(try All(from: decoder))
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
        case .lastNMessages(let data):
            try data.encode(to: encoder)
        case .none(let data):
            try data.encode(to: encoder)
        case .all(let data):
            try data.encode(to: encoder)
        }
    }

    public struct LastNMessages: Codable, Hashable, Sendable {
        public let type: String = "lastNMessages"
        /// This is the maximum number of messages to include in the context engineering plan.
        public let maxMessages: Double
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            maxMessages: Double,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.maxMessages = maxMessages
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.maxMessages = try container.decode(Double.self, forKey: .maxMessages)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.maxMessages, forKey: .maxMessages)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case maxMessages
        }
    }

    public struct None: Codable, Hashable, Sendable {
        public let type: String = "none"
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            self.additionalProperties = try decoder.decodeAdditionalProperties(knownKeys: [])
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
        }
    }

    public struct All: Codable, Hashable, Sendable {
        public let type: String = "all"
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            self.additionalProperties = try decoder.decodeAdditionalProperties(knownKeys: [])
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}