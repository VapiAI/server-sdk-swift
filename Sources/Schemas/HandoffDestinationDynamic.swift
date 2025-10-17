import Foundation

public struct HandoffDestinationDynamic: Codable, Hashable, Sendable {
    /// This is where Vapi will send the handoff-destination-request webhook in a dynamic handoff.
    /// 
    /// The order of precedence is:
    /// 
    /// 1. tool.server.url
    /// 2. assistant.server.url
    /// 3. phoneNumber.server.url
    /// 4. org.server.url
    public let server: Server?
    /// This is the description of the destination, used by the AI to choose when and how to transfer the call.
    public let description: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        server: Server? = nil,
        description: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.server = server
        self.description = description
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.description, forKey: .description)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case server
        case description
    }
}