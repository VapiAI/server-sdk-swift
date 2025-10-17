import Foundation

public enum HandoffToolDestinationsItem: Codable, Hashable, Sendable {
    case assistant(Assistant)
    case dynamic(Dynamic)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "assistant":
            self = .assistant(try Assistant(from: decoder))
        case "dynamic":
            self = .dynamic(try Dynamic(from: decoder))
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
        case .dynamic(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Assistant: Codable, Hashable, Sendable {
        public let type: String = "assistant"
        /// This is the plan for manipulating the message context before handing off the call to the next assistant.
        public let contextEngineeringPlan: HandoffDestinationAssistantContextEngineeringPlan?
        /// This is the assistant to transfer the call to. You must provide either assistantName or assistantId.
        public let assistantName: String?
        /// This is the assistant id to transfer the call to. You must provide either assistantName or assistantId.
        public let assistantId: String?
        /// This is a transient assistant to transfer the call to. You may provide a transient assistant in the response  `handoff-destination-request` in a dynamic handoff.
        public let assistant: CreateAssistantDto?
        /// This is the variable extraction plan for the handoff tool.
        public let variableExtractionPlan: VariableExtractionPlan?
        /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
        public let description: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            contextEngineeringPlan: HandoffDestinationAssistantContextEngineeringPlan? = nil,
            assistantName: String? = nil,
            assistantId: String? = nil,
            assistant: CreateAssistantDto? = nil,
            variableExtractionPlan: VariableExtractionPlan? = nil,
            description: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.contextEngineeringPlan = contextEngineeringPlan
            self.assistantName = assistantName
            self.assistantId = assistantId
            self.assistant = assistant
            self.variableExtractionPlan = variableExtractionPlan
            self.description = description
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.contextEngineeringPlan = try container.decodeIfPresent(HandoffDestinationAssistantContextEngineeringPlan.self, forKey: .contextEngineeringPlan)
            self.assistantName = try container.decodeIfPresent(String.self, forKey: .assistantName)
            self.assistantId = try container.decodeIfPresent(String.self, forKey: .assistantId)
            self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
            self.variableExtractionPlan = try container.decodeIfPresent(VariableExtractionPlan.self, forKey: .variableExtractionPlan)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.contextEngineeringPlan, forKey: .contextEngineeringPlan)
            try container.encodeIfPresent(self.assistantName, forKey: .assistantName)
            try container.encodeIfPresent(self.assistantId, forKey: .assistantId)
            try container.encodeIfPresent(self.assistant, forKey: .assistant)
            try container.encodeIfPresent(self.variableExtractionPlan, forKey: .variableExtractionPlan)
            try container.encodeIfPresent(self.description, forKey: .description)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case contextEngineeringPlan
            case assistantName
            case assistantId
            case assistant
            case variableExtractionPlan
            case description
        }
    }

    public struct Dynamic: Codable, Hashable, Sendable {
        public let type: String = "dynamic"
        /// This is where Vapi will send the handoff-destination-request webhook in a dynamic handoff.
        /// 
        /// The order of precedence is:
        /// 
        /// 1. tool.server.url
        /// 2. assistant.server.url
        /// 3. phoneNumber.server.url
        /// 4. org.server.url
        public let server: Server?
        /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
        public let description: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            server: Server? = nil,
            description: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.server = server
            self.description = description
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.server = try container.decodeIfPresent(Server.self, forKey: .server)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.server, forKey: .server)
            try container.encodeIfPresent(self.description, forKey: .description)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case server
            case description
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}