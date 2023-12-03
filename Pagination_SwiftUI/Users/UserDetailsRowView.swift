//
//  UserDetailsRowView.swift
//  Pagination_SwiftUI
//
//  Created by mahesh gaykar on 03/12/23.
//

import SwiftUI

struct UserDetailsRowView: View {
    
    var user: User?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                AsyncImage(url: URL(string:"\(user?.profilePicture ?? "")")) { img in
                    img
                        .resizable()
                        .cornerRadius(25)
                        .frame(width: 100, height: 100, alignment:  .center)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100, alignment:  .center)
                
                VStack(alignment: .leading) {
                    Text("\(user?.id ?? 0) \(user?.firstName ?? "") \(user?.lastName ?? "")")
                        .font(.title3)
                        .bold()
                    Text(user?.job ?? "" )
                        .font(.headline)
                    Text(user?.country ?? "")
                        .font(.body)
                    Spacer()
                }
                .padding(.leading, 10)
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
        .frame(height: 100)
    }
}

struct UserDetailsRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsRowView(user: nil)
    }
}
