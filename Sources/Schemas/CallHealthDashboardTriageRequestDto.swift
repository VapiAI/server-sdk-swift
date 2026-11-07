import Foundation

public struct CallHealthDashboardTriageRequestDto: Codable, Hashable, Sendable {
    public let action: CallHealthDashboardTriageRequestDtoAction
    public let expectedRowVersion: Int
    /// Trimmed; at most 2,048 UTF-16 code units. Empty comments are omitted from activity.
    public let comment: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: CallHealthDashboardTriageRequestDtoAction,
        expectedRowVersion: Int,
        comment: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.expectedRowVersion = expectedRowVersion
        self.comment = comment
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(CallHealthDashboardTriageRequestDtoAction.self, forKey: .action)
        self.expectedRowVersion = try container.decode(Int.self, forKey: .expectedRowVersion)
        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.expectedRowVersion, forKey: .expectedRowVersion)
        try container.encodeIfPresent(self.comment, forKey: .comment)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case expectedRowVersion
        case comment
    }
}