//
//  UsersView.swift
//  Pagination_SwiftUI
//
//  Created by mahesh gaykar on 03/12/23.
//

import SwiftUI

struct UsersView: View {
    
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView(.vertical){
                ForEach(userViewModel.users, id: \.id) { userData in
                    UserDetailsRowView(user: userData)
                        .onAppear(){
                            Task{
                                await userViewModel.loadMoreContent(currentItem: userData, users: userViewModel.users as? [User] ?? [])
                            }
                        }
                }
            }
        }
        .onAppear(){
            Task {
                await self.getUsers()
            }
        }
        .frame(maxWidth: .infinity)
        Spacer()
    }
}

extension UsersView {
    func getUsers() async {
        do {
            try await userViewModel.getUserAPI(offset: userViewModel.offset, limit: userViewModel.limit)
        }catch {}
        
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
