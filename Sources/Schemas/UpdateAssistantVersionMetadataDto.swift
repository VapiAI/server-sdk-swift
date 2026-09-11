import Foundation

public struct UpdateAssistantVersionMetadataDto: Codable, Hashable, Sendable {
    /// Optional human-readable label for this version. Pass `null` to clear.
    public let versionName: Nullable<String>?
    /// Optional description for this version. Pass `null` to clear.
    public let versionDescription: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        versionName: Nullable<String>? = nil,
        versionDescription: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.versionName = versionName
        self.versionDescription = versionDescription
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.versionName = try container.decodeNullableIfPresent(String.self, forKey: .versionName)
        self.versionDescription = try container.decodeNullableIfPresent(String.self, forKey: .versionDescription)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.versionName, forKey: .versionName)
        try container.encodeNullableIfPresent(self.versionDescription, forKey: .versionDescription)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case versionName
        case versionDescription
    }
}