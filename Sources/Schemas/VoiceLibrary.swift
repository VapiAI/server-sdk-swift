import Foundation

public struct VoiceLibrary: Codable, Hashable, Sendable {
    /// This is the voice provider that will be used.
    public let provider: [String: JSONValue]?
    /// The ID of the voice provided by the provider.
    public let providerId: String?
    /// The unique slug of the voice.
    public let slug: String?
    /// The name of the voice.
    public let name: String?
    /// The language of the voice.
    public let language: String?
    /// The language code of the voice.
    public let languageCode: String?
    /// The model of the voice.
    public let model: String?
    /// The supported models of the voice.
    public let supportedModels: String?
    /// The gender of the voice.
    public let gender: VoiceLibraryGender?
    /// The accent of the voice.
    public let accent: String?
    /// The preview URL of the voice.
    public let previewUrl: String?
    /// The description of the voice.
    public let description: String?
    /// The credential ID of the voice.
    public let credentialId: String?
    /// The unique identifier for the voice library.
    public let id: String
    /// The unique identifier for the organization that this voice library belongs to.
    public let orgId: String
    /// The Public voice is shared accross all the organizations.
    public let isPublic: Bool
    /// The deletion status of the voice.
    public let isDeleted: Bool
    /// The ISO 8601 date-time string of when the voice library was created.
    public let createdAt: Date
    /// The ISO 8601 date-time string of when the voice library was last updated.
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: [String: JSONValue]? = nil,
        providerId: String? = nil,
        slug: String? = nil,
        name: String? = nil,
        language: String? = nil,
        languageCode: String? = nil,
        model: String? = nil,
        supportedModels: String? = nil,
        gender: VoiceLibraryGender? = nil,
        accent: String? = nil,
        previewUrl: String? = nil,
        description: String? = nil,
        credentialId: String? = nil,
        id: String,
        orgId: String,
        isPublic: Bool,
        isDeleted: Bool,
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.providerId = providerId
        self.slug = slug
        self.name = name
        self.language = language
        self.languageCode = languageCode
        self.model = model
        self.supportedModels = supportedModels
        self.gender = gender
        self.accent = accent
        self.previewUrl = previewUrl
        self.description = description
        self.credentialId = credentialId
        self.id = id
        self.orgId = orgId
        self.isPublic = isPublic
        self.isDeleted = isDeleted
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent([String: JSONValue].self, forKey: .provider)
        self.providerId = try container.decodeIfPresent(String.self, forKey: .providerId)
        self.slug = try container.decodeIfPresent(String.self, forKey: .slug)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.languageCode = try container.decodeIfPresent(String.self, forKey: .languageCode)
        self.model = try container.decodeIfPresent(String.self, forKey: .model)
        self.supportedModels = try container.decodeIfPresent(String.self, forKey: .supportedModels)
        self.gender = try container.decodeIfPresent(VoiceLibraryGender.self, forKey: .gender)
        self.accent = try container.decodeIfPresent(String.self, forKey: .accent)
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.credentialId = try container.decodeIfPresent(String.self, forKey: .credentialId)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
        self.isDeleted = try container.decode(Bool.self, forKey: .isDeleted)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.providerId, forKey: .providerId)
        try container.encodeIfPresent(self.slug, forKey: .slug)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.languageCode, forKey: .languageCode)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.supportedModels, forKey: .supportedModels)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encodeIfPresent(self.accent, forKey: .accent)
        try container.encodeIfPresent(self.previewUrl, forKey: .previewUrl)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.credentialId, forKey: .credentialId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.isPublic, forKey: .isPublic)
        try container.encode(self.isDeleted, forKey: .isDeleted)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case providerId
        case slug
        case name
        case language
        case languageCode
        case model
        case supportedModels
        case gender
        case accent
        case previewUrl
        case description
        case credentialId
        case id
        case orgId
        case isPublic
        case isDeleted
        case createdAt
        case updatedAt
    }
}