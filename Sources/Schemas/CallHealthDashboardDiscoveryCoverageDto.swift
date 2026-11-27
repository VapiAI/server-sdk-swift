import Foundation

public struct CallHealthDashboardDiscoveryCoverageDto: Codable, Hashable, Sendable {
    public let pendingIssueCategoryCount: Int
    public let blockedIssueCategoryCount: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pendingIssueCategoryCount: Int,
        blockedIssueCategoryCount: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pendingIssueCategoryCount = pendingIssueCategoryCount
        self.blockedIssueCategoryCount = blockedIssueCategoryCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pendingIssueCategoryCount = try container.decode(Int.self, forKey: .pendingIssueCategoryCount)
        self.blockedIssueCategoryCount = try container.decode(Int.self, forKey: .blockedIssueCategoryCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pendingIssueCategoryCount, forKey: .pendingIssueCategoryCount)
        try container.encode(self.blockedIssueCategoryCount, forKey: .blockedIssueCategoryCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pendingIssueCategoryCount
        case blockedIssueCategoryCount
    }
}