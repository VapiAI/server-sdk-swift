import Foundation

public struct TrafficAllocationVersionConflictResponseDto: Codable, Hashable, Sendable {
    public let error: TrafficAllocationVersionConflictResponseDtoError
    /// Human-readable reason the delete was rejected.
    public let message: String
    /// The allocation currently using this version. Create a new allocation without it before deleting the version.
    public let governingAllocationId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: TrafficAllocationVersionConflictResponseDtoError,
        message: String,
        governingAllocationId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.message = message
        self.governingAllocationId = governingAllocationId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(TrafficAllocationVersionConflictResponseDtoError.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.governingAllocationId = try container.decode(String.self, forKey: .governingAllocationId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.governingAllocationId, forKey: .governingAllocationId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case message
        case governingAllocationId
    }
}