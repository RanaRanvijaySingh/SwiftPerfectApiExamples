import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

public class GetSimpleRequests {

    public static func simpleGetRequest() -> Routes {
        var routes = Routes()
        routes.add(method: .get, uri: Constants.Apis.SIMPLE_GET_REQUEST,
                   handler: {
            request, response in
            response.setHeader(.contentType,
                                value: Constants.ContentTypes.TEXT_HTML)
            response.appendBody(string: DummyJsonData.SIMPLE_JSON_DATA)
            response.completed()
        })
        return routes
    }

    public static func getRequestWithParam() -> Routes {
      var routes = Routes()
      routes.add(method: .get, uri: Constants.Apis.GET_REQUEST_WITH_PARAMS,
      handler: {
        request, response in
          response.setHeader(.contentType, value: Constants
          .ContentTypes.TEXT_HTML)
          let stringValue: String = GetSimpleRequests.requestWithParam(request: request);
          response.appendBody(string: stringValue)
          response.completed()
        })
        return routes;
    }

    private static func requestWithParam(request: HTTPRequest) -> String {
      let queryParam = request.queryParams
      var query: String = ""
      for (_, value) in queryParam {
          query.append("\(value) ");
      }
      return query
    }
}
