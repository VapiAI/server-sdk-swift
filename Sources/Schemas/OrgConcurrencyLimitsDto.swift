import Foundation

public struct OrgConcurrencyLimitsDto: Codable, Hashable, Sendable {
    /// True when the org is at or over its concurrency limit at the time of the read. This is a status read, not an admission decision: no call was evaluated and no slot is reserved.
    public let concurrencyBlocked: Bool
    /// Maximum number of concurrent calls the subscription allows, at the time of the read. Computed as the subscription's included plus purchased concurrency, defaulting to the initial allowance when either is unset; call create derives its own figure and can differ for subscriptions with an unset allowance.
    public let concurrencyLimit: Double
    /// Plain concurrent-call headroom at the time of the read, floored at zero. Unlike the call create response, this does not include or reserve a slot for a new call.
    public let remainingConcurrentCalls: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        concurrencyBlocked: Bool,
        concurrencyLimit: Double,
        remainingConcurrentCalls: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.concurrencyBlocked = concurrencyBlocked
        self.concurrencyLimit = concurrencyLimit
        self.remainingConcurrentCalls = remainingConcurrentCalls
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.concurrencyBlocked = try container.decode(Bool.self, forKey: .concurrencyBlocked)
        self.concurrencyLimit = try container.decode(Double.self, forKey: .concurrencyLimit)
        self.remainingConcurrentCalls = try container.decode(Double.self, forKey: .remainingConcurrentCalls)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.concurrencyBlocked, forKey: .concurrencyBlocked)
        try container.encode(self.concurrencyLimit, forKey: .concurrencyLimit)
        try container.encode(self.remainingConcurrentCalls, forKey: .remainingConcurrentCalls)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case concurrencyBlocked
        case concurrencyLimit
        case remainingConcurrentCalls
    }
}