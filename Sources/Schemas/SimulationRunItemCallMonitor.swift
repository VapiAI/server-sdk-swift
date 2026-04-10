import Foundation

public struct SimulationRunItemCallMonitor: Codable, Hashable, Sendable {
    /// This is the WebSocket URL to listen to the live call audio (combined both parties).
    public let listenUrl: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        listenUrl: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.listenUrl = listenUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.listenUrl = try container.decodeIfPresent(String.self, forKey: .listenUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.listenUrl, forKey: .listenUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case listenUrl
    }
}