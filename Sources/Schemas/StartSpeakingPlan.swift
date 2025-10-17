import Foundation

public struct StartSpeakingPlan: Codable, Hashable, Sendable {
    /// This is how long assistant waits before speaking. Defaults to 0.4.
    /// 
    /// This is the minimum it will wait but if there is latency is the pipeline, this minimum will be exceeded. This is intended as a stopgap in case the pipeline is moving too fast.
    /// 
    /// Example:
    /// - If model generates tokens and voice generates bytes within 100ms, the pipeline still waits 300ms before outputting speech.
    /// 
    /// Usage:
    /// - If the customer is taking long pauses, set this to a higher value.
    /// - If the assistant is accidentally jumping in too much, set this to a higher value.
    /// 
    /// @default 0.4
    public let waitSeconds: Double?
    public let smartEndpointingEnabled: StartSpeakingPlanSmartEndpointingEnabled?
    /// This is the plan for smart endpointing. Pick between Vapi smart endpointing, LiveKit, or custom endpointing model (or nothing). We strongly recommend using livekit endpointing when working in English. LiveKit endpointing is not supported in other languages, yet.
    /// 
    /// If this is set, it will override and take precedence over `transcriptionEndpointingPlan`.
    /// This plan will still be overridden by any matching `customEndpointingRules`.
    /// 
    /// If this is not set, the system will automatically use the transcriber's built-in endpointing capabilities if available.
    public let smartEndpointingPlan: StartSpeakingPlanSmartEndpointingPlan?
    /// These are the custom endpointing rules to set an endpointing timeout based on a regex on the customer's speech or the assistant's last message.
    /// 
    /// Usage:
    /// - If you have yes/no questions like "are you interested in a loan?", you can set a shorter timeout.
    /// - If you have questions where the customer may pause to look up information like "what's my account number?", you can set a longer timeout.
    /// - If you want to wait longer while customer is enumerating a list of numbers, you can set a longer timeout.
    /// 
    /// These rules have the highest precedence and will override both `smartEndpointingPlan` and `transcriptionEndpointingPlan` when a rule is matched.
    /// 
    /// The rules are evaluated in order and the first one that matches will be used.
    /// 
    /// Order of precedence for endpointing:
    /// 1. customEndpointingRules (if any match)
    /// 2. smartEndpointingPlan (if set)
    /// 3. transcriptionEndpointingPlan
    /// 
    /// @default []
    public let customEndpointingRules: [StartSpeakingPlanCustomEndpointingRulesItem]?
    /// This determines how a customer speech is considered done (endpointing) using the transcription of customer's speech.
    /// 
    /// Once an endpoint is triggered, the request is sent to `assistant.model`.
    /// 
    /// Note: This plan is only used if `smartEndpointingPlan` is not set and transcriber does not have built-in endpointing capabilities. If both are provided, `smartEndpointingPlan` takes precedence.
    /// This plan will also be overridden by any matching `customEndpointingRules`.
    public let transcriptionEndpointingPlan: TranscriptionEndpointingPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        waitSeconds: Double? = nil,
        smartEndpointingEnabled: StartSpeakingPlanSmartEndpointingEnabled? = nil,
        smartEndpointingPlan: StartSpeakingPlanSmartEndpointingPlan? = nil,
        customEndpointingRules: [StartSpeakingPlanCustomEndpointingRulesItem]? = nil,
        transcriptionEndpointingPlan: TranscriptionEndpointingPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.waitSeconds = waitSeconds
        self.smartEndpointingEnabled = smartEndpointingEnabled
        self.smartEndpointingPlan = smartEndpointingPlan
        self.customEndpointingRules = customEndpointingRules
        self.transcriptionEndpointingPlan = transcriptionEndpointingPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.waitSeconds = try container.decodeIfPresent(Double.self, forKey: .waitSeconds)
        self.smartEndpointingEnabled = try container.decodeIfPresent(StartSpeakingPlanSmartEndpointingEnabled.self, forKey: .smartEndpointingEnabled)
        self.smartEndpointingPlan = try container.decodeIfPresent(StartSpeakingPlanSmartEndpointingPlan.self, forKey: .smartEndpointingPlan)
        self.customEndpointingRules = try container.decodeIfPresent([StartSpeakingPlanCustomEndpointingRulesItem].self, forKey: .customEndpointingRules)
        self.transcriptionEndpointingPlan = try container.decodeIfPresent(TranscriptionEndpointingPlan.self, forKey: .transcriptionEndpointingPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.waitSeconds, forKey: .waitSeconds)
        try container.encodeIfPresent(self.smartEndpointingEnabled, forKey: .smartEndpointingEnabled)
        try container.encodeIfPresent(self.smartEndpointingPlan, forKey: .smartEndpointingPlan)
        try container.encodeIfPresent(self.customEndpointingRules, forKey: .customEndpointingRules)
        try container.encodeIfPresent(self.transcriptionEndpointingPlan, forKey: .transcriptionEndpointingPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case waitSeconds
        case smartEndpointingEnabled
        case smartEndpointingPlan
        case customEndpointingRules
        case transcriptionEndpointingPlan
    }
}