import Foundation

public struct TranscriptPlan: Codable, Hashable, Sendable {
    /// This determines whether the transcript is stored in `call.artifact.transcript`. Defaults to true.
    /// 
    /// @default true
    public let enabled: Bool?
    /// This is the name of the assistant in the transcript. Defaults to 'AI'.
    /// 
    /// Usage:
    /// - If you want to change the name of the assistant in the transcript, set this. Example, here is what the transcript would look like with `assistantName` set to 'Buyer':
    /// ```
    /// User: Hello, how are you?
    /// Buyer: I'm fine.
    /// User: Do you want to buy a car?
    /// Buyer: No.
    /// ```
    /// 
    /// @default 'AI'
    public let assistantName: String?
    /// This is the name of the user in the transcript. Defaults to 'User'.
    /// 
    /// Usage:
    /// - If you want to change the name of the user in the transcript, set this. Example, here is what the transcript would look like with `userName` set to 'Seller':
    /// ```
    /// Seller: Hello, how are you?
    /// AI: I'm fine.
    /// Seller: Do you want to buy a car?
    /// AI: No.
    /// ```
    /// 
    /// @default 'User'
    public let userName: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        enabled: Bool? = nil,
        assistantName: String? = nil,
        userName: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.enabled = enabled
        self.assistantName = assistantName
        self.userName = userName
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decodeIfPresent(Bool.self, forKey: .enabled)
        self.assistantName = try container.decodeIfPresent(String.self, forKey: .assistantName)
        self.userName = try container.decodeIfPresent(String.self, forKey: .userName)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.enabled, forKey: .enabled)
        try container.encodeIfPresent(self.assistantName, forKey: .assistantName)
        try container.encodeIfPresent(self.userName, forKey: .userName)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case enabled
        case assistantName
        case userName
    }
}