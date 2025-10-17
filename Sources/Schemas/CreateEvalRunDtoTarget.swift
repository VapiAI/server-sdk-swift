import Foundation

/// This is the target that will be run against the eval
public enum CreateEvalRunDtoTarget: Codable, Hashable, Sendable {
    case assistant(Assistant)
    case squad(Squad)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "assistant":
            self = .assistant(try Assistant(from: decoder))
        case "squad":
            self = .squad(try Squad(from: decoder))
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
        case .assistant(let data):
            try data.encode(to: encoder)
        case .squad(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Assistant: Codable, Hashable, Sendable {
        public let type: String = "assistant"
        /// This is the transient assistant that will be run against the eval
        public let assistant: CreateAssistantDto?
        /// This is the overrides that will be applied to the assistant.
        public let assistantOverrides: AssistantOverrides?
        /// This is the id of the assistant that will be run against the eval
        public let assistantId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            assistant: CreateAssistantDto? = nil,
            assistantOverrides: AssistantOverrides? = nil,
            assistantId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.assistant = assistant
            self.assistantOverrides = assistantOverrides
            self.assistantId = assistantId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
            self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.assistant, forKey: .assistant)
            try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case assistant
            case assistantOverrides
            case assistantId
        }
    }

    public struct Squad: Codable, Hashable, Sendable {
        public let type: String = "squad"
        /// This is the transient squad that will be run against the eval
        public let squad: CreateSquadDto?
        /// This is the overrides that will be applied to the assistants.
        public let assistantOverrides: AssistantOverrides?
        /// This is the id of the squad that will be run against the eval
        public let squadId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            squad: CreateSquadDto? = nil,
            assistantOverrides: AssistantOverrides? = nil,
            squadId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.squad = squad
            self.assistantOverrides = assistantOverrides
            self.squadId = squadId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.squad = try container.decodeIfPresent(CreateSquadDto.self, forKey: .squad)
            self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
            self.squadId = try container.decodeIfPresent(String.self, forKey: .squadId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.squad, forKey: .squad)
            try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
            try container.encodeIfPresent(self.squadId, forKey: .squadId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case squad
            case assistantOverrides
            case squadId
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}