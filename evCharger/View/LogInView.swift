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
    @StateObject private var userSession = UserSession()

    @State private var path = NavigationPath()

    enum Destination: Hashable {
            case adminDashboard
            case mainDashboard
        }

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                TextField("Name", text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                    .keyboardType(.default)

                Button("Login") {
                    if let user = users.first(where: { $0.email == email && $0.name == name }) {
                        userSession.loggedInUser = user

                        if user.isAdmin {
                            path.append(Destination.adminDashboard)
                        } else {
                            path.append(Destination.mainDashboard)
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
            .padding()
            .navigationTitle("Login")
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .adminDashboard:
                    AdminDashboardView()
                case .mainDashboard:
                    MainDashboardView()
                        .environmentObject(userSession)
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

