import Foundation

/// This is the status of the subscription. Past due subscriptions are subscriptions
/// with past due payments.
public enum SubscriptionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case frozen
}