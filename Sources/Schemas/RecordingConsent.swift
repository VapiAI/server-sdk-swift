import Foundation

public struct RecordingConsent: Codable, Hashable, Sendable {
    /// This is the type of recording consent.
    public let type: [String: JSONValue]
    /// This is the date and time the recording consent was granted.
    /// If not specified, it means the recording consent was not granted.
    public let grantedAt: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: [String: JSONValue],
        grantedAt: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.grantedAt = grantedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode([String: JSONValue].self, forKey: .type)
        self.grantedAt = try container.decodeIfPresent(Date.self, forKey: .grantedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.grantedAt, forKey: .grantedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case grantedAt
    }
}