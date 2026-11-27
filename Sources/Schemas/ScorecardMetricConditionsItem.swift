import Foundation

public enum ScorecardMetricConditionsItem: Codable, Hashable, Sendable {
    case booleanComparatorScorecardMetricCondition(BooleanComparatorScorecardMetricCondition)
    case numberComparatorScorecardMetricCondition(NumberComparatorScorecardMetricCondition)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BooleanComparatorScorecardMetricCondition.self) {
            self = .booleanComparatorScorecardMetricCondition(value)
        } else if let value = try? container.decode(NumberComparatorScorecardMetricCondition.self) {
            self = .numberComparatorScorecardMetricCondition(value)
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
        case .booleanComparatorScorecardMetricCondition(let value):
            try container.encode(value)
        case .numberComparatorScorecardMetricCondition(let value):
            try container.encode(value)
        }
    }
}