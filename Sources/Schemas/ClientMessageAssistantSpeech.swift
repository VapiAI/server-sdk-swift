import Foundation

public struct ClientMessageAssistantSpeech: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ClientMessageAssistantSpeechPhoneNumber?
    /// This is the type of the message. "assistant-speech" is sent as assistant audio is being played.
    public let type: ClientMessageAssistantSpeechType
    /// The full assistant text for the current turn. This is the complete text,
    /// not an incremental delta — consumers should use `timing` metadata (e.g.
    /// `wordsSpoken`) to determine which portion has been spoken so far.
    public let text: String
    /// This is the turn number of the assistant speech event (0-indexed).
    public let turn: Double?
    /// Indicates how the text was sourced.
    public let source: ClientMessageAssistantSpeechSource?
    /// Optional timing metadata. Shape depends on `timing.type`:
    /// 
    /// - `word-alignment` (ElevenLabs): per-character timing at playback
    ///   cadence. words[] includes space entries. Best consumed by tracking
    ///   a running character count: join timing.words, add to a char cursor,
    ///   and highlight text up to that position. No interpolation needed.
    /// 
    /// - `word-progress` (Minimax with voice.subtitleType: 'word'): cursor-
    ///   based word count per TTS segment. Use wordsSpoken as the anchor,
    ///   interpolate forward using segmentDurationMs or timing.words until
    ///   the next event arrives.
    /// 
    /// When absent, the event is a text-only fallback for providers without
    /// word-level timing (e.g. Cartesia, Deepgram, Azure). Text emits once
    /// per TTS chunk when audio is playing. Optionally interpolate a word
    /// cursor at ~3.5 words/sec between events for approximate tracking.
    public let timing: ClientMessageAssistantSpeechTiming?
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ClientMessageAssistantSpeechPhoneNumber? = nil,
        type: ClientMessageAssistantSpeechType,
        text: String,
        turn: Double? = nil,
        source: ClientMessageAssistantSpeechSource? = nil,
        timing: ClientMessageAssistantSpeechTiming? = nil,
        timestamp: Double? = nil,
        call: Call? = nil,
        customer: CreateCustomerDto? = nil,
        assistant: CreateAssistantDto? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.text = text
        self.turn = turn
        self.source = source
        self.timing = timing
        self.timestamp = timestamp
        self.call = call
        self.customer = customer
        self.assistant = assistant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ClientMessageAssistantSpeechPhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(ClientMessageAssistantSpeechType.self, forKey: .type)
        self.text = try container.decode(String.self, forKey: .text)
        self.turn = try container.decodeIfPresent(Double.self, forKey: .turn)
        self.source = try container.decodeIfPresent(ClientMessageAssistantSpeechSource.self, forKey: .source)
        self.timing = try container.decodeIfPresent(ClientMessageAssistantSpeechTiming.self, forKey: .timing)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.text, forKey: .text)
        try container.encodeIfPresent(self.turn, forKey: .turn)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.timing, forKey: .timing)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case text
        case turn
        case source
        case timing
        case timestamp
        case call
        case customer
        case assistant
    }
}