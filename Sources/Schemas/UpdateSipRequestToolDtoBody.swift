import Foundation

/// Body to include in the SIP request. Either a literal string body, or a JSON schema describing a structured body that the model should populate.
public enum UpdateSipRequestToolDtoBody: Codable, Hashable, Sendable {
    case jsonSchema(JsonSchema)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(JsonSchema.self) {
            self = .jsonSchema(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
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
        case .jsonSchema(let value):
            try container.encode(value)
        case .string(let value):
            try container.encode(value)
        }
    }
}