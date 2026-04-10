import Foundation

public struct SimulationHookCallEnded: Codable, Hashable, Sendable {
    public let `do`: [SimulationHookWebhookAction]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        do: [SimulationHookWebhookAction],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.do = `do`
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.do = try container.decode([SimulationHookWebhookAction].self, forKey: .do)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.do, forKey: .do)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case `do`
    }
}