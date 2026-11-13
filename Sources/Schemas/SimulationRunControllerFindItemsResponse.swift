import Foundation

public enum SimulationRunControllerFindItemsResponse: Codable, Hashable, Sendable {
    case simulationRunItemArray([SimulationRunItem])
    case simulationRunItemsPaginatedResponse(SimulationRunItemsPaginatedResponse)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([SimulationRunItem].self) {
            self = .simulationRunItemArray(value)
        } else if let value = try? container.decode(SimulationRunItemsPaginatedResponse.self) {
            self = .simulationRunItemsPaginatedResponse(value)
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
        case .simulationRunItemArray(let value):
            try container.encode(value)
        case .simulationRunItemsPaginatedResponse(let value):
            try container.encode(value)
        }
    }
}