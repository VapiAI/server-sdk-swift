import Foundation

public struct CustomTranscriber: Codable, Hashable, Sendable {
    /// This is where the transcription request will be sent.
    /// 
    /// Usage:
    /// 1. Vapi will initiate a websocket connection with `server.url`.
    /// 
    /// 2. Vapi will send an initial text frame with the sample rate. Format:
    /// ```
    ///     {
    ///       "type": "start",
    ///       "encoding": "linear16", // 16-bit raw PCM format
    ///       "container": "raw",
    ///       "sampleRate": {{sampleRate}},
    ///       "channels": 2 // customer is channel 0, assistant is channel 1
    ///     }
    /// ```
    /// 
    /// 3. Vapi will send the audio data in 16-bit raw PCM format as binary frames.
    /// 
    /// 4. You can read the messages something like this:
    /// ```
    /// ws.on('message', (data, isBinary) => {
    ///   if (isBinary) {
    ///     pcmBuffer = Buffer.concat([pcmBuffer, data]);
    ///     console.log(`Received PCM data, buffer size: ${pcmBuffer.length}`);
    ///   } else {
    ///     console.log('Received message:', JSON.parse(data.toString()));
    ///   }
    /// });
    /// ```
    /// 
    /// 5. You will respond with transcriptions as you have them. Format:
    /// ```
    ///  {
    ///     "type": "transcriber-response",
    ///     "transcription": "Hello, world!",
    ///     "channel": "customer" | "assistant"
    ///  }
    /// ```
    public let server: Server
    /// This is the plan for voice provider fallbacks in the event that the primary voice provider fails.
    public let fallbackPlan: FallbackTranscriberPlan?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        server: Server,
        fallbackPlan: FallbackTranscriberPlan? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.server = server
        self.fallbackPlan = fallbackPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.server = try container.decode(Server.self, forKey: .server)
        self.fallbackPlan = try container.decodeIfPresent(FallbackTranscriberPlan.self, forKey: .fallbackPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.server, forKey: .server)
        try container.encodeIfPresent(self.fallbackPlan, forKey: .fallbackPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case server
        case fallbackPlan
    }
}