import Foundation

public enum CartesiaSpeedControl: Codable, Hashable, Sendable {
    case cartesiaExperimentalControlsSpeed(CartesiaExperimentalControlsSpeed)
    case double(Double)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CartesiaExperimentalControlsSpeed.self) {
            self = .cartesiaExperimentalControlsSpeed(value)
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
        case .cartesiaExperimentalControlsSpeed(let value):
            try container.encode(value)
        case .double(let value):
            try container.encode(value)
        }
    }
}