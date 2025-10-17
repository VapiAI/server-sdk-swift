import Foundation

public struct SummaryPlan: Codable, Hashable, Sendable {
    /// These are the messages used to generate the summary.
    /// 
    /// @default: ```
    /// [
    ///   {
    ///     "role": "system",
    ///     "content": "You are an expert note-taker. You will be given a transcript of a call. Summarize the call in 2-3 sentences. DO NOT return anything except the summary."
    ///   },
    ///   {
    ///     "role": "user",
    ///     "content": "Here is the transcript:\n\n{{transcript}}\n\n. Here is the ended reason of the call:\n\n{{endedReason}}\n\n"
    ///   }
    /// ]```
    /// 
    /// You can customize by providing any messages you want.
    /// 
    /// Here are the template variables available:
    /// - {{transcript}}: The transcript of the call from `call.artifact.transcript` 
    /// - {{systemPrompt}}: The system prompt of the call from `assistant.model.messages[type=system].content` 
    /// - {{messages}}: The messages of the call from `assistant.model.messages` 
    /// - {{endedReason}}: The ended reason of the call from `call.endedReason`
    public let messages: [[String: JSONValue]]?
    /// This determines whether a summary is generated and stored in `call.analysis.summary`. Defaults to true.
    /// 
    /// Usage:
    /// - If you want to disable the summary, set this to false.
    /// 
    /// @default true
    public let enabled: Bool?
    /// This is how long the request is tried before giving up. When request times out, `call.analysis.summary` will be empty.
    /// 
    /// Usage:
    /// - To guarantee the summary is generated, set this value high. Note, this will delay the end of call report in cases where model is slow to respond.
    /// 
    /// @default 5 seconds
    public let timeoutSeconds: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        messages: [[String: JSONValue]]? = nil,
        enabled: Bool? = nil,
        timeoutSeconds: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.messages = messages
        self.enabled = enabled
        self.timeoutSeconds = timeoutSeconds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .messages)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.messages, forKey: .messages)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case messages
        case enabled
        case timeoutSeconds
    }
}