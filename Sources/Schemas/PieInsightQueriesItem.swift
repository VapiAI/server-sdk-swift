import Foundation

public enum PieInsightQueriesItem: Codable, Hashable, Sendable {
    case jsonQueryOnCallTableWithNumberTypeColumn(JsonQueryOnCallTableWithNumberTypeColumn)
    case jsonQueryOnCallTableWithStringTypeColumn(JsonQueryOnCallTableWithStringTypeColumn)
    case jsonQueryOnCallTableWithStructuredOutputColumn(JsonQueryOnCallTableWithStructuredOutputColumn)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(JsonQueryOnCallTableWithNumberTypeColumn.self) {
            self = .jsonQueryOnCallTableWithNumberTypeColumn(value)
        } else if let value = try? container.decode(JsonQueryOnCallTableWithStringTypeColumn.self) {
            self = .jsonQueryOnCallTableWithStringTypeColumn(value)
        } else if let value = try? container.decode(JsonQueryOnCallTableWithStructuredOutputColumn.self) {
            self = .jsonQueryOnCallTableWithStructuredOutputColumn(value)
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
        case .jsonQueryOnCallTableWithNumberTypeColumn(let value):
            try container.encode(value)
        case .jsonQueryOnCallTableWithStringTypeColumn(let value):
            try container.encode(value)
        case .jsonQueryOnCallTableWithStructuredOutputColumn(let value):
            try container.encode(value)
        }
    }
}