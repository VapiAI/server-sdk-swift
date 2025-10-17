import Foundation

public struct StructuredDataMultiPlan: Codable, Hashable, Sendable {
    /// This is the key of the structured data plan in the catalog.
    public let key: String
    /// This is an individual structured data plan in the catalog.
    public let plan: StructuredDataPlan
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: String,
        plan: StructuredDataPlan,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.plan = plan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(String.self, forKey: .key)
        self.plan = try container.decode(StructuredDataPlan.self, forKey: .plan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.plan, forKey: .plan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case plan
    }
}