import Foundation

public enum SimulationSuiteControllerFindAllResponse: Codable, Hashable, Sendable {
    case simulationSuiteArray([SimulationSuite])
    case simulationSuitesPaginatedResponse(SimulationSuitesPaginatedResponse)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([SimulationSuite].self) {
            self = .simulationSuiteArray(value)
        } else if let value = try? container.decode(SimulationSuitesPaginatedResponse.self) {
            self = .simulationSuitesPaginatedResponse(value)
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
        case .simulationSuiteArray(let value):
            try container.encode(value)
        case .simulationSuitesPaginatedResponse(let value):
            try container.encode(value)
        }
    }
}