import Foundation

public struct CreateSquadDto: Codable, Hashable, Sendable {
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
        name: String? = nil,
        members: [SquadMemberDto],
        membersOverrides: AssistantOverrides? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.members = members
        self.membersOverrides = membersOverrides
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.members = try container.decode([SquadMemberDto].self, forKey: .members)
        self.membersOverrides = try container.decodeIfPresent(AssistantOverrides.self, forKey: .membersOverrides)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.members, forKey: .members)
        try container.encodeIfPresent(self.membersOverrides, forKey: .membersOverrides)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case members
        case membersOverrides
    }
}