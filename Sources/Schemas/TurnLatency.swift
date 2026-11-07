import Foundation

/// Model, voice, transcription, endpointing, and total latency measurements for a conversation turn.
public struct TurnLatency: Codable, Hashable, Sendable {
    /// This is the time in milliseconds from the start of the turn's model stage to the model's first output token.
    /// It includes knowledge-base retrieval and request routing before the provider request. 0 when it was not measured on this turn.
    public let modelLatency: Double?
    /// This is the time in milliseconds from the model's first output token to the first reply audio reaching Vapi's turn-taking buffer.
    /// It includes the wait to collect enough text for the first voice request (set by `voice.chunkPlan`), the voice provider's time to first audio, and any sample-rate conversion. 0 when it was not measured on this turn.
    public let voiceLatency: Double?
    /// This is the time in milliseconds from the user's last voice activity signal, normally the end of speech, to the transcriber returning the words of that speech.
    /// 0 when it was not measured, including when the words arrived before that signal.
    public let transcriberLatency: Double?
    /// This is the time in milliseconds from the transcriber returning the words to Vapi deciding the turn is over and sending it to the model.
    /// 0 when the reply was not triggered by sending a user transcript to the model.
    public let endpointingLatency: Double?
    /// This is the time in milliseconds from the user's last voice activity signal to Vapi starting to send the assistant's reply audio.
    /// It is computed as `transcriberLatency` + `endpointingLatency` + the time from that decision to the reply starting, so when `transcriberLatency` is 0 because it was not measured, this total leaves that interval out. `modelLatency` and `voiceLatency` fall inside the last part, so the fields do not add up to this value.
    public let turnLatency: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        modelLatency: Double? = nil,
        voiceLatency: Double? = nil,
        transcriberLatency: Double? = nil,
        endpointingLatency: Double? = nil,
        turnLatency: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.modelLatency = modelLatency
        self.voiceLatency = voiceLatency
        self.transcriberLatency = transcriberLatency
        self.endpointingLatency = endpointingLatency
        self.turnLatency = turnLatency
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.modelLatency = try container.decodeIfPresent(Double.self, forKey: .modelLatency)
        self.voiceLatency = try container.decodeIfPresent(Double.self, forKey: .voiceLatency)
        self.transcriberLatency = try container.decodeIfPresent(Double.self, forKey: .transcriberLatency)
        self.endpointingLatency = try container.decodeIfPresent(Double.self, forKey: .endpointingLatency)
        self.turnLatency = try container.decodeIfPresent(Double.self, forKey: .turnLatency)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.modelLatency, forKey: .modelLatency)
        try container.encodeIfPresent(self.voiceLatency, forKey: .voiceLatency)
        try container.encodeIfPresent(self.transcriberLatency, forKey: .transcriberLatency)
        try container.encodeIfPresent(self.endpointingLatency, forKey: .endpointingLatency)
        try container.encodeIfPresent(self.turnLatency, forKey: .turnLatency)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case modelLatency
        case voiceLatency
        case transcriberLatency
        case endpointingLatency
        case turnLatency
    }
}