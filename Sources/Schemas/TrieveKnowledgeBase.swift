import Foundation

public struct TrieveKnowledgeBase: Codable, Hashable, Sendable {
    /// This knowledge base is provided by Trieve.
    /// 
    /// To learn more about Trieve, visit https://trieve.ai.
    public let provider: Trieve
    /// This is the name of the knowledge base.
    public let name: String?
    /// This is the searching plan used when searching for relevant chunks from the vector store.
    /// 
    /// You should configure this if you're running into these issues:
    /// - Too much unnecessary context is being fed as knowledge base context.
    /// - Not enough relevant context is being fed as knowledge base context.
    public let searchPlan: TrieveKnowledgeBaseSearchPlan?
    /// This is the plan if you want us to create/import a new vector store using Trieve.
    public let createPlan: TrieveKnowledgeBaseImport?
    /// This is the id of the knowledge base.
    public let id: String
    /// This is the org id of the knowledge base.
    public let orgId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: Trieve,
        name: String? = nil,
        searchPlan: TrieveKnowledgeBaseSearchPlan? = nil,
        createPlan: TrieveKnowledgeBaseImport? = nil,
        id: String,
        orgId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.name = name
        self.searchPlan = searchPlan
        self.createPlan = createPlan
        self.id = id
        self.orgId = orgId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decode(Trieve.self, forKey: .provider)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.searchPlan = try container.decodeIfPresent(TrieveKnowledgeBaseSearchPlan.self, forKey: .searchPlan)
        self.createPlan = try container.decodeIfPresent(TrieveKnowledgeBaseImport.self, forKey: .createPlan)
        self.id = try container.decode(String.self, forKey: .id)
        self.orgId = try container.decode(String.self, forKey: .orgId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.searchPlan, forKey: .searchPlan)
        try container.encodeIfPresent(self.createPlan, forKey: .createPlan)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.orgId, forKey: .orgId)
    }

    public enum Trieve: String, Codable, Hashable, CaseIterable, Sendable {
        case trieve
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case name
        case searchPlan
        case createPlan
        case id
        case orgId
    }
}