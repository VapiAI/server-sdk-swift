import Foundation

public struct Subscription: Codable, Hashable, Sendable {
    /// This is the unique identifier for the subscription.
    public let id: String
    /// This is the timestamp when the subscription was created.
    public let createdAt: Date
    /// This is the timestamp when the subscription was last updated.
    public let updatedAt: Date
    /// This is the type / tier of the subscription.
    public let type: SubscriptionType
    /// This is the status of the subscription. Past due subscriptions are subscriptions
    /// with past due payments.
    public let status: SubscriptionStatus
    /// This is the number of credits the subscription currently has.
    /// 
    /// Note: This is a string to avoid floating point precision issues.
    public let credits: String
    /// This is the total number of active calls (concurrency) across all orgs under this subscription.
    public let concurrencyCounter: Double
    /// This is the default concurrency limit for the subscription.
    public let concurrencyLimitIncluded: Double
    /// This is the number of free phone numbers the subscription has
    public let phoneNumbersCounter: Double?
    /// This is the maximum number of free phone numbers the subscription can have
    public let phoneNumbersIncluded: Double?
    /// This is the purchased add-on concurrency limit for the subscription.
    public let concurrencyLimitPurchased: Double
    /// This is the ID of the monthly job that charges for subscription add ons and phone numbers.
    public let monthlyChargeScheduleId: Double?
    /// This is the ID of the monthly job that checks whether the credit balance of the subscription
    /// is sufficient for the monthly charge.
    public let monthlyCreditCheckScheduleId: Double?
    /// This is the Stripe customer ID.
    public let stripeCustomerId: String?
    /// This is the Stripe payment ID.
    public let stripePaymentMethodId: String?
    /// If this flag is true, then the user has purchased slack support.
    public let slackSupportEnabled: Bool?
    /// If this subscription has a slack support subscription, the slack channel's ID will be stored here.
    public let slackChannelId: String?
    /// This is the HIPAA enabled flag for the subscription. It determines whether orgs under this
    /// subscription have the option to enable HIPAA compliance.
    public let hipaaEnabled: Bool?
    /// This is the ID for the Common Paper agreement outlining the HIPAA contract.
    public let hipaaCommonPaperAgreementId: String?
    /// This is the Stripe fingerprint of the payment method (card). It allows us
    /// to detect users who try to abuse our system through multiple sign-ups.
    public let stripePaymentMethodFingerprint: String?
    /// This is the customer's email on Stripe.
    public let stripeCustomerEmail: String?
    /// This is the email of the referrer for the subscription.
    public let referredByEmail: String?
    /// This is the auto reload plan configured for the subscription.
    public let autoReloadPlan: AutoReloadPlan?
    /// The number of minutes included in the subscription.
    public let minutesIncluded: Double?
    /// The number of minutes used in the subscription.
    public let minutesUsed: Double?
    /// This is the timestamp at which the number of monthly free minutes is scheduled to reset at.
    public let minutesUsedNextResetAt: Date?
    /// The per minute charge on minutes that exceed the included minutes. Enterprise only.
    public let minutesOverageCost: Double?
    /// The list of providers included in the subscription. Enterprise only.
    public let providersIncluded: [String]?
    /// The maximum number of outbound calls this subscription may make in a day. Resets every night.
    public let outboundCallsDailyLimit: Double?
    /// The current number of outbound calls the subscription has made in the current day.
    public let outboundCallsCounter: Double?
    /// This is the timestamp at which the outbound calls counter is scheduled to reset at.
    public let outboundCallsCounterNextResetAt: Date?
    /// This is the IDs of the coupons applicable to this subscription.
    public let couponIds: [String]?
    /// This is the number of credits left obtained from a coupon.
    public let couponUsageLeft: String?
    /// This is the invoice plan for the subscription.
    public let invoicePlan: InvoicePlan?
    /// This is the PCI enabled flag for the subscription. It determines whether orgs under this
    /// subscription have the option to enable PCI compliance.
    public let pciEnabled: Bool?
    /// This is the ID for the Common Paper agreement outlining the PCI contract.
    public let pciCommonPaperAgreementId: String?
    /// This is the call retention days for the subscription.
    public let callRetentionDays: Double?
    /// This is the chat retention days for the subscription.
    public let chatRetentionDays: Double?
    /// This is the minutes_included reset frequency for the subscription.
    public let minutesIncludedResetFrequency: SubscriptionMinutesIncludedResetFrequency?
    /// This is the Role Based Access Control (RBAC) enabled flag for the subscription.
    public let rbacEnabled: Bool?
    /// This is the platform fee for the subscription.
    public let platformFee: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        createdAt: Date,
        updatedAt: Date,
        type: SubscriptionType,
        status: SubscriptionStatus,
        credits: String,
        concurrencyCounter: Double,
        concurrencyLimitIncluded: Double,
        phoneNumbersCounter: Double? = nil,
        phoneNumbersIncluded: Double? = nil,
        concurrencyLimitPurchased: Double,
        monthlyChargeScheduleId: Double? = nil,
        monthlyCreditCheckScheduleId: Double? = nil,
        stripeCustomerId: String? = nil,
        stripePaymentMethodId: String? = nil,
        slackSupportEnabled: Bool? = nil,
        slackChannelId: String? = nil,
        hipaaEnabled: Bool? = nil,
        hipaaCommonPaperAgreementId: String? = nil,
        stripePaymentMethodFingerprint: String? = nil,
        stripeCustomerEmail: String? = nil,
        referredByEmail: String? = nil,
        autoReloadPlan: AutoReloadPlan? = nil,
        minutesIncluded: Double? = nil,
        minutesUsed: Double? = nil,
        minutesUsedNextResetAt: Date? = nil,
        minutesOverageCost: Double? = nil,
        providersIncluded: [String]? = nil,
        outboundCallsDailyLimit: Double? = nil,
        outboundCallsCounter: Double? = nil,
        outboundCallsCounterNextResetAt: Date? = nil,
        couponIds: [String]? = nil,
        couponUsageLeft: String? = nil,
        invoicePlan: InvoicePlan? = nil,
        pciEnabled: Bool? = nil,
        pciCommonPaperAgreementId: String? = nil,
        callRetentionDays: Double? = nil,
        chatRetentionDays: Double? = nil,
        minutesIncludedResetFrequency: SubscriptionMinutesIncludedResetFrequency? = nil,
        rbacEnabled: Bool? = nil,
        platformFee: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.type = type
        self.status = status
        self.credits = credits
        self.concurrencyCounter = concurrencyCounter
        self.concurrencyLimitIncluded = concurrencyLimitIncluded
        self.phoneNumbersCounter = phoneNumbersCounter
        self.phoneNumbersIncluded = phoneNumbersIncluded
        self.concurrencyLimitPurchased = concurrencyLimitPurchased
        self.monthlyChargeScheduleId = monthlyChargeScheduleId
        self.monthlyCreditCheckScheduleId = monthlyCreditCheckScheduleId
        self.stripeCustomerId = stripeCustomerId
        self.stripePaymentMethodId = stripePaymentMethodId
        self.slackSupportEnabled = slackSupportEnabled
        self.slackChannelId = slackChannelId
        self.hipaaEnabled = hipaaEnabled
        self.hipaaCommonPaperAgreementId = hipaaCommonPaperAgreementId
        self.stripePaymentMethodFingerprint = stripePaymentMethodFingerprint
        self.stripeCustomerEmail = stripeCustomerEmail
        self.referredByEmail = referredByEmail
        self.autoReloadPlan = autoReloadPlan
        self.minutesIncluded = minutesIncluded
        self.minutesUsed = minutesUsed
        self.minutesUsedNextResetAt = minutesUsedNextResetAt
        self.minutesOverageCost = minutesOverageCost
        self.providersIncluded = providersIncluded
        self.outboundCallsDailyLimit = outboundCallsDailyLimit
        self.outboundCallsCounter = outboundCallsCounter
        self.outboundCallsCounterNextResetAt = outboundCallsCounterNextResetAt
        self.couponIds = couponIds
        self.couponUsageLeft = couponUsageLeft
        self.invoicePlan = invoicePlan
        self.pciEnabled = pciEnabled
        self.pciCommonPaperAgreementId = pciCommonPaperAgreementId
        self.callRetentionDays = callRetentionDays
        self.chatRetentionDays = chatRetentionDays
        self.minutesIncludedResetFrequency = minutesIncludedResetFrequency
        self.rbacEnabled = rbacEnabled
        self.platformFee = platformFee
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.type = try container.decode(SubscriptionType.self, forKey: .type)
        self.status = try container.decode(SubscriptionStatus.self, forKey: .status)
        self.credits = try container.decode(String.self, forKey: .credits)
        self.concurrencyCounter = try container.decode(Double.self, forKey: .concurrencyCounter)
        self.concurrencyLimitIncluded = try container.decode(Double.self, forKey: .concurrencyLimitIncluded)
        self.phoneNumbersCounter = try container.decodeIfPresent(Double.self, forKey: .phoneNumbersCounter)
        self.phoneNumbersIncluded = try container.decodeIfPresent(Double.self, forKey: .phoneNumbersIncluded)
        self.concurrencyLimitPurchased = try container.decode(Double.self, forKey: .concurrencyLimitPurchased)
        self.monthlyChargeScheduleId = try container.decodeIfPresent(Double.self, forKey: .monthlyChargeScheduleId)
        self.monthlyCreditCheckScheduleId = try container.decodeIfPresent(Double.self, forKey: .monthlyCreditCheckScheduleId)
        self.stripeCustomerId = try container.decodeIfPresent(String.self, forKey: .stripeCustomerId)
        self.stripePaymentMethodId = try container.decodeIfPresent(String.self, forKey: .stripePaymentMethodId)
        self.slackSupportEnabled = try container.decodeIfPresent(Bool.self, forKey: .slackSupportEnabled)
        self.slackChannelId = try container.decodeIfPresent(String.self, forKey: .slackChannelId)
        self.hipaaEnabled = try container.decodeIfPresent(Bool.self, forKey: .hipaaEnabled)
        self.hipaaCommonPaperAgreementId = try container.decodeIfPresent(String.self, forKey: .hipaaCommonPaperAgreementId)
        self.stripePaymentMethodFingerprint = try container.decodeIfPresent(String.self, forKey: .stripePaymentMethodFingerprint)
        self.stripeCustomerEmail = try container.decodeIfPresent(String.self, forKey: .stripeCustomerEmail)
        self.referredByEmail = try container.decodeIfPresent(String.self, forKey: .referredByEmail)
        self.autoReloadPlan = try container.decodeIfPresent(AutoReloadPlan.self, forKey: .autoReloadPlan)
        self.minutesIncluded = try container.decodeIfPresent(Double.self, forKey: .minutesIncluded)
        self.minutesUsed = try container.decodeIfPresent(Double.self, forKey: .minutesUsed)
        self.minutesUsedNextResetAt = try container.decodeIfPresent(Date.self, forKey: .minutesUsedNextResetAt)
        self.minutesOverageCost = try container.decodeIfPresent(Double.self, forKey: .minutesOverageCost)
        self.providersIncluded = try container.decodeIfPresent([String].self, forKey: .providersIncluded)
        self.outboundCallsDailyLimit = try container.decodeIfPresent(Double.self, forKey: .outboundCallsDailyLimit)
        self.outboundCallsCounter = try container.decodeIfPresent(Double.self, forKey: .outboundCallsCounter)
        self.outboundCallsCounterNextResetAt = try container.decodeIfPresent(Date.self, forKey: .outboundCallsCounterNextResetAt)
        self.couponIds = try container.decodeIfPresent([String].self, forKey: .couponIds)
        self.couponUsageLeft = try container.decodeIfPresent(String.self, forKey: .couponUsageLeft)
        self.invoicePlan = try container.decodeIfPresent(InvoicePlan.self, forKey: .invoicePlan)
        self.pciEnabled = try container.decodeIfPresent(Bool.self, forKey: .pciEnabled)
        self.pciCommonPaperAgreementId = try container.decodeIfPresent(String.self, forKey: .pciCommonPaperAgreementId)
        self.callRetentionDays = try container.decodeIfPresent(Double.self, forKey: .callRetentionDays)
        self.chatRetentionDays = try container.decodeIfPresent(Double.self, forKey: .chatRetentionDays)
        self.minutesIncludedResetFrequency = try container.decodeIfPresent(SubscriptionMinutesIncludedResetFrequency.self, forKey: .minutesIncludedResetFrequency)
        self.rbacEnabled = try container.decodeIfPresent(Bool.self, forKey: .rbacEnabled)
        self.platformFee = try container.decodeIfPresent(Double.self, forKey: .platformFee)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.credits, forKey: .credits)
        try container.encode(self.concurrencyCounter, forKey: .concurrencyCounter)
        try container.encode(self.concurrencyLimitIncluded, forKey: .concurrencyLimitIncluded)
        try container.encodeIfPresent(self.phoneNumbersCounter, forKey: .phoneNumbersCounter)
        try container.encodeIfPresent(self.phoneNumbersIncluded, forKey: .phoneNumbersIncluded)
        try container.encode(self.concurrencyLimitPurchased, forKey: .concurrencyLimitPurchased)
        try container.encodeIfPresent(self.monthlyChargeScheduleId, forKey: .monthlyChargeScheduleId)
        try container.encodeIfPresent(self.monthlyCreditCheckScheduleId, forKey: .monthlyCreditCheckScheduleId)
        try container.encodeIfPresent(self.stripeCustomerId, forKey: .stripeCustomerId)
        try container.encodeIfPresent(self.stripePaymentMethodId, forKey: .stripePaymentMethodId)
        try container.encodeIfPresent(self.slackSupportEnabled, forKey: .slackSupportEnabled)
        try container.encodeIfPresent(self.slackChannelId, forKey: .slackChannelId)
        try container.encodeIfPresent(self.hipaaEnabled, forKey: .hipaaEnabled)
        try container.encodeIfPresent(self.hipaaCommonPaperAgreementId, forKey: .hipaaCommonPaperAgreementId)
        try container.encodeIfPresent(self.stripePaymentMethodFingerprint, forKey: .stripePaymentMethodFingerprint)
        try container.encodeIfPresent(self.stripeCustomerEmail, forKey: .stripeCustomerEmail)
        try container.encodeIfPresent(self.referredByEmail, forKey: .referredByEmail)
        try container.encodeIfPresent(self.autoReloadPlan, forKey: .autoReloadPlan)
        try container.encodeIfPresent(self.minutesIncluded, forKey: .minutesIncluded)
        try container.encodeIfPresent(self.minutesUsed, forKey: .minutesUsed)
        try container.encodeIfPresent(self.minutesUsedNextResetAt, forKey: .minutesUsedNextResetAt)
        try container.encodeIfPresent(self.minutesOverageCost, forKey: .minutesOverageCost)
        try container.encodeIfPresent(self.providersIncluded, forKey: .providersIncluded)
        try container.encodeIfPresent(self.outboundCallsDailyLimit, forKey: .outboundCallsDailyLimit)
        try container.encodeIfPresent(self.outboundCallsCounter, forKey: .outboundCallsCounter)
        try container.encodeIfPresent(self.outboundCallsCounterNextResetAt, forKey: .outboundCallsCounterNextResetAt)
        try container.encodeIfPresent(self.couponIds, forKey: .couponIds)
        try container.encodeIfPresent(self.couponUsageLeft, forKey: .couponUsageLeft)
        try container.encodeIfPresent(self.invoicePlan, forKey: .invoicePlan)
        try container.encodeIfPresent(self.pciEnabled, forKey: .pciEnabled)
        try container.encodeIfPresent(self.pciCommonPaperAgreementId, forKey: .pciCommonPaperAgreementId)
        try container.encodeIfPresent(self.callRetentionDays, forKey: .callRetentionDays)
        try container.encodeIfPresent(self.chatRetentionDays, forKey: .chatRetentionDays)
        try container.encodeIfPresent(self.minutesIncludedResetFrequency, forKey: .minutesIncludedResetFrequency)
        try container.encodeIfPresent(self.rbacEnabled, forKey: .rbacEnabled)
        try container.encodeIfPresent(self.platformFee, forKey: .platformFee)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case createdAt
        case updatedAt
        case type
        case status
        case credits
        case concurrencyCounter
        case concurrencyLimitIncluded
        case phoneNumbersCounter
        case phoneNumbersIncluded
        case concurrencyLimitPurchased
        case monthlyChargeScheduleId
        case monthlyCreditCheckScheduleId
        case stripeCustomerId
        case stripePaymentMethodId
        case slackSupportEnabled
        case slackChannelId
        case hipaaEnabled
        case hipaaCommonPaperAgreementId
        case stripePaymentMethodFingerprint
        case stripeCustomerEmail
        case referredByEmail
        case autoReloadPlan
        case minutesIncluded
        case minutesUsed
        case minutesUsedNextResetAt
        case minutesOverageCost
        case providersIncluded
        case outboundCallsDailyLimit
        case outboundCallsCounter
        case outboundCallsCounterNextResetAt
        case couponIds
        case couponUsageLeft
        case invoicePlan
        case pciEnabled
        case pciCommonPaperAgreementId
        case callRetentionDays
        case chatRetentionDays
        case minutesIncludedResetFrequency
        case rbacEnabled
        case platformFee
    }
}