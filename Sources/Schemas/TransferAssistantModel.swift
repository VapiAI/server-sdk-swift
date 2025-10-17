import Foundation

public struct TransferAssistantModel: Codable, Hashable, Sendable {
    /// The model provider for the transfer assistant
    public let provider: TransferAssistantModelProvider
    /// The model name - must be compatible with the selected provider
    public let model: String
    /// These are the messages used to configure the transfer assistant.
    /// 
    /// @default: ```
    /// [
    ///   {
    ///     role: 'system',
    ///     content: 'You are a transfer assistant designed to facilitate call transfers. Your core responsibility is to manage the transfer process efficiently.\n\n## Core Responsibility\n- Facilitate the transfer process by using transferSuccessful or transferCancel tools appropriately\n\n## When to Respond\n- Answer questions about the transfer process or provide summaries when specifically asked by the operator\n- Respond to direct questions about the current transfer situation\n\n## What to Avoid\n- Do not discuss topics unrelated to the transfer\n- Do not engage in general conversation\n- Keep all interactions focused on facilitating the transfer\n\n## Transfer Tools\n- Use transferSuccessful when the transfer should proceed\n- Use transferCancel when the transfer cannot be completed\n\nStay focused on your core responsibility of facilitating transfers.'
    ///   }
    /// ]```
    /// 
    /// **Default Behavior:** If you don't provide any messages or don't include a system message as the first message, the default system message above will be automatically added.
    /// 
    /// **Override Default:** To replace the default system message, provide your own system message as the first message in the array.
    /// 
    /// **Add Context:** You can provide additional messages (user, assistant, etc.) to add context while keeping the default system message, or combine them with your custom system message.
    public let messages: [JSONValue]?
    /// Tools available to the transfer assistant during warm-transfer-experimental.
    /// 
    /// **Default Behavior:** The transfer assistant will ALWAYS have both `transferSuccessful` and `transferCancel` tools automatically added, regardless of what you provide here.
    /// 
    /// **Default Tools:**
    /// - `transferSuccessful`: "Call this function to confirm the transfer is successful and connect the customer. Use this when you detect a human has answered and is ready to take the call."
    /// - `transferCancel`: "Call this function to cancel the transfer when no human answers or transfer should not proceed. Use this when you detect voicemail, busy signal, or no answer."
    /// 
    /// **Customization:** You can override the default tools by providing `transferSuccessful` and/or `transferCancel` tools with custom `function` or `messages` configurations.
    /// 
    /// **Additional Tools:** You can also provide other tools, but the two transfer tools will always be present and available to the assistant.
    public let tools: [JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: TransferAssistantModelProvider,
        model: String,
        messages: [JSONValue]? = nil,
        tools: [JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.model = model
        self.messages = messages
        self.tools = tools
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(TransferAssistantModelProvider.self, forKey: .provider)
        self.model = try container.decode(String.self, forKey: .model)
        self.messages = try container.decodeIfPresent([JSONValue].self, forKey: .messages)
        self.tools = try container.decodeIfPresent([JSONValue].self, forKey: .tools)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.model, forKey: .model)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.tools, forKey: .tools)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case model
        case messages
        case tools
    }
}