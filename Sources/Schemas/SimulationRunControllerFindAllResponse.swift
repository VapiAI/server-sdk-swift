import Foundation

public enum SimulationRunControllerFindAllResponse: Codable, Hashable, Sendable {
    case simulationRunArray([SimulationRun])
    case simulationRunsPaginatedResponse(SimulationRunsPaginatedResponse)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([SimulationRun].self) {
            self = .simulationRunArray(value)
        } else if let value = try? container.decode(SimulationRunsPaginatedResponse.self) {
            self = .simulationRunsPaginatedResponse(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .simulationRunArray(let value):
            try container.encode(value)
        case .simulationRunsPaginatedResponse(let value):
            try container.encode(value)
        }
    }
}