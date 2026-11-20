import Foundation

/// Higher effort can increase response time. Omit to use low.
public enum OpenAiReasonerReasoningEffort: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case low
    case medium
    case high
    case xhigh
    case max
}