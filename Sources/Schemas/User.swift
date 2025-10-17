import Foundation

public struct User: Codable, Hashable, Sendable {
    /// This is the unique identifier for the profile or user.
    public let id: String
    /// This is the ISO 8601 date-time string of when the profile was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the profile was last updated.
    public let updatedAt: Date
    /// This is the email of the user that is associated with the profile.
    public let email: String
    /// This is the full name of the user that is associated with the profile.
    public let fullName: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        createdAt: Date,
        updatedAt: Date,
        email: String,
        fullName: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.email = email
        self.fullName = fullName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.email = try container.decode(String.self, forKey: .email)
        self.fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.email, forKey: .email)
        try container.encodeIfPresent(self.fullName, forKey: .fullName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case createdAt
        case updatedAt
        case email
        case fullName
    }
}