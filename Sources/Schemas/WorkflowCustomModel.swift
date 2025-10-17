import Foundation

public struct WorkflowCustomModel: Codable, Hashable, Sendable {
    /// This determines whether metadata is sent in requests to the custom provider.
    /// 
    /// - `off` will not send any metadata. payload will look like `{ messages }`
    /// - `variable` will send `assistant.metadata` as a variable on the payload. payload will look like `{ messages, metadata }`
    /// - `destructured` will send `assistant.metadata` fields directly on the payload. payload will look like `{ messages, ...metadata }`
    /// 
    /// Further, `variable` and `destructured` will send `call`, `phoneNumber`, and `customer` objects in the payload.
    /// 
    /// Default is `variable`.
    public let metadataSendMode: WorkflowCustomModelMetadataSendMode?
    /// These is the URL we'll use for the OpenAI client's `baseURL`. Ex. https://openrouter.ai/api/v1
    public let url: String
    /// These are the headers we'll use for the OpenAI client's `headers`.
    public let headers: [String: JSONValue]?
    /// This sets the timeout for the connection to the custom provider without needing to stream any tokens back. Default is 20 seconds.
    public let timeoutSeconds: Double?
    /// This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
    public let model: String
    /// This is the temperature of the model.
    public let temperature: Double?
    /// This is the max tokens of the model.
    public let maxTokens: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        metadataSendMode: WorkflowCustomModelMetadataSendMode? = nil,
        url: String,
        headers: [String: JSONValue]? = nil,
        timeoutSeconds: Double? = nil,
        model: String,
        temperature: Double? = nil,
        maxTokens: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.metadataSendMode = metadataSendMode
        self.url = url
        self.headers = headers
        self.timeoutSeconds = timeoutSeconds
        self.model = model
        self.temperature = temperature
        self.maxTokens = maxTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metadataSendMode = try container.decodeIfPresent(WorkflowCustomModelMetadataSendMode.self, forKey: .metadataSendMode)
        self.url = try container.decode(String.self, forKey: .url)
        self.headers = try container.decodeIfPresent([String: JSONValue].self, forKey: .headers)
        self.timeoutSeconds = try container.decodeIfPresent(Double.self, forKey: .timeoutSeconds)
        self.model = try container.decode(String.self, forKey: .model)
        self.temperature = try container.decodeIfPresent(Double.self, forKey: .temperature)
        self.maxTokens = try container.decodeIfPresent(Double.self, forKey: .maxTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.metadataSendMode, forKey: .metadataSendMode)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.timeoutSeconds, forKey: .timeoutSeconds)
        try container.encode(self.model, forKey: .model)
        try container.encodeIfPresent(self.temperature, forKey: .temperature)
        try container.encodeIfPresent(self.maxTokens, forKey: .maxTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case metadataSendMode
        case url
        case headers
        case timeoutSeconds
        case model
        case temperature
        case maxTokens
    }
}