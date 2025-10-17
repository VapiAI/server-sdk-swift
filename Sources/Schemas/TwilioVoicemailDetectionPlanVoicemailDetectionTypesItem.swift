import Foundation

public enum TwilioVoicemailDetectionPlanVoicemailDetectionTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case machineStart = "machine_start"
    case human
    case fax
    case unknown
    case machineEndBeep = "machine_end_beep"
    case machineEndSilence = "machine_end_silence"
    case machineEndOther = "machine_end_other"
}