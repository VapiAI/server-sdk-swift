import Foundation

public struct StructuredOutputRunResult: Codable, Hashable, Sendable {
    /// This is the name of the structured output that produced this value.
    public let name: String
    /// This is the extracted value, shaped by the structured output's schema.
    public let result: Nullable<StructuredOutputRunResultResult>
    public let compliancePlan: ComplianceOverride?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        result: Nullable<StructuredOutputRunResultResult>,
        compliancePlan: ComplianceOverride? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.result = result
        self.compliancePlan = compliancePlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.result = try container.decode(Nullable<StructuredOutputRunResultResult>.self, forKey: .result)
        self.compliancePlan = try container.decodeIfPresent(ComplianceOverride.self, forKey: .compliancePlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.result, forKey: .result)
        try container.encodeIfPresent(self.compliancePlan, forKey: .compliancePlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case result
        case compliancePlan
    }
}