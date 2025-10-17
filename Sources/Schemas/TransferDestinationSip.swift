import Foundation

public struct TransferDestinationSip: Codable, Hashable, Sendable {
    /// This is spoken to the customer before connecting them to the destination.
    /// 
    /// Usage:
    /// - If this is not provided and transfer tool messages is not provided, default is "Transferring the call now".
    /// - If set to "", nothing is spoken. This is useful when you want to silently transfer. This is especially useful when transferring between assistants in a squad. In this scenario, you likely also want to set `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message` for the destination assistant.
    /// 
    /// This accepts a string or a ToolMessageStart class. Latter is useful if you want to specify multiple messages for different languages through the `contents` field.
    public let message: TransferDestinationSipMessage?
    /// This is the SIP URI to transfer the call to.
    public let sipUri: String
    /// This configures how transfer is executed and the experience of the destination party receiving the call. Defaults to `blind-transfer`.
    /// 
    /// @default `transferPlan.mode='blind-transfer'`
    public let transferPlan: TransferPlan?
    /// These are custom headers to be added to SIP refer during transfer call.
    public let sipHeaders: [String: JSONValue]?
    /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
    public let description: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: TransferDestinationSipMessage? = nil,
        sipUri: String,
        transferPlan: TransferPlan? = nil,
        sipHeaders: [String: JSONValue]? = nil,
        description: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.sipUri = sipUri
        self.transferPlan = transferPlan
        self.sipHeaders = sipHeaders
        self.description = description
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decodeIfPresent(TransferDestinationSipMessage.self, forKey: .message)
        self.sipUri = try container.decode(String.self, forKey: .sipUri)
        self.transferPlan = try container.decodeIfPresent(TransferPlan.self, forKey: .transferPlan)
        self.sipHeaders = try container.decodeIfPresent([String: JSONValue].self, forKey: .sipHeaders)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encode(self.sipUri, forKey: .sipUri)
        try container.encodeIfPresent(self.transferPlan, forKey: .transferPlan)
        try container.encodeIfPresent(self.sipHeaders, forKey: .sipHeaders)
        try container.encodeIfPresent(self.description, forKey: .description)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case sipUri
        case transferPlan
        case sipHeaders
        case description
    }
}