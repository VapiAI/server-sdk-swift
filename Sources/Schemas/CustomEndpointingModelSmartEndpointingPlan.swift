import Foundation

public struct CustomEndpointingModelSmartEndpointingPlan: Codable, Hashable, Sendable {
    /// This is the provider for the smart endpointing plan. Use `custom-endpointing-model` for custom endpointing providers that are not natively supported.
    public let provider: CustomEndpointingModelSmartEndpointingPlanProvider
    /// This is where the endpointing request will be sent. If not provided, will be sent to `assistant.server`. If that does not exist either, will be sent to `org.server`.
    /// 
    /// Request Example:
    /// 
    /// POST https://{server.url}
    /// Content-Type: application/json
    /// 
    /// {
    ///   "message": {
    ///     "type": "call.endpointing.request",
    ///     "messages": [
    ///       {
    ///         "role": "user",
    ///         "message": "Hello, how are you?",
    ///         "time": 1234567890,
    ///         "secondsFromStart": 0
    ///       }
    ///     ],
    ///     ...other metadata about the call...
    ///   }
    /// }
    /// 
    /// Response Expected:
    /// {
    ///   "timeoutSeconds": 0.5
    /// }
    /// 
    /// The timeout is the number of seconds to wait before considering the user's speech as finished. The endpointing timeout is automatically reset each time a new transcript is received (and another `call.endpointing.request` is sent).
    public let server: Server?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: CustomEndpointingModelSmartEndpointingPlanProvider,
        server: Server? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.server = server
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(CustomEndpointingModelSmartEndpointingPlanProvider.self, forKey: .provider)
        self.server = try container.decodeIfPresent(Server.self, forKey: .server)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.server, forKey: .server)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case server
    }
}