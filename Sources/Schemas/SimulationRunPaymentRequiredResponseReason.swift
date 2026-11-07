import Foundation

public enum SimulationRunPaymentRequiredResponseReason: String, Codable, Hashable, CaseIterable, Sendable {
    case walletMissing = "wallet_missing"
    case subscriptionFrozen = "subscription_frozen"
    case paymentMethodMissing = "payment_method_missing"
    case insufficientCredits = "insufficient_credits"
    case billingLimit = "billing_limit"
    case initialPaymentMissing = "initial_payment_missing"
}