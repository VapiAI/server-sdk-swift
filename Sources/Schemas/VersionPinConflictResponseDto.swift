import Foundation

public struct VersionPinConflictResponseDto: Codable, Hashable, Sendable {
    public let error: VersionPinConflictResponseDtoError
    /// Human-readable reason the delete was rejected.
    public let message: String
    /// Pins that block the delete.
    public let pinnedBy: [VersionPinReference]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: VersionPinConflictResponseDtoError,
        message: String,
        pinnedBy: [VersionPinReference],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.message = message
        self.pinnedBy = pinnedBy
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(VersionPinConflictResponseDtoError.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.pinnedBy = try container.decode([VersionPinReference].self, forKey: .pinnedBy)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.pinnedBy, forKey: .pinnedBy)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case message
        case pinnedBy
    }
}