import Foundation

public struct SimulationHookWebhookAction: Codable, Hashable, Sendable {
    public let type: SimulationHookWebhookActionType
    /// Optional server override for this hook action.
    /// If omitted, runtime defaults may apply (e.g. org server).
    public let server: Server?
    /// Optional payload include controls.
    public let include: SimulationHookInclude?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: SimulationHookWebhookActionType,
        server: Server? = nil,
        include: SimulationHookInclude? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.server = server
        self.include = include
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(SimulationHookWebhookActionType.self, forKey: .type)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.include = try container.decodeIfPresent(SimulationHookInclude.self, forKey: .include)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.include, forKey: .include)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case server
        case include
    }
}