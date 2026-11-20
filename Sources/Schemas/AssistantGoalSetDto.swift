import Foundation

public struct AssistantGoalSetDto: Codable, Hashable, Sendable {
    /// Observed current revision of this goal as a positive decimal bigint string.
    public let expectedGoalVersion: String
    /// Success criteria. Trimmed before commit; blank or non-PostgreSQL-compatible text is rejected.
    public let succeedsWhen: String
    /// Optional trimmed exclusions. Omit or send null for no exclusions.
    public let leaveOut: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        expectedGoalVersion: String,
        succeedsWhen: String,
        leaveOut: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.expectedGoalVersion = expectedGoalVersion
        self.succeedsWhen = succeedsWhen
        self.leaveOut = leaveOut
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.expectedGoalVersion = try container.decode(String.self, forKey: .expectedGoalVersion)
        self.succeedsWhen = try container.decode(String.self, forKey: .succeedsWhen)
        self.leaveOut = try container.decodeNullableIfPresent(String.self, forKey: .leaveOut)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.expectedGoalVersion, forKey: .expectedGoalVersion)
        try container.encode(self.succeedsWhen, forKey: .succeedsWhen)
        try container.encodeNullableIfPresent(self.leaveOut, forKey: .leaveOut)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case expectedGoalVersion
        case succeedsWhen
        case leaveOut
    }
}