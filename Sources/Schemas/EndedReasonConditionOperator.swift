import Foundation

/// This is the membership operator applied against `values`.
/// 
/// - 'oneOf': the structured output runs only if the call's ended reason is in `values`.
/// - 'notOneOf': the structured output runs only if the call's ended reason is NOT in `values`.
public enum EndedReasonConditionOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case oneOf
    case notOneOf
}