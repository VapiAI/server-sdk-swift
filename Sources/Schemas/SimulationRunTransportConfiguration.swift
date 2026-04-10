import Foundation

public struct SimulationRunTransportConfiguration: Codable, Hashable, Sendable {
    /// Transport provider for the simulation run
    public let provider: SimulationRunTransportConfigurationProvider
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: SimulationRunTransportConfigurationProvider,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(SimulationRunTransportConfigurationProvider.self, forKey: .provider)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
    }
}