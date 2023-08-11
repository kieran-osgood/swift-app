//
// Created by Kieran Osgood on 14/11/2022.
//

import SwiftUI

struct ApiView: View {
	private let api = APIController()
	@State var idx: Int = 1
	@State var data: Todo?

	func getData() async throws {
		do {
			data = try await api.getData(idx: idx)
			idx += 1
		} catch {
			print("getData failed to fetch \(error)")
		}
	}

  var body: some View {
    VStack {
      Button(
        action: { Task { try await getData() } },
        label: {
          Text("Get Data")
        })

      Divider()
      Text("id: \(String(data?.id ?? 0))")
      Text("userId: \(String(data?.userId ?? 0))")

      Divider()
      Text("title: \(data?.title ?? "")")
      Text("completed: \(String(data?.completed ?? false))")
    }
  }
}

struct ApiView_Previews: PreviewProvider {
  static var previews: some View {
    ApiView(idx: 10)
  }
}
