import Foundation

public struct LangfuseServerProbeResponse: Codable, Hashable, Sendable {
    /// Whether {apiUrl}/api/public/health answered at all.
    public let reachable: Bool
    /// The exact version the server reported, e.g. 3.63.0. Absent when the destination answered without one (proxies, adapters) or not at all.
    public let serverVersion: String?
    /// Why the URL was refused without being contacted (a private address, plaintext http). Absent for a destination that was merely unreachable: supplying the version yourself applies there, but not here, because saving would refuse the URL with this same reason.
    public let blockedMessage: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        reachable: Bool,
        serverVersion: String? = nil,
        blockedMessage: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.reachable = reachable
        self.serverVersion = serverVersion
        self.blockedMessage = blockedMessage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.reachable = try container.decode(Bool.self, forKey: .reachable)
        self.serverVersion = try container.decodeIfPresent(String.self, forKey: .serverVersion)
        self.blockedMessage = try container.decodeIfPresent(String.self, forKey: .blockedMessage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.reachable, forKey: .reachable)
        try container.encodeIfPresent(self.serverVersion, forKey: .serverVersion)
        try container.encodeIfPresent(self.blockedMessage, forKey: .blockedMessage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case reachable
        case serverVersion
        case blockedMessage
    }
}