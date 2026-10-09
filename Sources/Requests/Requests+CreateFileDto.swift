import Foundation

extension Requests {
    /// A file-upload request containing the file to store and process in Vapi.
    public struct CreateFileDto {
        /// The file to upload.
        public let file: FormFile
        /// Optional product flow that owns the uploaded file.
        public let purpose: CreateFilesRequestPurpose?
        /// Optional JSON-encoded metadata for multipart uploads.
        public let metadata: String?

        public init(
            file: FormFile,
            purpose: CreateFilesRequestPurpose? = nil,
            metadata: String? = nil
        ) {
            self.file = file
            self.purpose = purpose
            self.metadata = metadata
        }
    }
}

extension Requests.CreateFileDto: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        [
            .file(file, fieldName: "file"),
            .field(purpose, fieldName: "purpose"),
            .field(metadata, fieldName: "metadata")
        ]
    }
}