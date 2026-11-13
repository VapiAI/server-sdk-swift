import Foundation

public struct ServerMessageResponseCampaignPredial: Codable, Hashable, Sendable {
    /// This is whether the contact is eligible to be dialed. `true` places the call; `false` skips the contact. Any other response — a missing or non-boolean `eligible`, an unreachable server, an error, or a timeout — records a pre-dial failure for the contact and the call is not placed.
    public let eligible: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        eligible: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.eligible = eligible
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.eligible = try container.decode(Bool.self, forKey: .eligible)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.eligible, forKey: .eligible)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case eligible
    }
}