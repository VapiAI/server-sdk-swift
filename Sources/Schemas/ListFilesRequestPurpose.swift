import Foundation

public enum ListFilesRequestPurpose: String, Codable, Hashable, CaseIterable, Sendable {
    case assistant
    case composerAttachment = "composer-attachment"
    case knowledgeBaseV2 = "knowledge-base-v2"
}