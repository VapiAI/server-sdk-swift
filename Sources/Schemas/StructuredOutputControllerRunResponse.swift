import Foundation

public enum StructuredOutputControllerRunResponse: Codable, Hashable, Sendable {
    case structuredOutputControllerRunResponseZero(StructuredOutputControllerRunResponseZero)
    case structuredOutputRerunResponse(StructuredOutputRerunResponse)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(StructuredOutputControllerRunResponseZero.self) {
            self = .structuredOutputControllerRunResponseZero(value)
        } else if let value = try? container.decode(StructuredOutputRerunResponse.self) {
            self = .structuredOutputRerunResponse(value)
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
        case .structuredOutputControllerRunResponseZero(let value):
            try container.encode(value)
        case .structuredOutputRerunResponse(let value):
            try container.encode(value)
        }
    }
}