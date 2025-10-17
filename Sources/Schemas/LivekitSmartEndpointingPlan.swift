import Foundation

public struct LivekitSmartEndpointingPlan: Codable, Hashable, Sendable {
    /// This is the provider for the smart endpointing plan.
    public let provider: LivekitSmartEndpointingPlanProvider
    /// This expression describes how long the bot will wait to start speaking based on the likelihood that the user has reached an endpoint.
    /// 
    /// This is a millisecond valued function. It maps probabilities (real numbers on [0,1]) to milliseconds that the bot should wait before speaking ([0, \infty]). Any negative values that are returned are set to zero (the bot can't start talking in the past).
    /// 
    /// A probability of zero represents very high confidence that the caller has stopped speaking, and would like the bot to speak to them. A probability of one represents very high confidence that the caller is still speaking.
    /// 
    /// Under the hood, this is parsed into a mathjs expression. Whatever you use to write your expression needs to be valid with respect to mathjs
    /// 
    /// @default "20 + 500 * sqrt(x) + 2500 * x^3"
    public let waitFunction: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: LivekitSmartEndpointingPlanProvider,
        waitFunction: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.waitFunction = waitFunction
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(LivekitSmartEndpointingPlanProvider.self, forKey: .provider)
        self.waitFunction = try container.decodeIfPresent(String.self, forKey: .waitFunction)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.waitFunction, forKey: .waitFunction)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case waitFunction
    }
}