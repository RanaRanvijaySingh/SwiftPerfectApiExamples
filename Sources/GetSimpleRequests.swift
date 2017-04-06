//
//  GetRequests.swift
//  MyFirstPerfectProject
//
//  Created by Rana Ranvijay SIngh on 06/04/17.
//
//

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
            response.setHeader(.contentType, value: Constants.ContentTypes.TEXT_HTML)
            response.appendBody(string: DummyJsonData.SIMPLE_JSON_DATA)
            response.completed()
        })
        return routes
    }
}
