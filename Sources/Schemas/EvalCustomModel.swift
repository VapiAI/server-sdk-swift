import Foundation

public struct EvalCustomModel: Codable, Hashable, Sendable {
    /// These is the URL we'll use for the OpenAI client's `baseURL`. Ex. https://openrouter.ai/api/v1
    public let url: String
    /// These are the headers we'll use for the OpenAI client's `headers`.
    public let headers: [String: JSONValue]?
    /// This sets the timeout for the connection to the custom provider without needing to stream any tokens back. Default is 20 seconds.
    public let timeoutSeconds: Double?
    /// This is the name of the model. Ex. gpt-4o
    public let model: String
    /// This is the temperature of the model. For LLM-as-a-judge, it's recommended to set it between 0 - 0.3 to avoid hallucinations and ensure the model judges the output correctly based on the instructions.
    public let temperature: Double?
    /// This is the max tokens of the model.
    /// If your Judge instructions return `true` or `false` takes only 1 token (as per the OpenAI Tokenizer), and therefore is recommended to set it to a low number to force the model to return a short response.
    public let maxTokens: Double?
    /// These are the messages which will instruct the AI Judge on how to evaluate the assistant message.
    /// The LLM-Judge must respond with "pass" or "fail" to indicate if the assistant message passes the eval.
    /// 
    /// To access the messages in the mock conversation, use the LiquidJS variable `{{messages}}`.
    /// The assistant message to be evaluated will be passed as the last message in the `messages` array and can be accessed using `{{messages[-1]}}`.
    /// 
    /// It is recommended to use the system message to instruct the LLM how to evaluate the assistant message, and then use the first user message to pass the assistant message to be evaluated.
    public let messages: [[String: JSONValue]]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String,
        headers: [String: JSONValue]? = nil,
        timeoutSeconds: Double? = nil,
        model: String,
        temperature: Double? = nil,
        maxTokens: Double? = nil,
        messages: [[String: JSONValue]],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.headers = headers
        self.timeoutSeconds = timeoutSeconds
        self.model = model
        self.temperature = temperature
        self.maxTokens = maxTokens
        self.messages = messages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.headers = try container.decodeIfPresent([String: JSONValue].self, forKey: .headers)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.model = try container.decode(String.self, forKey: .model)
        self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
        self.messages = try container.decode([[String: JSONValue]].self, forKey: .messages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encode(self.model, forKey: .model)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
        try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
        try container.encode(self.messages, forKey: .messages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case headers
        case timeoutSeconds
        case model
        case temperature
        case maxTokens
        case messages
    }
}