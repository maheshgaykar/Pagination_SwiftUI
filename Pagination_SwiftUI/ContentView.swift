//
//  ContentView.swift
//  Pagination_SwiftUI
//
//  Created by mahesh gaykar on 03/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var userIsActive: Bool = false
    
    var body: some View {
        NavigationView(){
            VStack {
                Button {
                    print("button pagination pressed.")
                    self.userIsActive = true
                } label: {
                    Text("Users")
                        .frame(height: 45.0, alignment:  .center)
                }
                NavigationLink(destination: UsersView(), isActive: $userIsActive){
                    EmptyView()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
