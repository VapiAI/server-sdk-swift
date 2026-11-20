import Foundation

public enum ServiceUnavailableErrorBody: Codable, Hashable, Sendable {
    case serviceUnavailableErrorBodyError(ServiceUnavailableErrorBodyError)
    case simulationOnboardingErrorDto(SimulationOnboardingErrorDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ServiceUnavailableErrorBodyError.self) {
            self = .serviceUnavailableErrorBodyError(value)
        } else if let value = try? container.decode(SimulationOnboardingErrorDto.self) {
            self = .simulationOnboardingErrorDto(value)
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
        case .serviceUnavailableErrorBodyError(let value):
            try container.encode(value)
        case .simulationOnboardingErrorDto(let value):
            try container.encode(value)
        }
    }
}