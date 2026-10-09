import Foundation

public struct OrgLimitsResponseDto: Codable, Hashable, Sendable {
    /// Call concurrency limits for the subscription. Unlike the call create response, remainingConcurrentCalls does not reserve a slot for a new call: it is the plain headroom at the time of the read. Covers the concurrency gate only — credits, frozen subscriptions, included minutes, and the billing limit are not reflected here, so call create can still refuse. Omitted when the limits could not be computed, and for an org with no subscription at all (legacy ungated orgs), which has no concurrency ceiling.
    public let subscriptionLimits: OrgConcurrencyLimitsDto?
    /// API rate limit usage for the org. Approximate, per region, and scoped to the current minute. Omitted when the limit information is unavailable.
    public let apiLimits: OrgApiLimitsDto?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        subscriptionLimits: OrgConcurrencyLimitsDto? = nil,
        apiLimits: OrgApiLimitsDto? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.subscriptionLimits = subscriptionLimits
        self.apiLimits = apiLimits
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.subscriptionLimits = try container.decodeIfPresent(OrgConcurrencyLimitsDto.self, forKey: .subscriptionLimits)
        self.apiLimits = try container.decodeIfPresent(OrgApiLimitsDto.self, forKey: .apiLimits)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.subscriptionLimits, forKey: .subscriptionLimits)
        try container.encodeIfPresent(self.apiLimits, forKey: .apiLimits)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case subscriptionLimits
        case apiLimits
    }
}