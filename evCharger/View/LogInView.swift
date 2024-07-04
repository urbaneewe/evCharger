//
//  LogInView.swift
//  evCharger
//
//  Created by Mihajlo Saric on 4.7.24..
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Query var users: [User]

    @State private var email: String = ""
    @State private var name: String = ""

    @State private var path = NavigationPath()

    enum Destination: Hashable {
            case adminDashboard
            case otherView
        }

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Login") {
                    if let user = users.first(where: { $0.email == email && $0.name == name }) {
                        if user.isAdmin {
                            path.append(Destination.adminDashboard)
                        } else {
                            path.append(Destination.otherView)
                        }
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.blue)
                .cornerRadius(15.0)
            }
            .navigationTitle("Login")
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .adminDashboard:
                    AdminDashboardView()
                case .otherView:
                    SignUpView()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

