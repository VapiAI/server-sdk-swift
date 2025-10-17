import Foundation

public enum StartSpeakingPlanSmartEndpointingEnabled: Codable, Hashable, Sendable {
    case bool(Bool)
    case json(JSONValue)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(JSONValue.self) {
            self = .json(value)
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
        case .json(let value):
            try container.encode(value)
        }
    }
}