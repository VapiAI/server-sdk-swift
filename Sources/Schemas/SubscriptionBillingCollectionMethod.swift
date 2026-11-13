import Foundation

/// This is how payment is collected for the subscription: charged to the card
/// on file, or invoiced.
public enum SubscriptionBillingCollectionMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case chargeAutomatically = "charge_automatically"
    case sendInvoice = "send_invoice"
}