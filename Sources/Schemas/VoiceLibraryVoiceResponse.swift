import Foundation

public struct VoiceLibraryVoiceResponse: Codable, Hashable, Sendable {
    public let voiceId: String
    public let name: String
    public let publicOwnerId: String?
    public let description: String?
    public let gender: String?
    public let age: [String: JSONValue]?
    public let accent: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        voiceId: String,
        name: String,
        publicOwnerId: String? = nil,
        description: String? = nil,
        gender: String? = nil,
        age: [String: JSONValue]? = nil,
        accent: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.voiceId = voiceId
        self.name = name
        self.publicOwnerId = publicOwnerId
        self.description = description
        self.gender = gender
        self.age = age
        self.accent = accent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.voiceId = try container.decode(String.self, forKey: .voiceId)
        self.name = try container.decode(String.self, forKey: .name)
        self.publicOwnerId = try container.decodeIfPresent(String.self, forKey: .publicOwnerId)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.age = try container.decodeIfPresent([String: JSONValue].self, forKey: .age)
        self.accent = try container.decodeIfPresent(String.self, forKey: .accent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.voiceId, forKey: .voiceId)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.publicOwnerId, forKey: .publicOwnerId)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encodeIfPresent(self.age, forKey: .age)
        try container.encodeIfPresent(self.accent, forKey: .accent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case voiceId
        case name
        case publicOwnerId
        case description
        case gender
        case age
        case accent
    }
}