import Foundation

/// This is the service being used in Azure.
public enum CreateAzureCredentialDtoService: String, Codable, Hashable, CaseIterable, Sendable {
    case speech
    case blobStorage = "blob_storage"
}