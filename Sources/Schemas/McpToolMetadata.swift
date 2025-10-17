import Foundation

public struct McpToolMetadata: Codable, Hashable, Sendable {
    /// This is the protocol used for MCP communication. Defaults to Streamable HTTP.
    public let `protocol`: McpToolMetadataProtocol?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        protocol: McpToolMetadataProtocol? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.protocol = `protocol`
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.protocol = try container.decodeIfPresent(McpToolMetadataProtocol.self, forKey: .protocol)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.protocol, forKey: .protocol)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `protocol`
    }
}