import Foundation

public enum EvalRunResultMessagesItem: Codable, Hashable, Sendable {
    case user(User)
    case system(System)
    case tool(Tool)
    case assistant(Assistant)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .role)
        switch discriminant {
        case "user":
            self = .user(try User(from: decoder))
        case "system":
            self = .system(try System(from: decoder))
        case "tool":
            self = .tool(try Tool(from: decoder))
        case "assistant":
            self = .assistant(try Assistant(from: decoder))
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
        case .user(let data):
            try data.encode(to: encoder)
        case .system(let data):
            try data.encode(to: encoder)
        case .tool(let data):
            try data.encode(to: encoder)
        case .assistant(let data):
            try data.encode(to: encoder)
        }
    }

    public struct User: Codable, Hashable, Sendable {
        public let role: String = "user"
        /// This is the content of the user message.
        /// This is the message that the user would have sent.
        public let content: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            content: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.content = content
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.content = try container.decode(String.self, forKey: .content)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.role, forKey: .role)
            try container.encode(self.content, forKey: .content)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case role
            case content
        }
    }

    public struct System: Codable, Hashable, Sendable {
        public let role: String = "system"
        /// This is the content of the system message that would have been added in the middle of the conversation.
        /// Do not include the assistant prompt as a part of this message. It will automatically be fetched during runtime.
        public let content: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            content: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.content = content
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.content = try container.decode(String.self, forKey: .content)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.role, forKey: .role)
            try container.encode(self.content, forKey: .content)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case role
            case content
        }
    }

    public struct Tool: Codable, Hashable, Sendable {
        public let role: String = "tool"
        /// This is the content of the tool response message. JSON Objects should be stringified.
        public let content: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            content: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.content = content
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.content = try container.decode(String.self, forKey: .content)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.role, forKey: .role)
            try container.encode(self.content, forKey: .content)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case role
            case content
        }
    }

    public struct Assistant: Codable, Hashable, Sendable {
        public let role: String = "assistant"
        /// This is the content of the assistant message.
        /// This is the message that the assistant would have sent.
        public let content: String?
        /// This is the tool calls that will be made by the assistant.
        public let toolCalls: [ChatEvalAssistantMessageMockToolCall]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            content: String? = nil,
            toolCalls: [ChatEvalAssistantMessageMockToolCall]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.content = content
            self.toolCalls = toolCalls
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.toolCalls = try container.decodeIfPresent([ChatEvalAssistantMessageMockToolCall].self, forKey: .toolCalls)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.role, forKey: .role)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.toolCalls, forKey: .toolCalls)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case role
            case content
            case toolCalls
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
    }
}