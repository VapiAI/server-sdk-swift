import Foundation

/// This is the plan for manipulating the message context before handing off the call to the squad.
public enum HandoffDestinationSquadContextEngineeringPlan: Codable, Hashable, Sendable {
    case all(ContextEngineeringPlanAll)
    case lastNMessages(ContextEngineeringPlanLastNMessages)
    case none(ContextEngineeringPlanNone)
    case userAndAssistantMessages(ContextEngineeringPlanUserAndAssistantMessages)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "all":
            self = .all(try ContextEngineeringPlanAll(from: decoder))
        case "lastNMessages":
            self = .lastNMessages(try ContextEngineeringPlanLastNMessages(from: decoder))
        case "none":
            self = .none(try ContextEngineeringPlanNone(from: decoder))
        case "userAndAssistantMessages":
            self = .userAndAssistantMessages(try ContextEngineeringPlanUserAndAssistantMessages(from: decoder))
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
        case .all(let data):
            try container.encode("all", forKey: .type)
            try data.encode(to: encoder)
        case .lastNMessages(let data):
            try container.encode("lastNMessages", forKey: .type)
            try data.encode(to: encoder)
        case .none(let data):
            try container.encode("none", forKey: .type)
            try data.encode(to: encoder)
        case .userAndAssistantMessages(let data):
            try container.encode("userAndAssistantMessages", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}