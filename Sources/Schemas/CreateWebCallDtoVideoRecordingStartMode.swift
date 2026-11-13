import Foundation

/// This determines who starts the video recording. Only applies when video
/// recording is enabled (`artifactPlan.videoRecordingEnabled`).
/// 
/// - `client`: the web client starts the recording when it joins.
/// - `server`: Vapi starts the recording once when the user first joins, so a
///   weak client connection can't stop it from starting. The returned
///   `transport.callToken` doesn't start the recording, and the client should
///   not start it either. If Vapi can't set up the server-side start, no token
///   is returned. If the start itself fails, the client is told during the
///   call.
/// 
/// Defaults to `client`.
public enum CreateWebCallDtoVideoRecordingStartMode: String, Codable, Hashable, CaseIterable, Sendable {
    case client
    case server
}