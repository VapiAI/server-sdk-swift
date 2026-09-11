import Foundation

public final class CallsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns calls for the authenticated organization. Filter results by call ID, assistant ID, phone number ID, or creation and update timestamps.
    ///
    /// - Parameter id: This is the unique identifier for the call.
    /// - Parameter assistantId: This will return calls with the specified assistantId.
    /// - Parameter phoneNumberId: This is the phone number that will be used for the call. To use a transient number, use `phoneNumber` instead.
    /// 
    /// Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    /// - Parameter limit: This is the maximum number of items to return. Defaults to 100.
    /// - Parameter createdAtGt: This will return items where the createdAt is greater than the specified value.
    /// - Parameter createdAtLt: This will return items where the createdAt is less than the specified value.
    /// - Parameter createdAtGe: This will return items where the createdAt is greater than or equal to the specified value.
    /// - Parameter createdAtLe: This will return items where the createdAt is less than or equal to the specified value.
    /// - Parameter updatedAtGt: This will return items where the updatedAt is greater than the specified value.
    /// - Parameter updatedAtLt: This will return items where the updatedAt is less than the specified value.
    /// - Parameter updatedAtGe: This will return items where the updatedAt is greater than or equal to the specified value.
    /// - Parameter updatedAtLe: This will return items where the updatedAt is less than or equal to the specified value.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(id: String? = nil, assistantId: String? = nil, phoneNumberId: String? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> [Call] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call",
            queryParams: [
                "id": id.map { .string($0) }, 
                "assistantId": assistantId.map { .string($0) }, 
                "phoneNumberId": phoneNumberId.map { .string($0) }, 
                "limit": limit.map { .double($0) }, 
                "createdAtGt": createdAtGt.map { .date($0) }, 
                "createdAtLt": createdAtLt.map { .date($0) }, 
                "createdAtGe": createdAtGe.map { .date($0) }, 
                "createdAtLe": createdAtLe.map { .date($0) }, 
                "updatedAtGt": updatedAtGt.map { .date($0) }, 
                "updatedAtLt": updatedAtLt.map { .date($0) }, 
                "updatedAtGe": updatedAtGe.map { .date($0) }, 
                "updatedAtLe": updatedAtLe.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: [Call].self
        )
    }

    /// Creates a call using an assistant or squad. The request can reference saved resources or include transient configurations.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCallDto, requestOptions: RequestOptions? = nil) async throws -> CreateCallsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/call",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateCallsResponse.self
        )
    }

    /// Returns the call identified by its ID, including its status, configuration, and available call data.
    ///
    /// - Parameter id: The unique identifier of the call.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)",
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }

    /// Deletes the call identified by its ID.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, request: Requests.DeleteCallDto, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/call/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }

    /// Updates the call identified by its ID.
    ///
    /// - Parameter id: The unique identifier of the call.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateCallDto, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/call/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }

    public func callArtifactControllerMonoRecordingDownload(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)/mono-recording",
            requestOptions: requestOptions
        )
    }

    public func callArtifactControllerStereoRecordingDownload(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)/stereo-recording",
            requestOptions: requestOptions
        )
    }

    public func callArtifactControllerVideoRecordingDownload(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)/video-recording",
            requestOptions: requestOptions
        )
    }

    public func callArtifactControllerCustomerRecordingDownload(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)/customer-recording",
            requestOptions: requestOptions
        )
    }

    public func callArtifactControllerAssistantRecordingDownload(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)/assistant-recording",
            requestOptions: requestOptions
        )
    }

    public func callArtifactControllerPcapDownload(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)/pcap",
            requestOptions: requestOptions
        )
    }

    public func callArtifactControllerCallLogsDownload(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)/call-logs",
            requestOptions: requestOptions
        )
    }
}