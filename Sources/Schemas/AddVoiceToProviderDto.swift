import Foundation

public struct AddVoiceToProviderDto: Codable, Hashable, Sendable {
    /// This is the owner_id of your shared voice which you want to add to your provider Account from Provider Voice Library
    public let ownerId: String
    /// This is the voice_id of the shared voice which you want to add to your provider Account from Provider Voice Library
    public let voiceId: String
    /// This is the new name of the voice which you want to have once you have added voice to your provider Account from Provider Voice Library
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ownerId: String,
        voiceId: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ownerId = ownerId
        self.voiceId = voiceId
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ownerId = try container.decode(String.self, forKey: .ownerId)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ownerId, forKey: .ownerId)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ownerId
        case voiceId
        case name
    }
}