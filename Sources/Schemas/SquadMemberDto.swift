import Foundation

public struct SquadMemberDto: Codable, Hashable, Sendable {
    public let assistantDestinations: [SquadMemberDtoAssistantDestinationsItem]?
    /// This is the assistant that will be used for the call. To use a transient assistant, use `assistant` instead.
    public let assistantId: Nullable<String>?
    /// This is the assistant that will be used for the call. To use an existing assistant, use `assistantId` instead.
    public let assistant: CreateAssistantDto?
    /// This can be used to override the assistant's settings and provide values for it's template variables.
    public let assistantOverrides: AssistantOverrides?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assistantDestinations: [SquadMemberDtoAssistantDestinationsItem]? = nil,
        assistantId: Nullable<String>? = nil,
        assistant: CreateAssistantDto? = nil,
        assistantOverrides: AssistantOverrides? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assistantDestinations = assistantDestinations
        self.assistantId = assistantId
        self.assistant = assistant
        self.assistantOverrides = assistantOverrides
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assistantDestinations = try container.decodeIfPresent([SquadMemberDtoAssistantDestinationsItem].self, forKey: .assistantDestinations)
        self.assistantId = try container.decodeNullableIfPresent(String.self, forKey: .assistantId)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.assistantOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .assistantOverrides)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assistantDestinations, forKey: .assistantDestinations)
        try container.encodeNullableIfPresent(self.assistantId, forKey: .assistantId)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.assistantOverrides, forKey: .assistantOverrides)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assistantDestinations
        case assistantId
        case assistant
        case assistantOverrides
    }
}