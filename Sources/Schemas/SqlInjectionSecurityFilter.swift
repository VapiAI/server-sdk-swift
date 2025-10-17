import Foundation

public struct SqlInjectionSecurityFilter: Codable, Hashable, Sendable {
    /// The type of security threat to filter.
    public let type: SqlInjection
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: SqlInjection,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(SqlInjection.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
    }

    public enum SqlInjection: String, Codable, Hashable, CaseIterable, Sendable {
        case sqlInjection = "sql-injection"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}