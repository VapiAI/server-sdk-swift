import Foundation

public enum StartSpeakingPlanSmartEndpointingEnabled: Codable, Hashable, Sendable {
    case bool(Bool)
    case startSpeakingPlanSmartEndpointingEnabledOne(StartSpeakingPlanSmartEndpointingEnabledOne)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(StartSpeakingPlanSmartEndpointingEnabledOne.self) {
            self = .startSpeakingPlanSmartEndpointingEnabledOne(value)
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
        case .bool(let value):
            try container.encode(value)
        case .startSpeakingPlanSmartEndpointingEnabledOne(let value):
            try container.encode(value)
        }
    }
}