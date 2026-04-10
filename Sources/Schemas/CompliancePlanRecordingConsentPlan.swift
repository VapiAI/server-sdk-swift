import Foundation

public enum CompliancePlanRecordingConsentPlan: Codable, Hashable, Sendable {
    case stayOnLine(RecordingConsentPlanStayOnLine)
    case verbal(RecordingConsentPlanVerbal)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .type)
        switch discriminant {
        case "stay-on-line":
            self = .stayOnLine(try RecordingConsentPlanStayOnLine(from: decoder))
        case "verbal":
            self = .verbal(try RecordingConsentPlanVerbal(from: decoder))
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
        case .stayOnLine(let data):
            try container.encode("stay-on-line", forKey: .type)
            try data.encode(to: encoder)
        case .verbal(let data):
            try container.encode("verbal", forKey: .type)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
    }
}