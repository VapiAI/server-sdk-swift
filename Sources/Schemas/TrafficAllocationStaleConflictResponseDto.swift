import Foundation

public struct TrafficAllocationStaleConflictResponseDto: Codable, Hashable, Sendable {
    public let error: TrafficAllocationStaleConflictResponseDtoError
    /// Human-readable reason the create was rejected.
    public let message: String
    /// The allocation currently in effect. Null if none exists yet.
    public let currentAllocationId: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: TrafficAllocationStaleConflictResponseDtoError,
        message: String,
        currentAllocationId: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.message = message
        self.currentAllocationId = currentAllocationId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(TrafficAllocationStaleConflictResponseDtoError.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.currentAllocationId = try container.decodeNullableIfPresent(String.self, forKey: .currentAllocationId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
        try container.encodeNullableIfPresent(self.currentAllocationId, forKey: .currentAllocationId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case message
        case currentAllocationId
    }
}