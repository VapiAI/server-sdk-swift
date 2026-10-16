import Foundation

public struct CampaignCallMetrics: Codable, Hashable, Sendable {
    /// This is the number of contacts a call was actually placed for. Contacts
    /// that were skipped, rejected before dialing, or failed to dispatch are not
    /// counted — no call existed, so there was nothing to answer.
    public let dialed: Double
    /// This is the number of those calls a human picked up. Voicemail does not
    /// count. Divide by `dialed` for the pick-up rate.
    public let connected: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        dialed: Double,
        connected: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.dialed = dialed
        self.connected = connected
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dialed = try container.decode(Double.self, forKey: .dialed)
        self.connected = try container.decode(Double.self, forKey: .connected)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.dialed, forKey: .dialed)
        try container.encode(self.connected, forKey: .connected)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case dialed
        case connected
    }
}