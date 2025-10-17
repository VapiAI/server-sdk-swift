import Foundation

public struct CustomerSpeechTimeoutOptions: Codable, Hashable, Sendable {
    /// This is the timeout in seconds before action is triggered.
    /// The clock starts when the assistant finishes speaking and remains active until the user speaks.
    /// 
    /// @default 7.5
    public let timeoutSeconds: Double
    /// This is the maximum number of times the hook will trigger in a call.
    /// 
    /// @default 3
    public let triggerMaxCount: Double?
    /// This is whether the counter for hook trigger resets the user speaks.
    /// 
    /// @default never
    public let triggerResetMode: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        timeoutSeconds: Double,
        triggerMaxCount: Double? = nil,
        triggerResetMode: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.timeoutSeconds = timeoutSeconds
        self.triggerMaxCount = triggerMaxCount
        self.triggerResetMode = triggerResetMode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.timeoutSeconds = try container.decode(Double.self, forKey: .timeoutSeconds)
        self.triggerMaxCount = try container.decodeIfPresent(Double.self, forKey: .triggerMaxCount)
        self.triggerResetMode = try container.decodeIfPresent([String: JSONValue].self, forKey: .triggerResetMode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.triggerMaxCount, forKey: .triggerMaxCount)
        try container.encodeIfPresent(self.triggerResetMode, forKey: .triggerResetMode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case timeoutSeconds
        case triggerMaxCount
        case triggerResetMode
    }
}