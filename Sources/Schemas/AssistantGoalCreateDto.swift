import Foundation

public struct AssistantGoalCreateDto: Codable, Hashable, Sendable {
    /// Success criteria. Trimmed before commit; blank or non-PostgreSQL-compatible text is rejected.
    public let succeedsWhen: String
    /// Optional trimmed exclusions. Omit or send null for no exclusions.
    public let leaveOut: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        succeedsWhen: String,
        leaveOut: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.succeedsWhen = succeedsWhen
        self.leaveOut = leaveOut
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.succeedsWhen = try container.decode(String.self, forKey: .succeedsWhen)
        self.leaveOut = try container.decodeNullableIfPresent(String.self, forKey: .leaveOut)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.succeedsWhen, forKey: .succeedsWhen)
        try container.encodeNullableIfPresent(self.leaveOut, forKey: .leaveOut)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case succeedsWhen
        case leaveOut
    }
}