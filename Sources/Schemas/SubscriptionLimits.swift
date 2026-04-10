import Foundation

public struct SubscriptionLimits: Codable, Hashable, Sendable {
    /// True if this call was blocked by the Call Concurrency limit
    public let concurrencyBlocked: Bool?
    /// Account Call Concurrency limit
    public let concurrencyLimit: Double?
    /// Incremental number of concurrent calls that will be allowed, including this call
    public let remainingConcurrentCalls: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        concurrencyBlocked: Bool? = nil,
        concurrencyLimit: Double? = nil,
        remainingConcurrentCalls: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.concurrencyBlocked = concurrencyBlocked
        self.concurrencyLimit = concurrencyLimit
        self.remainingConcurrentCalls = remainingConcurrentCalls
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.concurrencyBlocked = try container.decodeIfPresent(Bool.self, forKey: .concurrencyBlocked)
        self.concurrencyLimit = try container.decodeIfPresent(Double.self, forKey: .concurrencyLimit)
        self.remainingConcurrentCalls = try container.decodeIfPresent(Double.self, forKey: .remainingConcurrentCalls)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.concurrencyBlocked, forKey: .concurrencyBlocked)
        try container.encodeIfPresent(self.concurrencyLimit, forKey: .concurrencyLimit)
        try container.encodeIfPresent(self.remainingConcurrentCalls, forKey: .remainingConcurrentCalls)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case concurrencyBlocked
        case concurrencyLimit
        case remainingConcurrentCalls
    }
}