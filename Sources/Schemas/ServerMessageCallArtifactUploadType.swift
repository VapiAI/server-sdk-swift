import Foundation

/// This is the type of the message. "call.artifact.upload" is sent after a call
/// to report whether each artifact was stored in your own configured storage.
public enum ServerMessageCallArtifactUploadType: String, Codable, Hashable, CaseIterable, Sendable {
    case callArtifactUpload = "call.artifact.upload"
}