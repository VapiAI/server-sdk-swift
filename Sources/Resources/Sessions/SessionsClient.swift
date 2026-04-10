import Foundation

public final class SessionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(id: String? = nil, name: String? = nil, assistantId: String? = nil, assistantIdAny: String? = nil, squadId: String? = nil, workflowId: String? = nil, numberE164CheckEnabled: Bool? = nil, extension: String? = nil, assistantOverrides: String? = nil, number: String? = nil, sipUri: String? = nil, email: String? = nil, externalId: String? = nil, customerNumberAny: String? = nil, phoneNumberId: String? = nil, phoneNumberIdAny: String? = nil, page: Double? = nil, sortOrder: ListSessionsRequestSortOrder? = nil, limit: Double? = nil, createdAtGt: Date? = nil, createdAtLt: Date? = nil, createdAtGe: Date? = nil, createdAtLe: Date? = nil, updatedAtGt: Date? = nil, updatedAtLt: Date? = nil, updatedAtGe: Date? = nil, updatedAtLe: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> SessionPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/session",
            queryParams: [
                "id": id.map { .string($0) }, 
                "name": name.map { .string($0) }, 
                "assistantId": assistantId.map { .string($0) }, 
                "assistantIdAny": assistantIdAny.map { .string($0) }, 
                "squadId": squadId.map { .string($0) }, 
                "workflowId": workflowId.map { .string($0) }, 
                "numberE164CheckEnabled": numberE164CheckEnabled.map { .bool($0) }, 
                "extension": `extension`.map { .string($0) }, 
                "assistantOverrides": assistantOverrides.map { .string($0) }, 
                "number": number.map { .string($0) }, 
                "sipUri": sipUri.map { .string($0) }, 
                "email": email.map { .string($0) }, 
                "externalId": externalId.map { .string($0) }, 
                "customerNumberAny": customerNumberAny.map { .string($0) }, 
                "phoneNumberId": phoneNumberId.map { .string($0) }, 
                "phoneNumberIdAny": phoneNumberIdAny.map { .string($0) }, 
                "page": page.map { .double($0) }, 
                "sortOrder": sortOrder.map { .string($0.rawValue) }, 
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
            responseType: SessionPaginatedResponse.self
        )
    }

    public func create(request: Requests.CreateSessionDto, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .post,
            path: "/session",
            body: request,
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .get,
            path: "/session/\(id)",
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/session/\(id)",
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }

    public func update(id: String, request: Requests.UpdateSessionDto, requestOptions: RequestOptions? = nil) async throws -> Session {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/session/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Session.self
        )
    }
}