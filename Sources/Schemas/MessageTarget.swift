import Foundation

public struct MessageTarget: Codable, Hashable, Sendable {
    /// This is the role of the message to target.
    /// 
    /// If not specified, will find the position in the message history ignoring role (effectively `any`).
    public let role: MessageTargetRole?
    /// This is the position of the message to target.
    /// - Negative numbers: Count from end (-1 = most recent, -2 = second most recent)
    /// - 0: First/oldest message in history
    /// - Positive numbers: Specific position (0-indexed from start)
    /// 
    /// @default -1 (most recent message)
    public let position: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: MessageTargetRole? = nil,
        position: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.position = position
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decodeIfPresent(MessageTargetRole.self, forKey: .role)
        self.position = try container.decodeIfPresent(Double.self, forKey: .position)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.position, forKey: .position)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case position
    }
}