import Foundation

public struct BackoffPlan: Codable, Hashable, Sendable {
    /// This is the type of backoff plan to use. Defaults to fixed.
    /// 
    /// @default fixed
    public let type: [String: JSONValue]
    /// This is the maximum number of retries to attempt if the request fails. Defaults to 0 (no retries).
    /// 
    /// @default 0
    public let maxRetries: Double
    /// This is the base delay in seconds. For linear backoff, this is the delay between each retry. For exponential backoff, this is the initial delay.
    public let baseDelaySeconds: Double
    /// This is the excluded status codes. If the response status code is in this list, the request will not be retried.
    /// By default, the request will be retried for any non-2xx status code.
    public let excludedStatusCodes: [[String: JSONValue]]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: [String: JSONValue],
        maxRetries: Double,
        baseDelaySeconds: Double,
        excludedStatusCodes: [[String: JSONValue]]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.maxRetries = maxRetries
        self.baseDelaySeconds = baseDelaySeconds
        self.excludedStatusCodes = excludedStatusCodes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode([String: JSONValue].self, forKey: .type)
        self.maxRetries = try container.decode(Double.self, forKey: .maxRetries)
        self.baseDelaySeconds = try container.decode(Double.self, forKey: .baseDelaySeconds)
        self.excludedStatusCodes = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .excludedStatusCodes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.maxRetries, forKey: .maxRetries)
        try container.encode(self.baseDelaySeconds, forKey: .baseDelaySeconds)
        try container.encodeIfPresent(self.excludedStatusCodes, forKey: .excludedStatusCodes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case maxRetries
        case baseDelaySeconds
        case excludedStatusCodes
    }
}