import Foundation

/// Supplied PATCH actions replace the complete variant.
public enum SaveGuardrailRuleDtoAction: Codable, Hashable, Sendable {
    case guardrailEscalateAction(GuardrailEscalateAction)
    case saveGuardrailRuleDtoActionZero(SaveGuardrailRuleDtoActionZero)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(GuardrailEscalateAction.self) {
            self = .guardrailEscalateAction(value)
        } else if let value = try? container.decode(SaveGuardrailRuleDtoActionZero.self) {
            self = .saveGuardrailRuleDtoActionZero(value)
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
        case .saveGuardrailRuleDtoActionZero(let value):
            try container.encode(value)
        }
    }
}