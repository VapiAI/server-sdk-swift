import Foundation

/// Supplied PATCH actions replace the complete variant.
public enum GuardrailRuleSnapshotAction: Codable, Hashable, Sendable {
    case guardrailEscalateAction(GuardrailEscalateAction)
    case guardrailRuleSnapshotActionZero(GuardrailRuleSnapshotActionZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(GuardrailEscalateAction.self) {
            self = .guardrailEscalateAction(value)
        } else if let value = try? container.decode(GuardrailRuleSnapshotActionZero.self) {
            self = .guardrailRuleSnapshotActionZero(value)
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
        case .guardrailEscalateAction(let value):
            try container.encode(value)
        case .guardrailRuleSnapshotActionZero(let value):
            try container.encode(value)
        }
    }
}