import Foundation

public enum JsonQueryOnCallTableWithStructuredOutputColumnFiltersItem: Codable, Hashable, Sendable {
    case filterDateTypeColumnOnCallTable(FilterDateTypeColumnOnCallTable)
    case filterNumberArrayTypeColumnOnCallTable(FilterNumberArrayTypeColumnOnCallTable)
    case filterNumberTypeColumnOnCallTable(FilterNumberTypeColumnOnCallTable)
    case filterStringArrayTypeColumnOnCallTable(FilterStringArrayTypeColumnOnCallTable)
    case filterStringTypeColumnOnCallTable(FilterStringTypeColumnOnCallTable)
    case filterStructuredOutputColumnOnCallTable(FilterStructuredOutputColumnOnCallTable)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(FilterDateTypeColumnOnCallTable.self) {
            self = .filterDateTypeColumnOnCallTable(value)
        } else if let value = try? container.decode(FilterNumberArrayTypeColumnOnCallTable.self) {
            self = .filterNumberArrayTypeColumnOnCallTable(value)
        } else if let value = try? container.decode(FilterNumberTypeColumnOnCallTable.self) {
            self = .filterNumberTypeColumnOnCallTable(value)
        } else if let value = try? container.decode(FilterStringArrayTypeColumnOnCallTable.self) {
            self = .filterStringArrayTypeColumnOnCallTable(value)
        } else if let value = try? container.decode(FilterStringTypeColumnOnCallTable.self) {
            self = .filterStringTypeColumnOnCallTable(value)
        } else if let value = try? container.decode(FilterStructuredOutputColumnOnCallTable.self) {
            self = .filterStructuredOutputColumnOnCallTable(value)
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
        case .filterDateTypeColumnOnCallTable(let value):
            try container.encode(value)
        case .filterNumberArrayTypeColumnOnCallTable(let value):
            try container.encode(value)
        case .filterNumberTypeColumnOnCallTable(let value):
            try container.encode(value)
        case .filterStringArrayTypeColumnOnCallTable(let value):
            try container.encode(value)
        case .filterStringTypeColumnOnCallTable(let value):
            try container.encode(value)
        case .filterStructuredOutputColumnOnCallTable(let value):
            try container.encode(value)
        }
    }
}