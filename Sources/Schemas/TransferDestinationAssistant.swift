import Foundation

public struct TransferDestinationAssistant: Codable, Hashable, Sendable {
    /// This is spoken to the customer before connecting them to the destination.
    /// 
    /// Usage:
    /// - If this is not provided and transfer tool messages is not provided, default is "Transferring the call now".
    /// - If set to "", nothing is spoken. This is useful when you want to silently transfer. This is especially useful when transferring between assistants in a squad. In this scenario, you likely also want to set `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message` for the destination assistant.
    /// 
    /// This accepts a string or a ToolMessageStart class. Latter is useful if you want to specify multiple messages for different languages through the `contents` field.
    public let message: TransferDestinationAssistantMessage?
    /// This is the mode to use for the transfer. Defaults to `rolling-history`.
    /// 
    /// - `rolling-history`: This is the default mode. It keeps the entire conversation history and appends the new assistant's system message on transfer.
    /// 
    ///   Example:
    /// 
    ///   Pre-transfer:
    ///     system: assistant1 system message
    ///     assistant: assistant1 first message
    ///     user: hey, good morning
    ///     assistant: how can i help?
    ///     user: i need help with my account
    ///     assistant: (destination.message)
    /// 
    ///   Post-transfer:
    ///     system: assistant1 system message
    ///     assistant: assistant1 first message
    ///     user: hey, good morning
    ///     assistant: how can i help?
    ///     user: i need help with my account
    ///     assistant: (destination.message)
    ///     system: assistant2 system message
    ///     assistant: assistant2 first message (or model generated if firstMessageMode is set to `assistant-speaks-first-with-model-generated-message`)
    /// 
    /// - `swap-system-message-in-history`: This replaces the original system message with the new assistant's system message on transfer.
    /// 
    ///   Example:
    /// 
    ///   Pre-transfer:
    ///     system: assistant1 system message
    ///     assistant: assistant1 first message
    ///     user: hey, good morning
    ///     assistant: how can i help?
    ///     user: i need help with my account
    ///     assistant: (destination.message)
    /// 
    ///   Post-transfer:
    ///     system: assistant2 system message
    ///     assistant: assistant1 first message
    ///     user: hey, good morning
    ///     assistant: how can i help?
    ///     user: i need help with my account
    ///     assistant: (destination.message)
    ///     assistant: assistant2 first message (or model generated if firstMessageMode is set to `assistant-speaks-first-with-model-generated-message`)
    /// 
    /// - `delete-history`: This deletes the entire conversation history on transfer.
    /// 
    ///   Example:
    /// 
    ///   Pre-transfer:
    ///     system: assistant1 system message
    ///     assistant: assistant1 first message
    ///     user: hey, good morning
    ///     assistant: how can i help?
    ///     user: i need help with my account
    ///     assistant: (destination.message)
    /// 
    ///   Post-transfer:
    ///     system: assistant2 system message
    ///     assistant: assistant2 first message
    ///     user: Yes, please
    ///     assistant: how can i help?
    ///     user: i need help with my account
    /// 
    /// - `swap-system-message-in-history-and-remove-transfer-tool-messages`: This replaces the original system message with the new assistant's system message on transfer and removes transfer tool messages from conversation history sent to the LLM.
    /// 
    ///   Example:
    /// 
    ///   Pre-transfer:
    ///     system: assistant1 system message
    ///     assistant: assistant1 first message
    ///     user: hey, good morning
    ///     assistant: how can i help?
    ///     user: i need help with my account
    ///     transfer-tool
    ///     transfer-tool-result
    ///     assistant: (destination.message)
    /// 
    ///   Post-transfer:
    ///     system: assistant2 system message
    ///     assistant: assistant1 first message
    ///     user: hey, good morning
    ///     assistant: how can i help?
    ///     user: i need help with my account
    ///     assistant: (destination.message)
    ///     assistant: assistant2 first message (or model generated if firstMessageMode is set to `assistant-speaks-first-with-model-generated-message`)
    /// 
    /// @default 'rolling-history'
    public let transferMode: TransferMode?
    /// This is the assistant to transfer the call to.
    public let assistantName: String
    /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
    public let description: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        message: TransferDestinationAssistantMessage? = nil,
        transferMode: TransferMode? = nil,
        assistantName: String,
        description: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.message = message
        self.transferMode = transferMode
        self.assistantName = assistantName
        self.description = description
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decodeIfPresent(TransferDestinationAssistantMessage.self, forKey: .message)
        self.transferMode = try container.decodeIfPresent(TransferMode.self, forKey: .transferMode)
        self.assistantName = try container.decode(String.self, forKey: .assistantName)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(self.transferMode, forKey: .transferMode)
        try container.encode(self.assistantName, forKey: .assistantName)
        try container.encodeIfPresent(self.description, forKey: .description)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case message
        case transferMode
        case assistantName
        case description
    }
}