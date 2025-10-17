import Foundation

public struct Org: Codable, Hashable, Sendable {
    /// When this is enabled, no logs, recordings, or transcriptions will be stored. At the end of the call, you will still receive an end-of-call-report message to store on your server. Defaults to false.
    /// When HIPAA is enabled, only OpenAI/Custom LLM or Azure Providers will be available for LLM and Voice respectively.
    /// This is due to the compliance requirements of HIPAA. Other providers may not meet these requirements.
    public let hipaaEnabled: Bool?
    public let subscription: Subscription?
    /// This is the ID of the subscription the org belongs to.
    public let subscriptionId: String?
    /// This is the unique identifier for the org.
    public let id: String
    /// This is the ISO 8601 date-time string of when the org was created.
    public let createdAt: Date
    /// This is the ISO 8601 date-time string of when the org was last updated.
    public let updatedAt: Date
    /// This is the subscription for the org.
    public let stripeSubscriptionId: String?
    /// This is the subscription's subscription item.
    public let stripeSubscriptionItemId: String?
    /// This is the subscription's current period start.
    public let stripeSubscriptionCurrentPeriodStart: Date?
    /// This is the subscription's status.
    public let stripeSubscriptionStatus: String?
    /// This is the secret key used for signing JWT tokens for the org.
    public let jwtSecret: String?
    /// This is the total number of call minutes used by this org across all time.
    public let minutesUsed: Double?
    /// This is the name of the org. This is just for your own reference.
    public let name: String?
    /// This is the channel of the org. There is the cluster the API traffic for the org will be directed.
    public let channel: OrgChannel?
    /// This is the monthly billing limit for the org. To go beyond $1000/mo, please contact us at support@vapi.ai.
    public let billingLimit: Double?
    /// This is where Vapi will send webhooks. You can find all webhooks available along with their shape in ServerMessage schema.
    /// 
    /// The order of precedence is:
    /// 
    /// 1. assistant.server
    /// 2. phoneNumber.server
    /// 3. org.server
    public let server: Server?
    /// This is the concurrency limit for the org. This is the maximum number of calls that can be active at any given time. To go beyond 10, please contact us at support@vapi.ai.
    public let concurrencyLimit: Double?
    /// Stores the information about the compliance plan enforced at the organization level. Currently pciEnabled is supported through this field.
    /// When this is enabled, any logs, recordings, or transcriptions will be shipped to the customer endpoints if provided else lost.
    /// At the end of the call, you will receive an end-of-call-report message to store on your server, if webhook is provided.
    /// Defaults to false.
    /// When PCI is enabled, only PCI-compliant Providers will be available for LLM, Voice and transcribers.
    /// This is due to the compliance requirements of PCI. Other providers may not meet these requirements.
    public let compliancePlan: CompliancePlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        hipaaEnabled: Bool? = nil,
        subscription: Subscription? = nil,
        subscriptionId: String? = nil,
        id: String,
        createdAt: Date,
        updatedAt: Date,
        stripeSubscriptionId: String? = nil,
        stripeSubscriptionItemId: String? = nil,
        stripeSubscriptionCurrentPeriodStart: Date? = nil,
        stripeSubscriptionStatus: String? = nil,
        jwtSecret: String? = nil,
        minutesUsed: Double? = nil,
        name: String? = nil,
        channel: OrgChannel? = nil,
        billingLimit: Double? = nil,
        server: Server? = nil,
        concurrencyLimit: Double? = nil,
        compliancePlan: CompliancePlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.hipaaEnabled = hipaaEnabled
        self.subscription = subscription
        self.subscriptionId = subscriptionId
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.stripeSubscriptionId = stripeSubscriptionId
        self.stripeSubscriptionItemId = stripeSubscriptionItemId
        self.stripeSubscriptionCurrentPeriodStart = stripeSubscriptionCurrentPeriodStart
        self.stripeSubscriptionStatus = stripeSubscriptionStatus
        self.jwtSecret = jwtSecret
        self.minutesUsed = minutesUsed
        self.name = name
        self.channel = channel
        self.billingLimit = billingLimit
        self.server = server
        self.concurrencyLimit = concurrencyLimit
        self.compliancePlan = compliancePlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hipaaEnabled = try container.decodeIfPresent(Bool.self, forKey: .hipaaEnabled)
        self.subscription = try container.decodeIfPresent(Subscription.self, forKey: .subscription)
        self.subscriptionId = try container.decodeIfPresent(String.self, forKey: .subscriptionId)
        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.stripeSubscriptionId = try container.decodeIfPresent(String.self, forKey: .stripeSubscriptionId)
        self.stripeSubscriptionItemId = try container.decodeIfPresent(String.self, forKey: .stripeSubscriptionItemId)
        self.stripeSubscriptionCurrentPeriodStart = try container.decodeIfPresent(Date.self, forKey: .stripeSubscriptionCurrentPeriodStart)
        self.stripeSubscriptionStatus = try container.decodeIfPresent(String.self, forKey: .stripeSubscriptionStatus)
        self.jwtSecret = try container.decodeIfPresent(String.self, forKey: .jwtSecret)
        self.minutesUsed = try container.decodeIfPresent(Double.self, forKey: .minutesUsed)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.channel = try container.decodeIfPresent(OrgChannel.self, forKey: .channel)
        self.billingLimit = try container.decodeIfPresent(Double.self, forKey: .billingLimit)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.concurrencyLimit = try container.decodeIfPresent(Double.self, forKey: .concurrencyLimit)
        self.compliancePlan = try container.decodeIfPresent(CompliancePlan.self, forKey: .compliancePlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.hipaaEnabled, forKey: .hipaaEnabled)
        try container.encodeIfPresent(self.subscription, forKey: .subscription)
        try container.encodeIfPresent(self.subscriptionId, forKey: .subscriptionId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encodeIfPresent(self.stripeSubscriptionId, forKey: .stripeSubscriptionId)
        try container.encodeIfPresent(self.stripeSubscriptionItemId, forKey: .stripeSubscriptionItemId)
        try container.encodeIfPresent(self.stripeSubscriptionCurrentPeriodStart, forKey: .stripeSubscriptionCurrentPeriodStart)
        try container.encodeIfPresent(self.stripeSubscriptionStatus, forKey: .stripeSubscriptionStatus)
        try container.encodeIfPresent(self.jwtSecret, forKey: .jwtSecret)
        try container.encodeIfPresent(self.minutesUsed, forKey: .minutesUsed)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.channel, forKey: .channel)
        try container.encodeIfPresent(self.billingLimit, forKey: .billingLimit)
        try container.encodeIfPresent(self.server, forKey: .server)
        try container.encodeIfPresent(self.concurrencyLimit, forKey: .concurrencyLimit)
        try container.encodeIfPresent(self.compliancePlan, forKey: .compliancePlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case hipaaEnabled
        case subscription
        case subscriptionId
        case id
        case createdAt
        case updatedAt
        case stripeSubscriptionId
        case stripeSubscriptionItemId
        case stripeSubscriptionCurrentPeriodStart
        case stripeSubscriptionStatus
        case jwtSecret
        case minutesUsed
        case name
        case channel
        case billingLimit
        case server
        case concurrencyLimit
        case compliancePlan
    }
}