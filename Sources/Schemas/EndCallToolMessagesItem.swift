import Foundation

public enum EndCallToolMessagesItem: Codable, Hashable, Sendable {
    case requestStart(RequestStart)
    case requestComplete(RequestComplete)
    case requestFailed(RequestFailed)
    case requestResponseDelayed(RequestResponseDelayed)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "request-start":
            self = .requestStart(try RequestStart(from: decoder))
        case "request-complete":
            self = .requestComplete(try RequestComplete(from: decoder))
        case "request-failed":
            self = .requestFailed(try RequestFailed(from: decoder))
        case "request-response-delayed":
            self = .requestResponseDelayed(try RequestResponseDelayed(from: decoder))
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
        case .requestStart(let data):
            try data.encode(to: encoder)
        case .requestComplete(let data):
            try data.encode(to: encoder)
        case .requestFailed(let data):
            try data.encode(to: encoder)
        case .requestResponseDelayed(let data):
            try data.encode(to: encoder)
        }
    }

    public struct RequestStart: Codable, Hashable, Sendable {
        public let type: String = "request-start"
        /// This is an alternative to the `content` property. It allows to specify variants of the same content, one per language.
        /// 
        /// Usage:
        /// - If your assistants are multilingual, you can provide content for each language.
        /// - If you don't provide content for a language, the first item in the array will be automatically translated to the active language at that moment.
        /// 
        /// This will override the `content` property.
        public let contents: [TextContent]?
        /// This is an optional boolean that if true, the tool call will only trigger after the message is spoken. Default is false.
        /// 
        /// @default false
        public let blocking: Bool?
        /// This is the content that the assistant says when this message is triggered.
        public let content: String?
        /// This is an optional array of conditions that the tool call arguments must meet in order for this message to be triggered.
        public let conditions: [Condition]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            contents: [TextContent]? = nil,
            blocking: Bool? = nil,
            content: String? = nil,
            conditions: [Condition]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.contents = contents
            self.blocking = blocking
            self.content = content
            self.conditions = conditions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.contents = try container.decodeIfPresent([TextContent].self, forKey: .contents)
            self.blocking = try container.decodeIfPresent(Bool.self, forKey: .blocking)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.conditions = try container.decodeIfPresent([Condition].self, forKey: .conditions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.contents, forKey: .contents)
            try container.encodeIfPresent(self.blocking, forKey: .blocking)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.conditions, forKey: .conditions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case contents
            case blocking
            case content
            case conditions
        }
    }

    public struct RequestComplete: Codable, Hashable, Sendable {
        public let type: String = "request-complete"
        /// This is an alternative to the `content` property. It allows to specify variants of the same content, one per language.
        /// 
        /// Usage:
        /// - If your assistants are multilingual, you can provide content for each language.
        /// - If you don't provide content for a language, the first item in the array will be automatically translated to the active language at that moment.
        /// 
        /// This will override the `content` property.
        public let contents: [TextContent]?
        /// This is optional and defaults to "assistant".
        /// 
        /// When role=assistant, `content` is said out loud.
        /// 
        /// When role=system, `content` is passed to the model in a system message. Example:
        ///     system: default one
        ///     assistant:
        ///     user:
        ///     assistant:
        ///     user:
        ///     assistant:
        ///     user:
        ///     assistant: tool called
        ///     tool: your server response
        ///     <--- system prompt as hint
        ///     ---> model generates response which is spoken
        /// This is useful when you want to provide a hint to the model about what to say next.
        public let role: ToolMessageCompleteRole?
        /// This is an optional boolean that if true, the call will end after the message is spoken. Default is false.
        /// 
        /// This is ignored if `role` is set to `system`.
        /// 
        /// @default false
        public let endCallAfterSpokenEnabled: Bool?
        /// This is the content that the assistant says when this message is triggered.
        public let content: String?
        /// This is an optional array of conditions that the tool call arguments must meet in order for this message to be triggered.
        public let conditions: [Condition]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            contents: [TextContent]? = nil,
            role: ToolMessageCompleteRole? = nil,
            endCallAfterSpokenEnabled: Bool? = nil,
            content: String? = nil,
            conditions: [Condition]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.contents = contents
            self.role = role
            self.endCallAfterSpokenEnabled = endCallAfterSpokenEnabled
            self.content = content
            self.conditions = conditions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.contents = try container.decodeIfPresent([TextContent].self, forKey: .contents)
            self.role = try container.decodeIfPresent(ToolMessageCompleteRole.self, forKey: .role)
            self.endCallAfterSpokenEnabled = try container.decodeIfPresent(Bool.self, forKey: .endCallAfterSpokenEnabled)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.conditions = try container.decodeIfPresent([Condition].self, forKey: .conditions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.contents, forKey: .contents)
            try container.encodeIfPresent(self.role, forKey: .role)
            try container.encodeIfPresent(self.endCallAfterSpokenEnabled, forKey: .endCallAfterSpokenEnabled)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.conditions, forKey: .conditions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case contents
            case role
            case endCallAfterSpokenEnabled
            case content
            case conditions
        }
    }

    public struct RequestFailed: Codable, Hashable, Sendable {
        public let type: String = "request-failed"
        /// This is an alternative to the `content` property. It allows to specify variants of the same content, one per language.
        /// 
        /// Usage:
        /// - If your assistants are multilingual, you can provide content for each language.
        /// - If you don't provide content for a language, the first item in the array will be automatically translated to the active language at that moment.
        /// 
        /// This will override the `content` property.
        public let contents: [TextContent]?
        /// This is an optional boolean that if true, the call will end after the message is spoken. Default is false.
        /// 
        /// @default false
        public let endCallAfterSpokenEnabled: Bool?
        /// This is the content that the assistant says when this message is triggered.
        public let content: String?
        /// This is an optional array of conditions that the tool call arguments must meet in order for this message to be triggered.
        public let conditions: [Condition]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            contents: [TextContent]? = nil,
            endCallAfterSpokenEnabled: Bool? = nil,
            content: String? = nil,
            conditions: [Condition]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.contents = contents
            self.endCallAfterSpokenEnabled = endCallAfterSpokenEnabled
            self.content = content
            self.conditions = conditions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.contents = try container.decodeIfPresent([TextContent].self, forKey: .contents)
            self.endCallAfterSpokenEnabled = try container.decodeIfPresent(Bool.self, forKey: .endCallAfterSpokenEnabled)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.conditions = try container.decodeIfPresent([Condition].self, forKey: .conditions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.contents, forKey: .contents)
            try container.encodeIfPresent(self.endCallAfterSpokenEnabled, forKey: .endCallAfterSpokenEnabled)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.conditions, forKey: .conditions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case contents
            case endCallAfterSpokenEnabled
            case content
            case conditions
        }
    }

    public struct RequestResponseDelayed: Codable, Hashable, Sendable {
        public let type: String = "request-response-delayed"
        /// This is an alternative to the `content` property. It allows to specify variants of the same content, one per language.
        /// 
        /// Usage:
        /// - If your assistants are multilingual, you can provide content for each language.
        /// - If you don't provide content for a language, the first item in the array will be automatically translated to the active language at that moment.
        /// 
        /// This will override the `content` property.
        public let contents: [TextContent]?
        /// The number of milliseconds to wait for the server response before saying this message.
        public let timingMilliseconds: Double?
        /// This is the content that the assistant says when this message is triggered.
        public let content: String?
        /// This is an optional array of conditions that the tool call arguments must meet in order for this message to be triggered.
        public let conditions: [Condition]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            contents: [TextContent]? = nil,
            timingMilliseconds: Double? = nil,
            content: String? = nil,
            conditions: [Condition]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.contents = contents
            self.timingMilliseconds = timingMilliseconds
            self.content = content
            self.conditions = conditions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.contents = try container.decodeIfPresent([TextContent].self, forKey: .contents)
            self.timingMilliseconds = try container.decodeIfPresent(Double.self, forKey: .timingMilliseconds)
            self.content = try container.decodeIfPresent(String.self, forKey: .content)
            self.conditions = try container.decodeIfPresent([Condition].self, forKey: .conditions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.contents, forKey: .contents)
            try container.encodeIfPresent(self.timingMilliseconds, forKey: .timingMilliseconds)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.conditions, forKey: .conditions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case contents
            case timingMilliseconds
            case content
            case conditions
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}