import Foundation

public struct ScenarioToolMock: Codable, Hashable, Sendable {
    /// The name of the assistant or squad's tool to mock. Must match the tool's name exactly.
    public let toolName: String
    /// The result string returned to the assistant or squad in place of calling the real tool.
    public let result: String?
    /// Set to `true` to apply this mock during the simulation. Defaults to `true`.
    public let enabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        toolName: String,
        result: String? = nil,
        enabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.toolName = toolName
        self.result = result
        self.enabled = enabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.toolName = try container.decode(String.self, forKey: .toolName)
        self.result = try container.decodeIfPresent(String.self, forKey: .result)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.toolName, forKey: .toolName)
        try container.encodeIfPresent(self.result, forKey: .result)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case toolName
        case result
        case enabled
    }
}