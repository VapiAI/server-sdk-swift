import Foundation

extension Requests {
    public struct CreateSimulationRunDto: Codable, Hashable, Sendable {
        /// Generate directly attached target structured outputs. Default false. Enabled extraction may incur additional model charges.
        public let includeTargetStructuredOutputs: Bool?
        /// Array of simulations and/or suites to run
        public let simulations: [CreateSimulationRunDtoSimulationsItem]
        /// Target to test against
        public let target: CreateSimulationRunDtoTarget
        /// Number of times to run each simulation (default: 1)
        public let iterations: Double?
        /// Transport configuration for the simulation runs
        public let transport: SimulationRunTransportConfiguration?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            includeTargetStructuredOutputs: Bool? = nil,
            simulations: [CreateSimulationRunDtoSimulationsItem],
            target: CreateSimulationRunDtoTarget,
            iterations: Double? = nil,
            transport: SimulationRunTransportConfiguration? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.includeTargetStructuredOutputs = includeTargetStructuredOutputs
            self.simulations = simulations
            self.target = target
            self.iterations = iterations
            self.transport = transport
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.includeTargetStructuredOutputs = try container.decodeIfPresent(Bool.self, forKey: .includeTargetStructuredOutputs)
            self.simulations = try container.decode([CreateSimulationRunDtoSimulationsItem].self, forKey: .simulations)
            self.target = try container.decode(CreateSimulationRunDtoTarget.self, forKey: .target)
            self.iterations = try container.decodeIfPresent(Double.self, forKey: .iterations)
            self.transport = try container.decodeIfPresent(SimulationRunTransportConfiguration.self, forKey: .transport)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.includeTargetStructuredOutputs, forKey: .includeTargetStructuredOutputs)
            try container.encode(self.simulations, forKey: .simulations)
            try container.encode(self.target, forKey: .target)
            try container.encodeIfPresent(self.iterations, forKey: .iterations)
            try container.encodeIfPresent(self.transport, forKey: .transport)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case includeTargetStructuredOutputs
            case simulations
            case target
            case iterations
            case transport
        }
    }
}