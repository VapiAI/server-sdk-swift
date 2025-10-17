import Foundation

public struct VoiceCost: Codable, Hashable, Sendable {
    /// This is the voice that was used during the call.
    /// 
    /// This matches one of the following:
    /// - `call.assistant.voice`,
    /// - `call.assistantId->voice`,
    /// - `call.squad[n].assistant.voice`,
    /// - `call.squad[n].assistantId->voice`,
    /// - `call.squadId->[n].assistant.voice`,
    /// - `call.squadId->[n].assistantId->voice`.
    public let voice: [String: JSONValue]
    /// This is the number of characters that were generated during the call. These should be total characters used in the call for single assistant calls, while squad calls will have multiple voice costs one for each assistant that was used.
    public let characters: Double
    /// This is the cost of the component in USD.
    public let cost: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voice: [String: JSONValue],
        characters: Double,
        cost: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voice = voice
        self.characters = characters
        self.cost = cost
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voice = try container.decode([String: JSONValue].self, forKey: .voice)
        self.characters = try container.decode(Double.self, forKey: .characters)
        self.cost = try container.decode(Double.self, forKey: .cost)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.voice, forKey: .voice)
        try container.encode(self.characters, forKey: .characters)
        try container.encode(self.cost, forKey: .cost)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voice
        case characters
        case cost
    }
}