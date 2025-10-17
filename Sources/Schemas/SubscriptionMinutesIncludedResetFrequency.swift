import Foundation

/// This is the minutes_included reset frequency for the subscription.
public enum SubscriptionMinutesIncludedResetFrequency: String, Codable, Hashable, CaseIterable, Sendable {
    case monthly
    case annually
}