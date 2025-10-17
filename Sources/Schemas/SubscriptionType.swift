import Foundation

/// This is the type / tier of the subscription.
public enum SubscriptionType: String, Codable, Hashable, CaseIterable, Sendable {
    case payAsYouGo = "pay-as-you-go"
    case enterprise
    case agency
    case startup
    case growth
    case scale
}