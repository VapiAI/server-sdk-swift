import Foundation

public struct AssistantManagedConflictResponseDto: Codable, Hashable, Sendable {
    /// Vapi Agents manages the assistant. The lock refuses writes to the assistant itself (update, replace, delete, restore, version delete, traffic splits) and to outcomes, monitors and structured outputs that link or unlink it. It doesn't cover what changes a call without writing the assistant: call-level assistantOverrides or assistantVersion, squad member pins and overrides, which phone number points at it, edits to the tools or knowledge bases it references, or Vapi's own model-retirement sweep.
    public let error: AssistantManagedConflictResponseDtoError
    /// Why the write was rejected and how to make the change in Vapi Agents instead: the agent link, the Vapi Agents MCP URL with the steps to connect it, and which of its tools to call.
    public let message: String
    public let vapiAgents: AssistantManagedVapiAgentsDto
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: AssistantManagedConflictResponseDtoError,
        message: String,
        vapiAgents: AssistantManagedVapiAgentsDto,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.message = message
        self.vapiAgents = vapiAgents
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(AssistantManagedConflictResponseDtoError.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.vapiAgents = try container.decode(AssistantManagedVapiAgentsDto.self, forKey: .vapiAgents)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.vapiAgents, forKey: .vapiAgents)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case message
        case vapiAgents
    }
}