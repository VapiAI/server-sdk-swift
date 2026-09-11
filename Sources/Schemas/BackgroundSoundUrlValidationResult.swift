import Foundation

public struct BackgroundSoundUrlValidationResult: Codable, Hashable, Sendable {
    /// Whether the URL currently serves a live media file. When false, calls configured with this URL silently play no background sound.
    public let valid: Bool
    /// Why validation failed. Only present when valid is false.
    public let reason: BackgroundSoundUrlValidationResultReason?
    /// The HTTP status the URL returned, when a response was received.
    public let status: Double?
    /// The content-type the URL returned, when a response was received.
    public let contentType: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        valid: Bool,
        reason: BackgroundSoundUrlValidationResultReason? = nil,
        status: Double? = nil,
        contentType: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.valid = valid
        self.reason = reason
        self.status = status
        self.contentType = contentType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.valid = try container.decode(Bool.self, forKey: .valid)
        self.reason = try container.decodeIfPresent(BackgroundSoundUrlValidationResultReason.self, forKey: .reason)
        self.status = try container.decodeIfPresent(Double.self, forKey: .status)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.valid, forKey: .valid)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case valid
        case reason
        case status
        case contentType
    }
}