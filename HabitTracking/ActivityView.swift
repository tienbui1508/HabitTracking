//
//  ActivityView.swift
//  HabitTracking
//
//  Created by Tien Bui on 11/6/2023.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Activities
    var activity: Activity
    
    var body: some View {
        List {
            Section {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                }
            }
            
            Section {
                Text("Streak: ^[\(activity.streak) day](inflect: true)")
                
                Button("Mark completed") {
                    var newActivity = activity
                    newActivity.streak += 1
                    
                    if let index = data.activities.firstIndex(of: activity) {
                        data.activities[index] = newActivity
                    }
                }
            }
        }
        .navigationTitle(activity.name)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity.example)
    }
}
