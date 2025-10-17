import Foundation

public struct CompliancePlan: Codable, Hashable, Sendable {
    /// When this is enabled, no logs, recordings, or transcriptions will be stored.
    /// At the end of the call, you will still receive an end-of-call-report message to store on your server. Defaults to false.
    public let hipaaEnabled: Bool?
    /// When this is enabled, the user will be restricted to use PCI-compliant providers, and no logs or transcripts are stored.
    /// At the end of the call, you will receive an end-of-call-report message to store on your server. Defaults to false.
    public let pciEnabled: Bool?
    /// This is the security filter plan for the assistant. It allows filtering of transcripts for security threats before sending to LLM.
    public let securityFilterPlan: SecurityFilterPlan?
    public let recordingConsentPlan: CompliancePlanRecordingConsentPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        hipaaEnabled: Bool? = nil,
        pciEnabled: Bool? = nil,
        securityFilterPlan: SecurityFilterPlan? = nil,
        recordingConsentPlan: CompliancePlanRecordingConsentPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.hipaaEnabled = hipaaEnabled
        self.pciEnabled = pciEnabled
        self.securityFilterPlan = securityFilterPlan
        self.recordingConsentPlan = recordingConsentPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hipaaEnabled = try container.decodeIfPresent(Bool.self, forKey: .hipaaEnabled)
        self.pciEnabled = try container.decodeIfPresent(Bool.self, forKey: .pciEnabled)
        self.securityFilterPlan = try container.decodeIfPresent(SecurityFilterPlan.self, forKey: .securityFilterPlan)
        self.recordingConsentPlan = try container.decodeIfPresent(CompliancePlanRecordingConsentPlan.self, forKey: .recordingConsentPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.hipaaEnabled, forKey: .hipaaEnabled)
        try container.encodeIfPresent(self.pciEnabled, forKey: .pciEnabled)
        try container.encodeIfPresent(self.securityFilterPlan, forKey: .securityFilterPlan)
        try container.encodeIfPresent(self.recordingConsentPlan, forKey: .recordingConsentPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case hipaaEnabled
        case pciEnabled
        case securityFilterPlan
        case recordingConsentPlan
    }
}