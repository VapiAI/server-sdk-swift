import Foundation

public struct AssistantDraftConflictResponseDto: Codable, Hashable, Sendable {
    public let existingDraftId: Nullable<String>
    public let error: String
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        existingDraftId: Nullable<String>,
        error: String,
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.existingDraftId = existingDraftId
        self.error = error
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.existingDraftId = try container.decode(Nullable<String>.self, forKey: .existingDraftId)
        self.error = try container.decode(String.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.existingDraftId, forKey: .existingDraftId)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case existingDraftId
        case error
        case message
    }
}