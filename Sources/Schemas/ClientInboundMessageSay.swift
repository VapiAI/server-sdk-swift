import Foundation

public struct ClientInboundMessageSay: Codable, Hashable, Sendable {
    /// This is the flag for whether the message should replace existing assistant speech.
    /// 
    /// @default false
    public let interruptAssistantEnabled: Bool?
    /// This is the content to say.
    public let content: String?
    /// This is the flag to end call after content is spoken.
    public let endCallAfterSpoken: Bool?
    /// This is the flag for whether the message is interruptible by the user.
    public let interruptionsEnabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        interruptAssistantEnabled: Bool? = nil,
        content: String? = nil,
        endCallAfterSpoken: Bool? = nil,
        interruptionsEnabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.interruptAssistantEnabled = interruptAssistantEnabled
        self.content = content
        self.endCallAfterSpoken = endCallAfterSpoken
        self.interruptionsEnabled = interruptionsEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.interruptAssistantEnabled = try container.decodeIfPresent(Bool.self, forKey: .interruptAssistantEnabled)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.endCallAfterSpoken = try container.decodeIfPresent(Bool.self, forKey: .endCallAfterSpoken)
        self.interruptionsEnabled = try container.decodeIfPresent(Bool.self, forKey: .interruptionsEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.interruptAssistantEnabled, forKey: .interruptAssistantEnabled)
        try container.encodeIfPresent(self.content, forKey: .content)
        try container.encodeIfPresent(self.endCallAfterSpoken, forKey: .endCallAfterSpoken)
        try container.encodeIfPresent(self.interruptionsEnabled, forKey: .interruptionsEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case interruptAssistantEnabled
        case content
        case endCallAfterSpoken
        case interruptionsEnabled
    }
}