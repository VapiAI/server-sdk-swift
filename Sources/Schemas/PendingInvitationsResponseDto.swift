import Foundation

public struct PendingInvitationsResponseDto: Codable, Hashable, Sendable {
    public let invitations: [PendingInvitationDto]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        invitations: [PendingInvitationDto],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.invitations = invitations
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.invitations = try container.decode([PendingInvitationDto].self, forKey: .invitations)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.invitations, forKey: .invitations)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case invitations
    }
}