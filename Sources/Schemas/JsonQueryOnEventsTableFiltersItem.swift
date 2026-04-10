import Foundation

public enum JsonQueryOnEventsTableFiltersItem: Codable, Hashable, Sendable {
    case eventsTableBooleanCondition(EventsTableBooleanCondition)
    case eventsTableNumberCondition(EventsTableNumberCondition)
    case eventsTableStringCondition(EventsTableStringCondition)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(EventsTableBooleanCondition.self) {
            self = .eventsTableBooleanCondition(value)
        } else if let value = try? container.decode(EventsTableNumberCondition.self) {
            self = .eventsTableNumberCondition(value)
        } else if let value = try? container.decode(EventsTableStringCondition.self) {
            self = .eventsTableStringCondition(value)
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
        case .eventsTableBooleanCondition(let value):
            try container.encode(value)
        case .eventsTableNumberCondition(let value):
            try container.encode(value)
        case .eventsTableStringCondition(let value):
            try container.encode(value)
        }
    }
}