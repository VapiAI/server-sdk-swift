import Foundation

public enum SyncVoiceLibraryDtoProvidersItem: String, Codable, Hashable, CaseIterable, Sendable {
    case vapi
    case elevenLabs = "11labs"
    case azure
    case cartesia
    case customVoice = "custom-voice"
    case deepgram
    case hume
    case lmnt
    case neuphonic
    case openai
    case playht
    case rimeAi = "rime-ai"
    case smallestAi = "smallest-ai"
    case tavus
    case sesame
    case inworld
    case minimax
}