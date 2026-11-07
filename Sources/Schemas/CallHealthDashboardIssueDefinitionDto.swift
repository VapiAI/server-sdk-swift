import Foundation

public struct CallHealthDashboardIssueDefinitionDto: Codable, Hashable, Sendable {
    public let applicability: Nullable<String>
    public let problem: Nullable<String>
    public let createdTaxonomyVersion: Nullable<Int>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        applicability: Nullable<String>,
        problem: Nullable<String>,
        createdTaxonomyVersion: Nullable<Int>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.applicability = applicability
        self.problem = problem
        self.createdTaxonomyVersion = createdTaxonomyVersion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.applicability = try container.decode(Nullable<String>.self, forKey: .applicability)
        self.problem = try container.decode(Nullable<String>.self, forKey: .problem)
        self.createdTaxonomyVersion = try container.decode(Nullable<Int>.self, forKey: .createdTaxonomyVersion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.applicability, forKey: .applicability)
        try container.encode(self.problem, forKey: .problem)
        try container.encode(self.createdTaxonomyVersion, forKey: .createdTaxonomyVersion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case applicability
        case problem
        case createdTaxonomyVersion
    }
}