import Foundation

/// This can be used to bring your own SIP trunks or to connect to a Carrier.
public enum UpdateByoSipTrunkCredentialDtoProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case byoSipTrunk = "byo-sip-trunk"
}