//
//  ValidatingFormsView.swift
//  CupcakeCorner
//
//  Created by Nick Semin on 07.06.2022.
//

import SwiftUI

struct ValidatingFormsView: View {
    @State private var username = ""
    @State private var email  = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account")
                }
                .disabled(disabledForm)
            }
        }
    }
    
    var disabledForm: Bool {
        username.isEmpty || email.count < 5
    }
}

struct ValidatingFormsView_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingFormsView()
    }
}
