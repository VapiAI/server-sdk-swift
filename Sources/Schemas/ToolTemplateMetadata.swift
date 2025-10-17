import Foundation

public struct ToolTemplateMetadata: Codable, Hashable, Sendable {
    public let collectionType: String?
    public let collectionId: String?
    public let collectionName: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        collectionType: String? = nil,
        collectionId: String? = nil,
        collectionName: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.collectionType = collectionType
        self.collectionId = collectionId
        self.collectionName = collectionName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.collectionType = try container.decodeIfPresent(String.self, forKey: .collectionType)
        self.collectionId = try container.decodeIfPresent(String.self, forKey: .collectionId)
        self.collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.collectionType, forKey: .collectionType)
        try container.encodeIfPresent(self.collectionId, forKey: .collectionId)
        try container.encodeIfPresent(self.collectionName, forKey: .collectionName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case collectionType
        case collectionId
        case collectionName
    }
}