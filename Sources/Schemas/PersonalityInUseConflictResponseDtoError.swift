import Foundation

public enum PersonalityInUseConflictResponseDtoError: String, Codable, Hashable, CaseIterable, Sendable {
    case personalityInUse = "personality_in_use"
}