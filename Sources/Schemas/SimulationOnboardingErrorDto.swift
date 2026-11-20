import Foundation

public struct SimulationOnboardingErrorDto: Codable, Hashable, Sendable {
    /// Which refusal this is. Retry `SIMULATION_ONBOARDING_GENERATION_IN_PROGRESS` with the same key and `SIMULATION_ONBOARDING_CONCURRENCY_LIMITED` or `SIMULATION_ONBOARDING_QUOTA_UNAVAILABLE` after `retryAfterSeconds`, send a new key for `SIMULATION_ONBOARDING_IDEMPOTENCY_KEY_REUSED`, and stop for `SIMULATION_ONBOARDING_QUOTA_EXCEEDED`.
    public let code: SimulationOnboardingErrorDtoCode
    /// What happened, written for the user.
    public let message: String
    /// Seconds to wait before retrying, the same value as the `Retry-After` header. For a daily limit, the seconds until 00:00 UTC.
    public let retryAfterSeconds: Double?
    /// The daily limit that was reached, on a daily-limit refusal only.
    public let limit: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: SimulationOnboardingErrorDtoCode,
        message: String,
        retryAfterSeconds: Double? = nil,
        limit: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.message = message
        self.retryAfterSeconds = retryAfterSeconds
        self.limit = limit
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(SimulationOnboardingErrorDtoCode.self, forKey: .code)
        self.message = try container.decode(String.self, forKey: .message)
        self.retryAfterSeconds = try container.decodeIfPresent(Double.self, forKey: .retryAfterSeconds)
        self.limit = try container.decodeIfPresent(Double.self, forKey: .limit)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.message, forKey: .message)
        try container.encodeIfPresent(self.retryAfterSeconds, forKey: .retryAfterSeconds)
        try container.encodeIfPresent(self.limit, forKey: .limit)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case message
        case retryAfterSeconds
        case limit
    }
}