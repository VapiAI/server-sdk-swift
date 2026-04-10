import Foundation

public enum CartesiaSpeedControl: Codable, Hashable, Sendable {
    case cartesiaExperimentalControlsSpeedZero(CartesiaExperimentalControlsSpeedZero)
    case double(Double)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CartesiaExperimentalControlsSpeedZero.self) {
            self = .cartesiaExperimentalControlsSpeedZero(value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(value)
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
        case .cartesiaExperimentalControlsSpeedZero(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        }
    }
}