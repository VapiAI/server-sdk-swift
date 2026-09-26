import Foundation

public struct CallArtifactUploadItem: Codable, Hashable, Sendable {
    /// The artifact this result refers to.
    public let type: CallArtifactUploadItemType
    /// Whether this artifact was stored successfully in your own configured storage.
    public let success: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: CallArtifactUploadItemType,
        success: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.success = success
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(CallArtifactUploadItemType.self, forKey: .type)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.success, forKey: .success)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case success
    }
}