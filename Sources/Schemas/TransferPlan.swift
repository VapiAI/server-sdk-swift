import Foundation

public struct TransferPlan: Codable, Hashable, Sendable {
    /// This configures how transfer is executed and the experience of the destination party receiving the call.
    /// 
    /// Usage:
    /// - `blind-transfer`: The assistant forwards the call to the destination without any message or summary.
    /// - `blind-transfer-add-summary-to-sip-header`: The assistant forwards the call to the destination and adds a SIP header X-Transfer-Summary to the call to include the summary.
    /// - `warm-transfer-say-message`: The assistant dials the destination, delivers the `message` to the destination party, connects the customer, and leaves the call.
    /// - `warm-transfer-say-summary`: The assistant dials the destination, provides a summary of the call to the destination party, connects the customer, and leaves the call.
    /// - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`: The assistant dials the destination, waits for the operator to speak, delivers the `message` to the destination party, and then connects the customer.
    /// - `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary`: The assistant dials the destination, waits for the operator to speak, provides a summary of the call to the destination party, and then connects the customer.
    /// - `warm-transfer-twiml`: The assistant dials the destination, executes the twiml instructions on the destination call leg, connects the customer, and leaves the call.
    /// - `warm-transfer-experimental`: The assistant puts the customer on hold, dials the destination, and if the destination answers (and is human), delivers a message or summary before connecting the customer. If the destination is unreachable or not human (e.g., with voicemail detection), the assistant delivers the `fallbackMessage` to the customer and optionally ends the call.
    /// 
    /// @default 'blind-transfer'
    public let mode: TransferPlanMode
    /// This is the message the assistant will deliver to the destination party before connecting the customer.
    /// 
    /// Usage:
    /// - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`, `warm-transfer-say-message`, `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`, or `warm-transfer-experimental`.
    public let message: TransferPlanMessage?
    /// This is the timeout in seconds for the warm-transfer-wait-for-operator-to-speak-first-and-then-say-message/summary
    /// 
    /// @default 60
    public let timeout: Double?
    /// This specifies the SIP verb to use while transferring the call.
    /// - 'refer': Uses SIP REFER to transfer the call (default)
    /// - 'bye': Ends current call with SIP BYE
    /// - 'dial': Uses SIP DIAL to transfer the call
    public let sipVerb: [String: JSONValue]?
    /// This is the URL to an audio file played while the customer is on hold during transfer.
    /// 
    /// Usage:
    /// - Used only when `mode` is `warm-transfer-experimental`.
    /// - Used when transferring calls to play hold audio for the customer.
    /// - Must be a publicly accessible URL to an audio file.
    /// - Supported formats: MP3 and WAV.
    /// - If not provided, the default hold audio will be used.
    public let holdAudioUrl: String?
    /// This is the URL to an audio file played after the warm transfer message or summary is delivered to the destination party.
    /// It can be used to play a custom sound like 'beep' to notify that the transfer is complete.
    /// 
    /// Usage:
    /// - Used only when `mode` is `warm-transfer-experimental`.
    /// - Used when transferring calls to play hold audio for the destination party.
    /// - Must be a publicly accessible URL to an audio file.
    /// - Supported formats: MP3 and WAV.
    public let transferCompleteAudioUrl: String?
    /// This is the TwiML instructions to execute on the destination call leg before connecting the customer.
    /// 
    /// Usage:
    /// - Used only when `mode` is `warm-transfer-twiml`.
    /// - Supports only `Play`, `Say`, `Gather`, `Hangup` and `Pause` verbs.
    /// - Maximum length is 4096 characters.
    /// 
    /// Example:
    /// ```
    /// <Say voice="alice" language="en-US">Hello, transferring a customer to you.</Say>
    /// <Pause length="2"/>
    /// <Say>They called about billing questions.</Say>
    /// ```
    public let twiml: String?
    /// This is the plan for generating a summary of the call to present to the destination party.
    /// 
    /// Usage:
    /// - Used only when `mode` is `blind-transfer-add-summary-to-sip-header` or `warm-transfer-say-summary` or `warm-transfer-wait-for-operator-to-speak-first-and-then-say-summary` or `warm-transfer-experimental`.
    public let summaryPlan: SummaryPlan?
    /// This flag includes the sipHeaders from above in the refer to sip uri as url encoded query params.
    /// 
    /// @default false
    public let sipHeadersInReferToEnabled: Bool?
    /// This configures the fallback plan when the transfer fails (destination unreachable, busy, or not human).
    /// 
    /// Usage:
    /// - Used only when `mode` is `warm-transfer-experimental`.
    /// - If not provided when using `warm-transfer-experimental`, a default message will be used.
    public let fallbackPlan: TransferFallbackPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mode: TransferPlanMode,
        message: TransferPlanMessage? = nil,
        timeout: Double? = nil,
        sipVerb: [String: JSONValue]? = nil,
        holdAudioUrl: String? = nil,
        transferCompleteAudioUrl: String? = nil,
        twiml: String? = nil,
        summaryPlan: SummaryPlan? = nil,
        sipHeadersInReferToEnabled: Bool? = nil,
        fallbackPlan: TransferFallbackPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mode = mode
        self.message = message
        self.timeout = timeout
        self.sipVerb = sipVerb
        self.holdAudioUrl = holdAudioUrl
        self.transferCompleteAudioUrl = transferCompleteAudioUrl
        self.twiml = twiml
        self.summaryPlan = summaryPlan
        self.sipHeadersInReferToEnabled = sipHeadersInReferToEnabled
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mode = try container.decode(TransferPlanMode.self, forKey: .mode)
        self.message = try container.decodeIfPresent(TransferPlanMessage.self, forKey: .message)
        self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
        self.sipVerb = try container.decodeIfPresent([String: JSONValue].self, forKey: .sipVerb)
        self.holdAudioUrl = try container.decodeIfPresent(String.self, forKey: .holdAudioUrl)
        self.transferCompleteAudioUrl = try container.decodeIfPresent(String.self, forKey: .transferCompleteAudioUrl)
        self.twiml = try container.decodeIfPresent(String.self, forKey: .twiml)
        self.summaryPlan = try container.decodeIfPresent(SummaryPlan.self, forKey: .summaryPlan)
        self.sipHeadersInReferToEnabled = try container.decodeIfPresent(Bool.self, forKey: .sipHeadersInReferToEnabled)
        self.fallbackPlan = try container.decodeIfPresent(TransferFallbackPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(self.timeout, forKey: .timeout)
        try container.encodeIfPresent(self.sipVerb, forKey: .sipVerb)
        try container.encodeIfPresent(self.holdAudioUrl, forKey: .holdAudioUrl)
        try container.encodeIfPresent(self.transferCompleteAudioUrl, forKey: .transferCompleteAudioUrl)
        try container.encodeIfPresent(self.twiml, forKey: .twiml)
        try container.encodeIfPresent(self.summaryPlan, forKey: .summaryPlan)
        try container.encodeIfPresent(self.sipHeadersInReferToEnabled, forKey: .sipHeadersInReferToEnabled)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mode
        case message
        case timeout
        case sipVerb
        case holdAudioUrl
        case transferCompleteAudioUrl
        case twiml
        case summaryPlan
        case sipHeadersInReferToEnabled
        case fallbackPlan
    }
}