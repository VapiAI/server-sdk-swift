import Foundation

public struct CallHealthDashboardIssueActivityDto: Codable, Hashable, Sendable {
    /// Existing issue version after this transition; also the per-issue activity identity.
    public let rowVersion: Int
    /// User resolve, dismiss or restore, or the system reopen written when a new match reopens a resolved issue.
    public let action: CallHealthDashboardIssueActivityDtoAction
    /// Omitted for private-key actors and system entries; names/emails are not copied.
    public let actorUserId: String?
    /// Optional team-visible comment; omitted after privacy scrubbing.
    public let comment: String?
    /// Database action time; ordering uses rowVersion rather than rounded timestamps.
    public let createdAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        rowVersion: Int,
        action: CallHealthDashboardIssueActivityDtoAction,
        actorUserId: String? = nil,
        comment: String? = nil,
        createdAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.rowVersion = rowVersion
        self.action = action
        self.actorUserId = actorUserId
        self.comment = comment
        self.createdAt = createdAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rowVersion = try container.decode(Int.self, forKey: .rowVersion)
        self.action = try container.decode(CallHealthDashboardIssueActivityDtoAction.self, forKey: .action)
        self.actorUserId = try container.decodeIfPresent(String.self, forKey: .actorUserId)
        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.rowVersion, forKey: .rowVersion)
        try container.encode(self.action, forKey: .action)
        try container.encodeIfPresent(self.actorUserId, forKey: .actorUserId)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encode(self.createdAt, forKey: .createdAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case rowVersion
        case action
        case actorUserId
        case comment
        case createdAt
    }
}