import Foundation

/// ElevenLabs-only API environment for this key: the global endpoint or the EU data residency endpoint. In EU deployments, new credentials must explicitly use the EU data residency endpoint; existing credentials may omit this field on update to retain their saved endpoint. Outside EU deployments, Vapi detects an omitted endpoint automatically and null on update clears and re-detects the endpoint.
public enum ElevenLabsCredentialApiUrl: String, Codable, Hashable, CaseIterable, Sendable {
    case httpsApiElevenlabsIo = "https://api.elevenlabs.io"
    case httpsApiEuResidencyElevenlabsIo = "https://api.eu.residency.elevenlabs.io"
}