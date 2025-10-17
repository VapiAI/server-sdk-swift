import Foundation

public struct ServerMessageVoiceRequest: Codable, Hashable, Sendable {
    /// This is the phone number that the message is associated with.
    public let phoneNumber: ServerMessageVoiceRequestPhoneNumber?
    /// This is the type of the message. "voice-request" is sent when using `assistant.voice={ "type": "custom-voice" }`.
    /// 
    /// Here is what the request will look like:
    /// 
    /// POST https://{assistant.voice.server.url}
    /// Content-Type: application/json
    /// 
    /// {
    ///   "messsage": {
    ///     "type": "voice-request",
    ///     "text": "Hello, world!",
    ///     "sampleRate": 24000,
    ///     ...other metadata about the call...
    ///   }
    /// }
    /// 
    /// The expected response is 1-channel 16-bit raw PCM audio at the sample rate specified in the request. Here is how the response will be piped to the transport:
    /// ```
    /// response.on('data', (chunk: Buffer) => {
    ///   outputStream.write(chunk);
    /// });
    /// ```
    public let type: VoiceRequest
    /// This is the timestamp of the message.
    public let timestamp: Double?
    /// This is a live version of the `call.artifact`.
    /// 
    /// This matches what is stored on `call.artifact` after the call.
    public let artifact: Artifact?
    /// This is the assistant that the message is associated with.
    public let assistant: CreateAssistantDto?
    /// This is the customer that the message is associated with.
    public let customer: CreateCustomerDto?
    /// This is the call that the message is associated with.
    public let call: Call?
    /// This is the chat object.
    public let chat: Chat?
    /// This is the text to be synthesized.
    public let text: String
    /// This is the sample rate to be synthesized.
    public let sampleRate: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        phoneNumber: ServerMessageVoiceRequestPhoneNumber? = nil,
        type: VoiceRequest,
        timestamp: Double? = nil,
        artifact: Artifact? = nil,
        assistant: CreateAssistantDto? = nil,
        customer: CreateCustomerDto? = nil,
        call: Call? = nil,
        chat: Chat? = nil,
        text: String,
        sampleRate: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.phoneNumber = phoneNumber
        self.type = type
        self.timestamp = timestamp
        self.artifact = artifact
        self.assistant = assistant
        self.customer = customer
        self.call = call
        self.chat = chat
        self.text = text
        self.sampleRate = sampleRate
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.phoneNumber = try container.decodeIfPresent(ServerMessageVoiceRequestPhoneNumber.self, forKey: .phoneNumber)
        self.type = try container.decode(VoiceRequest.self, forKey: .type)
        self.timestamp = try container.decodeIfPresent(Double.self, forKey: .timestamp)
        self.artifact = try container.decodeIfPresent(Artifact.self, forKey: .artifact)
        self.assistant = try container.decodeIfPresent(CreateAssistantDto.self, forKey: .assistant)
        self.customer = try container.decodeIfPresent(CreateCustomerDto.self, forKey: .customer)
        self.call = try container.decodeIfPresent(Call.self, forKey: .call)
        self.chat = try container.decodeIfPresent(Chat.self, forKey: .chat)
        self.text = try container.decode(String.self, forKey: .text)
        self.sampleRate = try container.decode(Double.self, forKey: .sampleRate)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.artifact, forKey: .artifact)
        try container.encodeIfPresent(self.assistant, forKey: .assistant)
        try container.encodeIfPresent(self.customer, forKey: .customer)
        try container.encodeIfPresent(self.call, forKey: .call)
        try container.encodeIfPresent(self.chat, forKey: .chat)
        try container.encode(self.text, forKey: .text)
        try container.encode(self.sampleRate, forKey: .sampleRate)
    }

    public enum VoiceRequest: String, Codable, Hashable, CaseIterable, Sendable {
        case voiceRequest = "voice-request"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case phoneNumber
        case type
        case timestamp
        case artifact
        case assistant
        case customer
        case call
        case chat
        case text
        case sampleRate
    }
}