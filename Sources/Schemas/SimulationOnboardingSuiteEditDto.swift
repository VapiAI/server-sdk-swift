import Foundation

public struct SimulationOnboardingSuiteEditDto: Codable, Hashable, Sendable {
    /// Simulation in the suite whose scenario is rewritten.
    public let simulationId: String
    /// Natural-language instructions for revising this simulation's scenario, such as "Have the caller ask for a refund after 30 days."
    public let instruction: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        simulationId: String,
        instruction: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.simulationId = simulationId
        self.instruction = instruction
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.simulationId = try container.decode(String.self, forKey: .simulationId)
        self.instruction = try container.decode(String.self, forKey: .instruction)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.simulationId, forKey: .simulationId)
        try container.encode(self.instruction, forKey: .instruction)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case simulationId
        case instruction
    }
}