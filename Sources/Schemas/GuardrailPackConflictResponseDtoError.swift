import Foundation

/// Machine-readable cause; clients branch on this, never on `message`.
public enum GuardrailPackConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case packChanged = "pack_changed"
    case impactChanged = "impact_changed"
    case globalAssignment = "global_assignment"
}