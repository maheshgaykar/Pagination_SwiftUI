//
//  UsersViewModel.swift
//  Pagination_SwiftUI
//
//  Created by mahesh gaykar on 03/12/23.
//

import Foundation

class UserViewModel: ObservableObject {
    
    var totalUser = 0
    var limit = 20
    var offset = 0
    
    var user : Users?
    @Published var users : [User] = []
    
    func getUserAPI(offset: Int, limit: Int) async {
        do {
            self.user = try await NetworkManager.fetchUsersWithAsyncURLSession(offset: offset, limit: limit)
            DispatchQueue.main.async {
                self.users += self.user?.users as? [User] ?? []
                self.totalUser = self.user?.totalUsers ?? 0
            }
        }catch {
            print("API Failed")
        }
    }
    
    func loadMoreContent(currentItem item: User, users: [User]) async {
        let thresholdIndex = users.index(users.endIndex, offsetBy: -1)
         if thresholdIndex == item.id, (self.offset + 20) <= self.totalUser {
             self.offset += 20
             await self.getUserAPI(offset: self.offset, limit: self.limit)
        }
    }
}
