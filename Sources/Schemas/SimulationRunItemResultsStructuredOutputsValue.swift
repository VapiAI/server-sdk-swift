import Foundation

public struct SimulationRunItemResultsStructuredOutputsValue: Codable, Hashable, Sendable {
    public let name: String
    public let result: Nullable<JSONValue>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        result: Nullable<JSONValue>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.result = result
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.result = try container.decode(Nullable<JSONValue>.self, forKey: .result)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.result, forKey: .result)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case result
    }
}