//
//  AddActivityView.swift
//  HabitTracking
//
//  Created by Tien Bui on 11/6/2023.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var data: Activities
    @State private var name = ""
    @State private var desciption = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $desciption)
            }
            .navigationTitle("Add habit")
            .toolbar {
                Button("Save") {
                    let trimmedName = name.trimmingCharacters(in: .whitespaces)
                    guard trimmedName.isEmpty == false else { return }
                    
                    let activity = Activity(name: trimmedName, description: desciption)
                    data.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(data: Activities())
    }
}
