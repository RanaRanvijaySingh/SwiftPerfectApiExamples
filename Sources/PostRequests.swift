import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

public class PostRequests {
  public static func simplePostRequest() -> Routes {
    var routes = Routes()
    routes.add(method: .post, uri: Constants.Apis.SIMPLE_POST_REQUEST,
    handler: {
      request, response in
      response.setHeader(.contentType,
      value: Constants.ContentTypes.TEXT_HTML)
      response.appendBody(string: PostRequests.getPostRequestData(request: request))
      response.completed()
    })
    return routes
  }

  private static func getPostRequestData(request: HTTPRequest) -> String {
    var response : String = Constants.StringValues.BLANK
    let postRequest = request.postParams
    for (_, value) in postRequest {
        response.append("\(value) ")
    }
    return response
  }
}
