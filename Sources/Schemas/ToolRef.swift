import Foundation

public struct ToolRef: Codable, Hashable, Sendable {
    /// This is the unique identifier of the tool whose version is being pinned.
    public let toolId: String
    /// Public version label of the tool, e.g. "v3"
    public let version: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        toolId: String,
        version: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.toolId = toolId
        self.version = version
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.toolId = try container.decode(String.self, forKey: .toolId)
        self.version = try container.decode(String.self, forKey: .version)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.toolId, forKey: .toolId)
        try container.encode(self.version, forKey: .version)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case toolId
        case version
    }
}