import Foundation

public struct CustomKnowledgeBase: Codable, Hashable, Sendable {
    /// This knowledge base is bring your own knowledge base implementation.
    public let provider: CustomKnowledgeBase
    /// This is where the knowledge base request will be sent.
    /// 
    /// Request Example:
    /// 
    /// POST https://{server.url}
    /// Content-Type: application/json
    /// 
    /// {
    ///   "messsage": {
    ///     "type": "knowledge-base-request",
    ///     "messages": [
    ///       {
    ///         "role": "user",
    ///         "content": "Why is ocean blue?"
    ///       }
    ///     ],
    ///     ...other metadata about the call...
    ///   }
    /// }
    /// 
    /// Response Expected:
    /// ```
    /// {
    ///   "message": {
    ///      "role": "assistant",
    ///      "content": "The ocean is blue because water absorbs everything but blue.",
    ///   }, // YOU CAN RETURN THE EXACT RESPONSE TO SPEAK
    ///   "documents": [
    ///     {
    ///       "content": "The ocean is blue primarily because water absorbs colors in the red part of the light spectrum and scatters the blue light, making it more visible to our eyes.",
    ///       "similarity": 1
    ///     },
    ///     {
    ///       "content": "Blue light is scattered more by the water molecules than other colors, enhancing the blue appearance of the ocean.",
    ///       "similarity": .5
    ///     }
    ///   ] // OR, YOU CAN RETURN AN ARRAY OF DOCUMENTS THAT WILL BE SENT TO THE MODEL
    /// }
    /// ```
    public let server: Server
    /// This is the id of the knowledge base.
    public let id: String
    /// This is the org id of the knowledge base.
    public let orgId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: CustomKnowledgeBase,
        server: Server,
        id: String,
        orgId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.server = server
        self.id = id
        self.orgId = orgId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(CustomKnowledgeBase.self, forKey: .provider)
        self.server = try container.decode(Server.self, forKey: .server)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.server, forKey: .server)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
    }

    public enum CustomKnowledgeBase: String, Codable, Hashable, CaseIterable, Sendable {
        case customKnowledgeBase = "custom-knowledge-base"
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case server
        case id
        case orgId
    }
}