import Foundation

public struct AssistantFallbackWarning: Codable, Hashable, Sendable {
    /// Machine-readable reason for the warning.
    public let code: AssistantFallbackWarningCode
    /// Path of the setting the warning is about, relative to the assistant:
    /// `voice.fallbackPlan.voices[1]` for one fallback, or
    /// `voice.fallbackPlan.voices` for the whole list.
    public let slot: String
    /// Human-readable explanation, in sentence case.
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: AssistantFallbackWarningCode,
        slot: String,
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.slot = slot
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(AssistantFallbackWarningCode.self, forKey: .code)
        self.slot = try container.decode(String.self, forKey: .slot)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.slot, forKey: .slot)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case slot
        case message
    }
}