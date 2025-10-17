import Foundation

extension Requests {
    public struct CreateFileDto {
        /// This is the File you want to upload for use with the Knowledge Base.
        public let file: FormFile

        public init(
            file: FormFile
        ) {
            self.file = file
        }
    }
}

extension Requests.CreateFileDto: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        [
            .file(file, fieldName: "file")
        ]
    }
}