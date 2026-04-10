import Foundation

public enum AzureOpenAiCredentialProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case azureOpenai = "azure-openai"
}