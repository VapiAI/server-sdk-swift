import Foundation

public struct SimulationRunConfiguration: Codable, Hashable, Sendable {
    /// Generate directly attached target structured outputs. Default false. Enabled extraction may incur additional model charges.
    public let includeTargetStructuredOutputs: Bool?
    /// Transport configuration for the simulation run
    public let transport: SimulationRunTransportConfiguration?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        includeTargetStructuredOutputs: Bool? = nil,
        transport: SimulationRunTransportConfiguration? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.includeTargetStructuredOutputs = includeTargetStructuredOutputs
        self.transport = transport
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.includeTargetStructuredOutputs = try container.decodeIfPresent(Bool.self, forKey: .includeTargetStructuredOutputs)
        self.transport = try container.decodeIfPresent(SimulationRunTransportConfiguration.self, forKey: .transport)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.includeTargetStructuredOutputs, forKey: .includeTargetStructuredOutputs)
        try container.encodeIfPresent(self.transport, forKey: .transport)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case includeTargetStructuredOutputs
        case transport
    }
}