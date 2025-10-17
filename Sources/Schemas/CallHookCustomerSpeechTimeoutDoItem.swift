import Foundation

public enum CallHookCustomerSpeechTimeoutDoItem: Codable, Hashable, Sendable {
    case say(Say)
    case tool(Tool)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "say":
            self = .say(try Say(from: decoder))
        case "tool":
            self = .tool(try Tool(from: decoder))
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
        case .say(let data):
            try data.encode(to: encoder)
        case .tool(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Say: Codable, Hashable, Sendable {
        public let type: String = "say"
        /// This is the prompt for the assistant to generate a response based on existing conversation.
        /// Can be a string or an array of chat messages.
        public let prompt: SayHookActionPrompt?
        /// This is the message to say
        public let exact: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            prompt: SayHookActionPrompt? = nil,
            exact: [String: JSONValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.prompt = prompt
            self.exact = exact
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.prompt = try container.decodeIfPresent(SayHookActionPrompt.self, forKey: .prompt)
            self.exact = try container.decodeIfPresent([String: JSONValue].self, forKey: .exact)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.prompt, forKey: .prompt)
            try container.encodeIfPresent(self.exact, forKey: .exact)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case prompt
            case exact
        }
    }

    public struct Tool: Codable, Hashable, Sendable {
        public let type: String = "tool"
        /// This is the tool to call. To use an existing tool, send `toolId` instead.
        public let tool: ToolCallHookActionTool?
        /// This is the tool to call. To use a transient tool, send `tool` instead.
        public let toolId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            tool: ToolCallHookActionTool? = nil,
            toolId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.tool = tool
            self.toolId = toolId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.tool = try container.decodeIfPresent(ToolCallHookActionTool.self, forKey: .tool)
            self.toolId = try container.decodeIfPresent(String.self, forKey: .toolId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.tool, forKey: .tool)
            try container.encodeIfPresent(self.toolId, forKey: .toolId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case tool
            case toolId
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}