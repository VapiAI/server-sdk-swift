import Foundation

public enum CallsCreateResponse: Codable, Hashable, Sendable {
    case call(Call)
    case callBatchResponse(CallBatchResponse)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Call.self) {
            self = .call(value)
        } else if let value = try? container.decode(CallBatchResponse.self) {
            self = .callBatchResponse(value)
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
        case .call(let value):
            try container.encode(value)
        case .callBatchResponse(let value):
            try container.encode(value)
        }
    }
}