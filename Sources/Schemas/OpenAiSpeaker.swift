import Foundation

public struct OpenAiSpeaker: Codable, Hashable, Sendable {
    /// Omit to use model.systemPrompt, or system-role messages when systemPrompt is absent. An explicit empty string is preserved.
    public let instructions: String?
    /// Personality packs append speaking-style guidance to the speaker prompt. Set to an array of pack IDs and test one pack at a time. These are prompt instructions, not fixed speed controls.
    public let personalityPacks: [OpenAiSpeakerPersonalityPacksItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        instructions: String? = nil,
        personalityPacks: [OpenAiSpeakerPersonalityPacksItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.instructions = instructions
        self.personalityPacks = personalityPacks
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instructions = try container.decodeIfPresent(String.self, forKey: .instructions)
        self.personalityPacks = try container.decodeIfPresent([OpenAiSpeakerPersonalityPacksItem].self, forKey: .personalityPacks)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.instructions, forKey: .instructions)
        try container.encodeIfPresent(self.personalityPacks, forKey: .personalityPacks)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case instructions
        case personalityPacks
    }
}