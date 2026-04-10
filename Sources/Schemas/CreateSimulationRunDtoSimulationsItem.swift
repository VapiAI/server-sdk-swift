import Foundation

public enum CreateSimulationRunDtoSimulationsItem: Codable, Hashable, Sendable {
    case simulation(SimulationRunSimulationEntry)
    case simulationSuite(SimulationRunSuiteEntry)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "simulation":
            self = .simulation(try SimulationRunSimulationEntry(from: decoder))
        case "simulationSuite":
            self = .simulationSuite(try SimulationRunSuiteEntry(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .simulation(let data):
            try container.encode("simulation", forKey: .type)
            try data.encode(to: encoder)
        case .simulationSuite(let data):
            try container.encode("simulationSuite", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}