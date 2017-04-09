import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

public class FileUploadRequest {

  public static func uploadFileRequest() -> Routes {
    var routes = Routes()
    routes.add(
      method: .post,
      uri: Constants.Apis.UPLOAD_FILE,
      handler: FileUploadRequest.handler
    )
    return routes
  }

  private static let handler = {
      (request: HTTPRequest, response: HTTPResponse) in
        if let uploads = request.postFileUploads, uploads.count > 0 {

          //Create a directory for saving this file
          let fileDir = Dir(Dir.workingDir.path + "swift_upload_dir")
          do {
            try fileDir.create()
          }catch {
            print(error)
          }

          // Create an array of dictionaries which will show what was uploaded
          var ary = [[String:Any]]()
          for upload in uploads {
            ary.append([
            "fieldName": upload.fieldName,
            "contentType": upload.contentType,
            "fileName": upload.fileName,
            "fileSize": upload.fileSize,
            "tmpFileName": upload.tmpFileName
            ])
            // move file
            let thisFile = File(upload.tmpFileName)
            do {
              let filePath = fileDir.path + upload.fileName
              let _ = try thisFile.moveTo(path: filePath, overWrite: true)
            } catch {
              print(error)
            }
          }
          var values: [String: Any] = [String: Any]()
          values["files"] = ary
          values["count"] = ary.count
        }
        response.setHeader(.contentType,
        value: Constants.ContentTypes.TEXT_HTML)
        response.appendBody(string: "File Uploaded")
        response.completed()
      }


      /*
        private static func handler(request: HTTPRequest, response: HTTPResponse) {
            if let uploads = request.postFileUploads, uploads.count > 0 {
              // Create an array of dictionaries which will show what was uploaded
              var ary = [[String:Any]]()
              for upload in uploads {
                ary.append([
                "fieldName": upload.fieldName,
                "contentType": upload.contentType,
                "fileName": upload.fileName,
                "fileSize": upload.fileSize,
                "tmpFileName": upload.tmpFileName
                ])
              }
              var values: [String: Any] = [String: Any]()
              values["files"] = ary
              values["count"] = ary.count
            }
          }*/
}
