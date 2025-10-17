import Foundation

public enum ToolRejectionPlanConditionsItem: Codable, Hashable, Sendable {
    case regex(Regex)
    case liquid(Liquid)
    /// This is the GroupCondition object but Swagger does not display nested schemas correctly.
    case group(Group)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "regex":
            self = .regex(try Regex(from: decoder))
        case "liquid":
            self = .liquid(try Liquid(from: decoder))
        case "group":
            self = .group(try Group(from: decoder))
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
        case .regex(let data):
            try data.encode(to: encoder)
        case .liquid(let data):
            try data.encode(to: encoder)
        case .group(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Regex: Codable, Hashable, Sendable {
        public let type: String = "regex"
        /// This is the regular expression pattern to match against message content.
        /// 
        /// Note:
        /// - This works by using the RegExp.test method in Node.JS. Eg. /hello/.test("hello there") will return true.
        /// 
        /// Hot tips:
        /// - In JavaScript, escape \ when sending the regex pattern. Eg. "hello\sthere" will be sent over the wire as "hellosthere". Send "hello\\sthere" instead.
        /// - RegExp.test does substring matching, so /cat/.test("I love cats") will return true. To do full string matching, use anchors: /^cat$/ will only match exactly "cat".
        /// - Word boundaries \b are useful for matching whole words: /\bcat\b/ matches "cat" but not "cats" or "category".
        /// - Use inline flags for portability: (?i) for case insensitive, (?m) for multiline
        public let regex: String
        /// This is the target for messages to check against.
        /// If not specified, the condition will run on the last message (position: -1).
        /// If role is not specified, it will look at the last message regardless of role.
        /// @default { position: -1 }
        public let target: MessageTarget?
        /// This is the flag that when true, the condition matches if the pattern does NOT match.
        /// Useful for ensuring certain words/phrases are absent.
        /// 
        /// @default false
        public let negate: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            regex: String,
            target: MessageTarget? = nil,
            negate: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.regex = regex
            self.target = target
            self.negate = negate
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.regex = try container.decode(String.self, forKey: .regex)
            self.target = try container.decodeIfPresent(MessageTarget.self, forKey: .target)
            self.negate = try container.decodeIfPresent(Bool.self, forKey: .negate)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.regex, forKey: .regex)
            try container.encodeIfPresent(self.target, forKey: .target)
            try container.encodeIfPresent(self.negate, forKey: .negate)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case regex
            case target
            case negate
        }
    }

    public struct Liquid: Codable, Hashable, Sendable {
        public let type: String = "liquid"
        /// This is the Liquid template that must return exactly "true" or "false" as a string.
        /// The template is evaluated and the entire output must be either "true" or "false" - nothing else.
        /// 
        /// Available variables:
        /// - `messages`: Array of recent messages in OpenAI chat completions format (ChatCompletionMessageParam[])
        ///   Each message has properties like: role ('user', 'assistant', 'system'), content (string), etc.
        /// - `now`: Current timestamp in milliseconds (built-in Liquid variable)
        /// - Any assistant variable values (e.g., `userName`, `accountStatus`)
        /// 
        /// Useful Liquid filters for messages:
        /// - `messages | last: 5` - Get the 5 most recent messages
        /// - `messages | where: 'role', 'user'` - Filter to only user messages
        /// - `messages | reverse` - Reverse the order of messages
        public let liquid: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            liquid: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.liquid = liquid
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.liquid = try container.decode(String.self, forKey: .liquid)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.liquid, forKey: .liquid)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case liquid
        }
    }

    /// This is the GroupCondition object but Swagger does not display nested schemas correctly.
    public struct Group: Codable, Hashable, Sendable {
        public let type: String = "group"
        /// This is the logical operator for combining conditions in this group
        public let `operator`: GroupConditionOperator
        /// This is the list of nested conditions to evaluate.
        /// Supports recursive nesting of groups for complex logic.
        public let conditions: [GroupConditionConditionsItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            operator: GroupConditionOperator,
            conditions: [GroupConditionConditionsItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.operator = `operator`
            self.conditions = conditions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.operator = try container.decode(GroupConditionOperator.self, forKey: .operator)
            self.conditions = try container.decode([GroupConditionConditionsItem].self, forKey: .conditions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.operator, forKey: .operator)
            try container.encode(self.conditions, forKey: .conditions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case `operator`
            case conditions
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}