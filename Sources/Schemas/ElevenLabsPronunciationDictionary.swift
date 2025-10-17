import Foundation

public struct ElevenLabsPronunciationDictionary: Codable, Hashable, Sendable {
    /// The ID of the pronunciation dictionary
    public let pronunciationDictionaryId: String
    /// The name of the pronunciation dictionary
    public let dictionaryName: String
    /// The user ID of the creator
    public let createdBy: String
    /// The creation time in Unix timestamp
    public let creationTimeUnix: Double
    /// The version ID of the pronunciation dictionary
    public let versionId: String
    /// The number of rules in this version
    public let versionRulesNum: Double
    /// The permission level on this resource
    public let permissionOnResource: ElevenLabsPronunciationDictionaryPermissionOnResource?
    /// The description of the pronunciation dictionary
    public let description: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        pronunciationDictionaryId: String,
        dictionaryName: String,
        createdBy: String,
        creationTimeUnix: Double,
        versionId: String,
        versionRulesNum: Double,
        permissionOnResource: ElevenLabsPronunciationDictionaryPermissionOnResource? = nil,
        description: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.pronunciationDictionaryId = pronunciationDictionaryId
        self.dictionaryName = dictionaryName
        self.createdBy = createdBy
        self.creationTimeUnix = creationTimeUnix
        self.versionId = versionId
        self.versionRulesNum = versionRulesNum
        self.permissionOnResource = permissionOnResource
        self.description = description
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pronunciationDictionaryId = try container.decode(String.self, forKey: .pronunciationDictionaryId)
        self.dictionaryName = try container.decode(String.self, forKey: .dictionaryName)
        self.createdBy = try container.decode(String.self, forKey: .createdBy)
        self.creationTimeUnix = try container.decode(Double.self, forKey: .creationTimeUnix)
        self.versionId = try container.decode(String.self, forKey: .versionId)
        self.versionRulesNum = try container.decode(Double.self, forKey: .versionRulesNum)
        self.permissionOnResource = try container.decodeIfPresent(ElevenLabsPronunciationDictionaryPermissionOnResource.self, forKey: .permissionOnResource)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.pronunciationDictionaryId, forKey: .pronunciationDictionaryId)
        try container.encode(self.dictionaryName, forKey: .dictionaryName)
        try container.encode(self.createdBy, forKey: .createdBy)
        try container.encode(self.creationTimeUnix, forKey: .creationTimeUnix)
        try container.encode(self.versionId, forKey: .versionId)
        try container.encode(self.versionRulesNum, forKey: .versionRulesNum)
        try container.encodeIfPresent(self.permissionOnResource, forKey: .permissionOnResource)
        try container.encodeIfPresent(self.description, forKey: .description)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case pronunciationDictionaryId
        case dictionaryName
        case createdBy
        case creationTimeUnix
        case versionId
        case versionRulesNum
        case permissionOnResource
        case description
    }
}