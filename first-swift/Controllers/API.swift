//
// Created by Kieran Osgood on 14/11/2022.
//

import Alamofire

struct Todo: Codable {
  var title: String
  var id: Int
  var completed: Bool
  var userId: Int
}
struct APIController {
    func getData(idx: Int) async throws -> Todo {
    let url = "https://jsonplaceholder.typicode.com/todos/\(idx)"

    let result = await AF.request(url, method: .get)
      .validate()
      .serializingDecodable(Todo.self).result
    switch result {
    case let .success(data):
      return data
    case let .failure(err):
      throw err
    }

  }

  //  func getData() async {
  //    var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
  //    request.httpMethod = "GET"
  //    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
  //
  //    let session = URLSession.shared
  //    let task = session.dataTask(
  //      with: request,
  //      completionHandler: { data, response, error -> Void in
  //        do {
  //	        guard let safeData = data else {
  //		        fatalError("guard failure handling has not been implemented")
  //	        }
  //	        let todos = try JSONDecoder().decode(Todo.self, from: safeData)
  //          print(todos)
  //
  //        } catch {
  //          print("error")
  //        }
  //      })
  //
  //    task.resume()
  //  }
}
