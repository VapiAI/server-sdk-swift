import Foundation

/// The value of the parameter. Any JSON type. String values support Liquid templates.
public enum ToolParameterValue: Codable, Hashable, Sendable {
    case bool(Bool)
    case double(Double)
    case jsonValueArray([JSONValue])
    case string(String)
    case stringToJsonValueDictionary([String: JSONValue])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(value)
        } else if let value = try? container.decode([JSONValue].self) {
            self = .jsonValueArray(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([String: JSONValue].self) {
            self = .stringToJsonValueDictionary(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        case .jsonValueArray(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        case .stringToJsonValueDictionary(let value):
            try container.encode(value)
        }
    }
}