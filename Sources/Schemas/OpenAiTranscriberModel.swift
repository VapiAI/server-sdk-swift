import Foundation

/// This is the model that will be used for the transcription.
public enum OpenAiTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case gpt4OTranscribe = "gpt-4o-transcribe"
    case gpt4OMiniTranscribe = "gpt-4o-mini-transcribe"
}