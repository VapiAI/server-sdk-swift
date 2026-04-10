import Foundation

public struct CartesiaPronunciationDictionary: Codable, Hashable, Sendable {
    /// Unique identifier for the pronunciation dictionary
    public let id: String
    /// Name of the pronunciation dictionary
    public let name: String
    /// ID of the user who owns this dictionary
    public let ownerId: String
    /// Whether this dictionary is pinned for the user
    public let pinned: Bool
    /// List of text-to-pronunciation mappings
    public let items: [CartesiaPronunciationDictItem]
    /// ISO 8601 timestamp of when the dictionary was created
    public let createdAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: String,
        ownerId: String,
        pinned: Bool,
        items: [CartesiaPronunciationDictItem],
        createdAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.ownerId = ownerId
        self.pinned = pinned
        self.items = items
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.ownerId = try container.decode(String.self, forKey: .ownerId)
        self.pinned = try container.decode(Bool.self, forKey: .pinned)
        self.items = try container.decode([CartesiaPronunciationDictItem].self, forKey: .items)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.ownerId, forKey: .ownerId)
        try container.encode(self.pinned, forKey: .pinned)
        try container.encode(self.items, forKey: .items)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case ownerId
        case pinned
        case items
        case createdAt
    }
}