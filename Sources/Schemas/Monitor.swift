import Foundation

public struct Monitor: Codable, Hashable, Sendable {
    /// This is the URL where the assistant's calls can be listened to in real-time. To enable, set `assistant.monitorPlan.listenEnabled` to `true`.
    public let listenUrl: String?
    /// This is the URL where the assistant's calls can be controlled in real-time. To enable, set `assistant.monitorPlan.controlEnabled` to `true`.
    public let controlUrl: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        listenUrl: String? = nil,
        controlUrl: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.listenUrl = listenUrl
        self.controlUrl = controlUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.listenUrl = try container.decodeIfPresent(String.self, forKey: .listenUrl)
        self.controlUrl = try container.decodeIfPresent(String.self, forKey: .controlUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.listenUrl, forKey: .listenUrl)
        try container.encodeIfPresent(self.controlUrl, forKey: .controlUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case listenUrl
        case controlUrl
    }
}