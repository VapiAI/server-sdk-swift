import Foundation

/// This is the type of the message. "knowledge-base-request" is sent to request knowledge base documents. To enable, use `assistant.knowledgeBase.provider=custom-knowledge-base`.
public enum ServerMessageKnowledgeBaseRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case knowledgeBaseRequest = "knowledge-base-request"
}