import Foundation

public enum FormatPlanReplacementsItem: Codable, Hashable, Sendable {
    case exact(Exact)
    case regex(Regex)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "exact":
            self = .exact(try Exact(from: decoder))
        case "regex":
            self = .regex(try Regex(from: decoder))
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
        case .exact(let data):
            try data.encode(to: encoder)
        case .regex(let data):
            try data.encode(to: encoder)
        }
    }

    public struct Exact: Codable, Hashable, Sendable {
        public let type: String = "exact"
        /// This option let's you control whether to replace all instances of the key or only the first one. By default, it only replaces the first instance.
        /// Examples:
        /// - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: false }. Before: "hello world, hello universe" | After: "hi world, hello universe"
        /// - For { type: 'exact', key: 'hello', value: 'hi', replaceAllEnabled: true }. Before: "hello world, hello universe" | After: "hi world, hi universe"
        /// @default false
        public let replaceAllEnabled: Bool?
        /// This is the key to replace.
        public let key: String
        /// This is the value that will replace the match.
        public let value: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            replaceAllEnabled: Bool? = nil,
            key: String,
            value: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.replaceAllEnabled = replaceAllEnabled
            self.key = key
            self.value = value
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.replaceAllEnabled = try container.decodeIfPresent(Bool.self, forKey: .replaceAllEnabled)
            self.key = try container.decode(String.self, forKey: .key)
            self.value = try container.decode(String.self, forKey: .value)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encodeIfPresent(self.replaceAllEnabled, forKey: .replaceAllEnabled)
            try container.encode(self.key, forKey: .key)
            try container.encode(self.value, forKey: .value)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case replaceAllEnabled
            case key
            case value
        }
    }

    public struct Regex: Codable, Hashable, Sendable {
        public let type: String = "regex"
        /// This is the regex pattern to replace.
        /// 
        /// Note:
        /// - This works by using the `string.replace` method in Node.JS. Eg. `"hello there".replace(/hello/g, "hi")` will return `"hi there"`.
        /// 
        /// Hot tip:
        /// - In JavaScript, escape `\` when sending the regex pattern. Eg. `"hello\sthere"` will be sent over the wire as `"hellosthere"`. Send `"hello\\sthere"` instead.
        public let regex: String
        /// These are the options for the regex replacement. Defaults to all disabled.
        /// 
        /// @default []
        public let options: [RegexOption]?
        /// This is the value that will replace the match.
        public let value: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            regex: String,
            options: [RegexOption]? = nil,
            value: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.regex = regex
            self.options = options
            self.value = value
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.regex = try container.decode(String.self, forKey: .regex)
            self.options = try container.decodeIfPresent([RegexOption].self, forKey: .options)
            self.value = try container.decode(String.self, forKey: .value)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.type, forKey: .type)
            try container.encode(self.regex, forKey: .regex)
            try container.encodeIfPresent(self.options, forKey: .options)
            try container.encode(self.value, forKey: .value)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case type
            case regex
            case options
            case value
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}