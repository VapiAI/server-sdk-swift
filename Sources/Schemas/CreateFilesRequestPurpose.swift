import Foundation

/// Optional product flow that owns the uploaded file.
public enum CreateFilesRequestPurpose: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
    case composerAttachment = "composer-attachment"
    case knowledgeBaseV2 = "knowledge-base-v2"
}