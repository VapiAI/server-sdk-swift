import Foundation

public enum CreateScenarioDtoHooksItem: Codable, Hashable, Sendable {
    case simulationRunEnded(SimulationHookCallEnded)
    case simulationRunStarted(SimulationHookCallStarted)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .on)
        switch discriminant {
        case "simulation.run.ended":
            self = .simulationRunEnded(try SimulationHookCallEnded(from: decoder))
        case "simulation.run.started":
            self = .simulationRunStarted(try SimulationHookCallStarted(from: decoder))
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
        case .simulationRunEnded(let data):
            try container.encode("simulation.run.ended", forKey: .on)
            try data.encode(to: encoder)
        case .simulationRunStarted(let data):
            try container.encode("simulation.run.started", forKey: .on)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case on
    }
}