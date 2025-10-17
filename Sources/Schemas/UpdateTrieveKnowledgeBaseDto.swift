import Foundation

public struct UpdateTrieveKnowledgeBaseDto: Codable, Hashable, Sendable {
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
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String? = nil,
        searchPlan: TrieveKnowledgeBaseSearchPlan? = nil,
        createPlan: TrieveKnowledgeBaseImport? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.searchPlan = searchPlan
        self.createPlan = createPlan
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.searchPlan = try container.decodeIfPresent(TrieveKnowledgeBaseSearchPlan.self, forKey: .searchPlan)
        self.createPlan = try container.decodeIfPresent(TrieveKnowledgeBaseImport.self, forKey: .createPlan)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.searchPlan, forKey: .searchPlan)
        try container.encodeIfPresent(self.createPlan, forKey: .createPlan)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case searchPlan
        case createPlan
    }
}