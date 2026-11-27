import Foundation

public enum BoardItemsItem: Codable, Hashable, Sendable {
    case boardInsightItem(BoardInsightItem)
    case boardMetricWidgetItem(BoardMetricWidgetItem)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BoardInsightItem.self) {
            self = .boardInsightItem(value)
        } else if let value = try? container.decode(BoardMetricWidgetItem.self) {
            self = .boardMetricWidgetItem(value)
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
        case .boardInsightItem(let value):
            try container.encode(value)
        case .boardMetricWidgetItem(let value):
            try container.encode(value)
        }
    }
}