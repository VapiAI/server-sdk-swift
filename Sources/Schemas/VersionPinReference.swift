import Foundation

public struct VersionPinReference: Codable, Hashable, Sendable {
    /// Kind of source row the pin originates from.
    public let sourceType: VersionPinReferenceSourceType
    /// UUID of the source row (polymorphic, not FK-enforced).
    public let sourceId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        sourceType: VersionPinReferenceSourceType,
        sourceId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.sourceType = sourceType
        self.sourceId = sourceId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sourceType = try container.decode(VersionPinReferenceSourceType.self, forKey: .sourceType)
        self.sourceId = try container.decode(String.self, forKey: .sourceId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.sourceType, forKey: .sourceType)
        try container.encode(self.sourceId, forKey: .sourceId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case sourceType
        case sourceId
    }
}