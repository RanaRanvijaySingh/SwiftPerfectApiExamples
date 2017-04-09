import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()

server.addRoutes(GetSimpleRequests.simpleGetRequest())
server.addRoutes(GetSimpleRequests.getRequestWithParam())
server.addRoutes(PostRequests.simplePostRequest())
server.addRoutes(FileUploadRequest.uploadFileRequest())

server.serverPort = 8181
do {
    // Launch the HTTP server.
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
