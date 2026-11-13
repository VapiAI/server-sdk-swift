import Foundation

public enum CreateStructuredOutputDtoConditionsItem: Codable, Hashable, Sendable {
    case endedReason(EndedReasonCondition)
    case minCallDuration(MinCallDurationCondition)
    case minMessages(MinMessagesCondition)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "endedReason":
            self = .endedReason(try EndedReasonCondition(from: decoder))
        case "minCallDuration":
            self = .minCallDuration(try MinCallDurationCondition(from: decoder))
        case "minMessages":
            self = .minMessages(try MinMessagesCondition(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .endedReason(let data):
            try container.encode("endedReason", forKey: .type)
            try data.encode(to: encoder)
        case .minCallDuration(let data):
            try container.encode("minCallDuration", forKey: .type)
            try data.encode(to: encoder)
        case .minMessages(let data):
            try container.encode("minMessages", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}