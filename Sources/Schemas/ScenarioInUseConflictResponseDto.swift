import Foundation

public struct ScenarioInUseConflictResponseDto: Codable, Hashable, Sendable {
    public let error: ScenarioInUseConflictResponseDtoError
    /// Human-readable reason the scenario cannot be deleted.
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: ScenarioInUseConflictResponseDtoError,
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(ScenarioInUseConflictResponseDtoError.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case message
    }
}