import Foundation

public enum DeepgramTranscriberModel: String, Codable, Hashable, CaseIterable, Sendable {
    case nova3 = "nova-3"
    case nova3General = "nova-3-general"
    case nova3Medical = "nova-3-medical"
    case nova2 = "nova-2"
    case nova2General = "nova-2-general"
    case nova2Meeting = "nova-2-meeting"
    case nova2Phonecall = "nova-2-phonecall"
    case nova2Finance = "nova-2-finance"
    case nova2Conversationalai = "nova-2-conversationalai"
    case nova2Voicemail = "nova-2-voicemail"
    case nova2Video = "nova-2-video"
    case nova2Medical = "nova-2-medical"
    case nova2Drivethru = "nova-2-drivethru"
    case nova2Automotive = "nova-2-automotive"
    case nova
    case novaGeneral = "nova-general"
    case novaPhonecall = "nova-phonecall"
    case novaMedical = "nova-medical"
    case enhanced
    case enhancedGeneral = "enhanced-general"
    case enhancedMeeting = "enhanced-meeting"
    case enhancedPhonecall = "enhanced-phonecall"
    case enhancedFinance = "enhanced-finance"
    case base
    case baseGeneral = "base-general"
    case baseMeeting = "base-meeting"
    case basePhonecall = "base-phonecall"
    case baseFinance = "base-finance"
    case baseConversationalai = "base-conversationalai"
    case baseVoicemail = "base-voicemail"
    case baseVideo = "base-video"
}