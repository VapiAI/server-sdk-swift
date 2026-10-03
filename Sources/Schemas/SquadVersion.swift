import Foundation

public struct SquadVersion: Codable, Hashable, Sendable {
    /// Optional human-readable label for this version. Set when the version is published.
    public let versionName: Nullable<String>?
    /// Optional description for this version. Set when the version is published.
    public let versionDescription: Nullable<String>?
    /// This is the unique identifier for the version row.
    public let id: String
    /// This is the unique identifier for the org that owns this version.
    public let orgId: String
    /// This is the unique identifier for the squad this version was snapshotted from.
    public let squadId: String
    /// This is the public monotonic version label, e.g. "v1".
    /// System-owned and incremented per squad; never user-supplied.
    public let version: String
    /// This is the SHA-256 hex of the snapshotted content used for no-op detection.
    public let configHash: String
    /// This is the prior version label (vN-1). Null on v1 or for branch roots.
    public let parentVersion: Nullable<String>?
    /// The version this version was restored from. Null when it was not restored.
    public let restoredFromVersion: Nullable<String>?
    /// This is the actor that wrote this version. Email when created via JWT; null
    /// when created via API key, and null for a baseline version authored by nobody.
    public let createdBy: Nullable<String>?
    /// This is the soft-delete timestamp. Null when active.
    public let deletedAt: Nullable<Date>?
    /// This is the ISO 8601 date-time string of when the version was created.
    public let createdAt: Date
    /// This is the name of the squad.
    public let name: String?
    /// This is the list of assistants that make up the squad.
    /// 
    /// The call will start with the first assistant in the list.
    public let members: [SquadMemberDto]
    /// This can be used to override all the assistants' settings and provide values for their template variables.
    /// 
    /// Both `membersOverrides` and `members[n].assistantOverrides` can be used together. First, `members[n].assistantOverrides` is applied. Then, `membersOverrides` is applied as a global override.
    public let membersOverrides: AssistantOverrides?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        versionName: Nullable<String>? = nil,
        versionDescription: Nullable<String>? = nil,
        id: String,
        orgId: String,
        squadId: String,
        version: String,
        configHash: String,
        parentVersion: Nullable<String>? = nil,
        restoredFromVersion: Nullable<String>? = nil,
        createdBy: Nullable<String>? = nil,
        deletedAt: Nullable<Date>? = nil,
        createdAt: Date,
        name: String? = nil,
        members: [SquadMemberDto],
        membersOverrides: AssistantOverrides? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.versionName = versionName
        self.versionDescription = versionDescription
        self.id = id
        self.orgId = orgId
        self.squadId = squadId
        self.version = version
        self.configHash = configHash
        self.parentVersion = parentVersion
        self.restoredFromVersion = restoredFromVersion
        self.createdBy = createdBy
        self.deletedAt = deletedAt
        self.createdAt = createdAt
        self.name = name
        self.members = members
        self.membersOverrides = membersOverrides
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.versionName = try container.decodeNullableIfPresent(String.self, forKey: .versionName)
        self.versionDescription = try container.decodeNullableIfPresent(String.self, forKey: .versionDescription)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.squadId = try container.decode(String.self, forKey: .squadId)
        self.version = try container.decode(String.self, forKey: .version)
        self.configHash = try container.decode(String.self, forKey: .configHash)
        self.parentVersion = try container.decodeNullableIfPresent(String.self, forKey: .parentVersion)
        self.restoredFromVersion = try container.decodeNullableIfPresent(String.self, forKey: .restoredFromVersion)
        self.createdBy = try container.decodeNullableIfPresent(String.self, forKey: .createdBy)
        self.deletedAt = try container.decodeNullableIfPresent(Date.self, forKey: .deletedAt)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.members = try container.decode([SquadMemberDto].self, forKey: .members)
        self.membersOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .membersOverrides)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.versionName, forKey: .versionName)
        try container.encodeNullableIfPresent(self.versionDescription, forKey: .versionDescription)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
        try container.encode(self.squadId, forKey: .squadId)
        try container.encode(self.version, forKey: .version)
        try container.encode(self.configHash, forKey: .configHash)
        try container.encodeNullableIfPresent(self.parentVersion, forKey: .parentVersion)
        try container.encodeNullableIfPresent(self.restoredFromVersion, forKey: .restoredFromVersion)
        try container.encodeNullableIfPresent(self.createdBy, forKey: .createdBy)
        try container.encodeNullableIfPresent(self.deletedAt, forKey: .deletedAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.members, forKey: .members)
        try container.encodeIfPresent(self.membersOverrides, forKey: .membersOverrides)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case versionName
        case versionDescription
        case id
        case orgId
        case squadId
        case version
        case configHash
        case parentVersion
        case restoredFromVersion
        case createdBy
        case deletedAt
        case createdAt
        case name
        case members
        case membersOverrides
    }
}