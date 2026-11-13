import Foundation

public final class KnowledgeBasesV2Client: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func knowledgeBaseV2ControllerFindAll(limit: Double? = nil, requestOptions: RequestOptions? = nil) async throws -> [KnowledgeBaseV2] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/knowledge-base",
            queryParams: [
                "limit": limit.map { .double($0) }
            ],
            requestOptions: requestOptions,
            responseType: [KnowledgeBaseV2].self
        )
    }

    public func knowledgeBaseV2ControllerCreate(request: Requests.CreateKnowledgeBaseV2Dto, requestOptions: RequestOptions? = nil) async throws -> KnowledgeBaseV2 {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2/knowledge-base",
            body: request,
            requestOptions: requestOptions,
            responseType: KnowledgeBaseV2.self
        )
    }

    public func knowledgeBaseV2ControllerFilesGet(id: String, requestOptions: RequestOptions? = nil) async throws -> [KnowledgeBaseV2File] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/knowledge-base/\(id)/file",
            requestOptions: requestOptions,
            responseType: [KnowledgeBaseV2File].self
        )
    }

    public func knowledgeBaseV2ControllerFileAttach(id: String, request: Requests.AttachKnowledgeBaseV2FileDto, requestOptions: RequestOptions? = nil) async throws -> KnowledgeBaseV2File {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2/knowledge-base/\(id)/file",
            body: request,
            requestOptions: requestOptions,
            responseType: KnowledgeBaseV2File.self
        )
    }

    public func knowledgeBaseV2ControllerFileDetach(id: String, fileId: String, requestOptions: RequestOptions? = nil) async throws -> KnowledgeBaseV2File {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v2/knowledge-base/\(id)/file/\(fileId)",
            requestOptions: requestOptions,
            responseType: KnowledgeBaseV2File.self
        )
    }

    public func knowledgeBaseV2ControllerFileRetry(id: String, fileId: String, requestOptions: RequestOptions? = nil) async throws -> KnowledgeBaseV2File {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2/knowledge-base/\(id)/file/\(fileId)/retry",
            requestOptions: requestOptions,
            responseType: KnowledgeBaseV2File.self
        )
    }

    public func knowledgeBaseV2ControllerFindOne(id: String, requestOptions: RequestOptions? = nil) async throws -> KnowledgeBaseV2WithFiles {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2/knowledge-base/\(id)",
            requestOptions: requestOptions,
            responseType: KnowledgeBaseV2WithFiles.self
        )
    }

    public func knowledgeBaseV2ControllerRemove(id: String, requestOptions: RequestOptions? = nil) async throws -> KnowledgeBaseV2 {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v2/knowledge-base/\(id)",
            requestOptions: requestOptions,
            responseType: KnowledgeBaseV2.self
        )
    }

    public func knowledgeBaseV2ControllerUpdate(id: String, request: Requests.UpdateKnowledgeBaseV2Dto, requestOptions: RequestOptions? = nil) async throws -> KnowledgeBaseV2 {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/v2/knowledge-base/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: KnowledgeBaseV2.self
        )
    }
}