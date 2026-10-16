import Foundation

/// Controls how long a hook waits for customer speech, how often it can trigger, and when its trigger counter resets.
public struct CustomerSpeechTimeoutOptions: Codable, Hashable, Sendable {
    /// Controls whether the hook's trigger counter resets after the customer speaks. Defaults to `never`.
    public let triggerResetMode: CustomerSpeechTimeoutOptionsTriggerResetMode?
    /// This is the timeout in seconds before action is triggered.
    /// The clock starts when the assistant finishes speaking and remains active until the user speaks.
    /// 
    /// @default 7.5
    /// @minimum 2
    /// @maximum 1000
    public let timeoutSeconds: Double
    /// This is the maximum number of times the hook will trigger in a call.
    /// 
    /// @default 3
    public let triggerMaxCount: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        triggerResetMode: CustomerSpeechTimeoutOptionsTriggerResetMode? = nil,
        timeoutSeconds: Double,
        triggerMaxCount: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.triggerResetMode = triggerResetMode
        self.timeoutSeconds = timeoutSeconds
        self.triggerMaxCount = triggerMaxCount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.triggerResetMode = try container.decodeIfPresent(CustomerSpeechTimeoutOptionsTriggerResetMode.self, forKey: .triggerResetMode)
        self.timeoutSeconds = try container.decode(Double.self, forKey: .timeoutSeconds)
        self.triggerMaxCount = try container.decodeIfPresent(Double.self, forKey: .triggerMaxCount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.triggerResetMode, forKey: .triggerResetMode)
        try container.encode(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.triggerMaxCount, forKey: .triggerMaxCount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case triggerResetMode
        case timeoutSeconds
        case triggerMaxCount
    }
}