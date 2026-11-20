import Foundation

/// Supplied PATCH actions replace the complete variant.
public enum CreateGuardrailRuleDtoAction: Codable, Hashable, Sendable {
    case createGuardrailRuleDtoActionZero(CreateGuardrailRuleDtoActionZero)
    case guardrailEscalateAction(GuardrailEscalateAction)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CreateGuardrailRuleDtoActionZero.self) {
            self = .createGuardrailRuleDtoActionZero(value)
        } else if let value = try? container.decode(GuardrailEscalateAction.self) {
            self = .guardrailEscalateAction(value)
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
        case .createGuardrailRuleDtoActionZero(let value):
            try container.encode(value)
        case .guardrailEscalateAction(let value):
            try container.encode(value)
        }
    }
}