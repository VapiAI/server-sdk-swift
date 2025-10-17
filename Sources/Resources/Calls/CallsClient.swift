import Foundation

public final class CallsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(id: Nullable<String>? = nil, assistantId: Nullable<String>? = nil, phoneNumberId: Nullable<String>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> [Call] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call",
            queryParams: [
                "id": id?.wrappedValue.map { .string($0) }, 
                "assistantId": assistantId?.wrappedValue.map { .string($0) }, 
                "phoneNumberId": phoneNumberId?.wrappedValue.map { .string($0) }, 
                "limit": limit?.wrappedValue.map { .double($0) }, 
                "createdAtGt": createdAtGt?.wrappedValue.map { .date($0) }, 
                "createdAtLt": createdAtLt?.wrappedValue.map { .date($0) }, 
                "createdAtGe": createdAtGe?.wrappedValue.map { .date($0) }, 
                "createdAtLe": createdAtLe?.wrappedValue.map { .date($0) }, 
                "updatedAtGt": updatedAtGt?.wrappedValue.map { .date($0) }, 
                "updatedAtLt": updatedAtLt?.wrappedValue.map { .date($0) }, 
                "updatedAtGe": updatedAtGe?.wrappedValue.map { .date($0) }, 
                "updatedAtLe": updatedAtLe?.wrappedValue.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: [Call].self
        )
    }

    public func create(request: Requests.CreateCallDto, requestOptions: RequestOptions? = nil) async throws -> CallsCreateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/call",
            body: request,
            requestOptions: requestOptions,
            responseType: CallsCreateResponse.self
        )
    }

    public func callControllerFindAllPaginated(assistantOverrides: Nullable<[String: JSONValue]>? = nil, customer: Nullable<[String: JSONValue]>? = nil, assistantId: Nullable<String>? = nil, assistantName: Nullable<String>? = nil, id: Nullable<String>? = nil, idAny: Nullable<String>? = nil, costLe: Nullable<Double>? = nil, costGe: Nullable<Double>? = nil, cost: Nullable<Double>? = nil, successEvaluation: Nullable<String>? = nil, endedReason: Nullable<String>? = nil, phoneNumberId: Nullable<String>? = nil, structuredOutputs: Nullable<[String: Nullable<CallControllerFindAllPaginatedRequestStructuredOutputsValue>?]>? = nil, page: Nullable<Double>? = nil, sortOrder: Nullable<CallControllerFindAllPaginatedRequestSortOrder>? = nil, limit: Nullable<Double>? = nil, createdAtGt: Nullable<Date>? = nil, createdAtLt: Nullable<Date>? = nil, createdAtGe: Nullable<Date>? = nil, createdAtLe: Nullable<Date>? = nil, updatedAtGt: Nullable<Date>? = nil, updatedAtLt: Nullable<Date>? = nil, updatedAtGe: Nullable<Date>? = nil, updatedAtLe: Nullable<Date>? = nil, requestOptions: RequestOptions? = nil) async throws -> CallPaginatedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/call",
            queryParams: [
                "assistantOverrides": assistantOverrides?.wrappedValue.map { .unknown($0) }, 
                "customer": customer?.wrappedValue.map { .unknown($0) }, 
                "assistantId": assistantId?.wrappedValue.map { .string($0) }, 
                "assistantName": assistantName?.wrappedValue.map { .string($0) }, 
                "id": id?.wrappedValue.map { .string($0) }, 
                "idAny": idAny?.wrappedValue.map { .string($0) }, 
                "costLe": costLe?.wrappedValue.map { .double($0) }, 
                "costGe": costGe?.wrappedValue.map { .double($0) }, 
                "cost": cost?.wrappedValue.map { .double($0) }, 
                "successEvaluation": successEvaluation?.wrappedValue.map { .string($0) }, 
                "endedReason": endedReason?.wrappedValue.map { .string($0) }, 
                "phoneNumberId": phoneNumberId?.wrappedValue.map { .string($0) }, 
                "structuredOutputs": structuredOutputs?.wrappedValue.map { .unknown($0) }, 
                "page": page?.wrappedValue.map { .double($0) }, 
                "sortOrder": sortOrder?.wrappedValue.map { .string($0) }, 
                "limit": limit?.wrappedValue.map { .double($0) }, 
                "createdAtGt": createdAtGt?.wrappedValue.map { .date($0) }, 
                "createdAtLt": createdAtLt?.wrappedValue.map { .date($0) }, 
                "createdAtGe": createdAtGe?.wrappedValue.map { .date($0) }, 
                "createdAtLe": createdAtLe?.wrappedValue.map { .date($0) }, 
                "updatedAtGt": updatedAtGt?.wrappedValue.map { .date($0) }, 
                "updatedAtLt": updatedAtLt?.wrappedValue.map { .date($0) }, 
                "updatedAtGe": updatedAtGe?.wrappedValue.map { .date($0) }, 
                "updatedAtLe": updatedAtLe?.wrappedValue.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: CallPaginatedResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .get,
            path: "/call/\(id)",
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }

    public func delete(id: String, request: Requests.DeleteCallDto, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/call/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }

    public func update(id: String, request: Requests.UpdateCallDto, requestOptions: RequestOptions? = nil) async throws -> Call {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/call/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Call.self
        )
    }
}