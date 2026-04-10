import Foundation

public struct MonitorPlan: Codable, Hashable, Sendable {
    /// This determines whether the assistant's calls allow live listening. Defaults to true.
    /// 
    /// Fetch `call.monitor.listenUrl` to get the live listening URL.
    /// 
    /// @default true
    public let listenEnabled: Bool?
    /// This enables authentication on the `call.monitor.listenUrl`.
    /// 
    /// If `listenAuthenticationEnabled` is `true`, the `call.monitor.listenUrl` will require an `Authorization: Bearer <vapi-public-api-key>` header.
    /// 
    /// @default false
    public let listenAuthenticationEnabled: Bool?
    /// This determines whether the assistant's calls allow live control. Defaults to true.
    /// 
    /// Fetch `call.monitor.controlUrl` to get the live control URL.
    /// 
    /// To use, send any control message via a POST request to `call.monitor.controlUrl`. Here are the types of controls supported: https://docs.vapi.ai/api-reference/messages/client-inbound-message
    /// 
    /// @default true
    public let controlEnabled: Bool?
    /// This enables authentication on the `call.monitor.controlUrl`.
    /// 
    /// If `controlAuthenticationEnabled` is `true`, the `call.monitor.controlUrl` will require an `Authorization: Bearer <vapi-public-api-key>` header.
    /// 
    /// @default false
    public let controlAuthenticationEnabled: Bool?
    /// This the set of monitor ids that are attached to the assistant.
    /// The source of truth for the monitor ids is the assistant_monitor join table.
    /// This field can be used for transient assistants and to update assistants with new monitor ids.
    /// 
    /// @default []
    public let monitorIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        listenEnabled: Bool? = nil,
        listenAuthenticationEnabled: Bool? = nil,
        controlEnabled: Bool? = nil,
        controlAuthenticationEnabled: Bool? = nil,
        monitorIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.listenEnabled = listenEnabled
        self.listenAuthenticationEnabled = listenAuthenticationEnabled
        self.controlEnabled = controlEnabled
        self.controlAuthenticationEnabled = controlAuthenticationEnabled
        self.monitorIds = monitorIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.listenEnabled = try container.decodeIfPresent(Bool.self, forKey: .listenEnabled)
        self.listenAuthenticationEnabled = try container.decodeIfPresent(Bool.self, forKey: .listenAuthenticationEnabled)
        self.controlEnabled = try container.decodeIfPresent(Bool.self, forKey: .controlEnabled)
        self.controlAuthenticationEnabled = try container.decodeIfPresent(Bool.self, forKey: .controlAuthenticationEnabled)
        self.monitorIds = try container.decodeIfPresent([String].self, forKey: .monitorIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.listenEnabled, forKey: .listenEnabled)
        try container.encodeIfPresent(self.listenAuthenticationEnabled, forKey: .listenAuthenticationEnabled)
        try container.encodeIfPresent(self.controlEnabled, forKey: .controlEnabled)
        try container.encodeIfPresent(self.controlAuthenticationEnabled, forKey: .controlAuthenticationEnabled)
        try container.encodeIfPresent(self.monitorIds, forKey: .monitorIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case listenEnabled
        case listenAuthenticationEnabled
        case controlEnabled
        case controlAuthenticationEnabled
        case monitorIds
    }
}