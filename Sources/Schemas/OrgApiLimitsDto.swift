import Foundation

public struct OrgApiLimitsDto: Codable, Hashable, Sendable {
    /// Approximate number of API requests counted against the rate limit in the current minute, in the region that served this request. The count lives in a tumbling one-minute window aligned to the UTC clock (unix seconds / 60), so it resets to zero at the top of every minute; there is no reset header — the next boundary is (floor(now / 60) + 1) * 60.
    public let rateLimitUsage: Double
    /// Maximum number of standard API requests allowed per minute, in the region that served this request. Live call media traffic is limited separately and is not reflected here.
    public let rateLimitMax: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        rateLimitUsage: Double,
        rateLimitMax: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.rateLimitUsage = rateLimitUsage
        self.rateLimitMax = rateLimitMax
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rateLimitUsage = try container.decode(Double.self, forKey: .rateLimitUsage)
        self.rateLimitMax = try container.decode(Double.self, forKey: .rateLimitMax)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.rateLimitUsage, forKey: .rateLimitUsage)
        try container.encode(self.rateLimitMax, forKey: .rateLimitMax)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case rateLimitUsage
        case rateLimitMax
    }
}