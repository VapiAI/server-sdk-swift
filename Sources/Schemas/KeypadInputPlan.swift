import Foundation

/// Controls collection of dual-tone multi-frequency (DTMF) keypad input, including enablement, processing timeout, and delimiters.
public struct KeypadInputPlan: Codable, Hashable, Sendable {
    /// This is the call variable each completed keypad entry is stored in, as a string with leading zeros kept. A later entry replaces the earlier one.
    /// 
    /// Reference it as `{{variableName}}` in a transfer destination, for example in `sipHeaders`, so the model never has to repeat the digits. A keypad value the caller entered wins over a same-named handoff or transfer tool argument. Other writes to a variable with this name, such as variable extraction, still replace it. The value also appears in the call's `artifact.variableValues`.
    /// 
    /// In a squad, the active assistant's `variableName` is used when the entry completes. A variable already stored under a previous assistant's name keeps its value.
    /// 
    /// Not supported on full-duplex (GPT-Live) assistants: the call starts with a warning in the call logs and no variable is stored.
    /// 
    /// Rules:
    /// - Must start with a letter (a-z, A-Z).
    /// - Subsequent characters can be letters, numbers, or underscores.
    /// - Minimum length of 1 and maximum length of 40.
    public let variableName: String?
    /// This keeps track of whether the user has enabled keypad input.
    /// By default, it is off.
    /// 
    /// @default false
    public let enabled: Bool?
    /// This is the time in seconds to wait before processing the input.
    /// If the input is not received within this time, the input will be ignored.
    /// If set to "off", the input will be processed when the user enters a delimiter or immediately if no delimiter is used.
    /// 
    /// @default 2
    public let timeoutSeconds: Double?
    /// This is the delimiter(s) that will be used to process the input.
    /// Can be '#', '*', or an empty array.
    public let delimiters: KeypadInputPlanDelimiters?
    /// This determines whether a completed keypad entry triggers an assistant response.
    /// 
    /// Usage:
    /// - Use `true` to have the assistant respond to the entry.
    /// - Use `false` to add the entry to the conversation history silently. The model reads it on its next turn, for example to pass an ID to a tool. OpenAI Realtime and Gemini speech-to-speech models never receive keypad entries.
    /// 
    /// In a squad, this follows the active assistant when the entry completes. A half-typed entry carries over and completes under the new assistant's setting. `enabled`, `timeoutSeconds` and `delimiters` come from the first assistant for the whole call.
    /// 
    /// @default true
    public let triggerResponseEnabled: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        variableName: String? = nil,
        enabled: Bool? = nil,
        timeoutSeconds: Double? = nil,
        delimiters: KeypadInputPlanDelimiters? = nil,
        triggerResponseEnabled: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.variableName = variableName
        self.enabled = enabled
        self.timeoutSeconds = timeoutSeconds
        self.delimiters = delimiters
        self.triggerResponseEnabled = triggerResponseEnabled
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.variableName = try container.decodeIfPresent(String.self, forKey: .variableName)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.delimiters = try container.decodeIfPresent(KeypadInputPlanDelimiters.self, forKey: .delimiters)
        self.triggerResponseEnabled = try container.decodeIfPresent(Bool.self, forKey: .triggerResponseEnabled)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.variableName, forKey: .variableName)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encodeIfPresent(self.delimiters, forKey: .delimiters)
        try container.encodeIfPresent(self.triggerResponseEnabled, forKey: .triggerResponseEnabled)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case variableName
        case enabled
        case timeoutSeconds
        case delimiters
        case triggerResponseEnabled
    }
}