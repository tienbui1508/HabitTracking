//
//  ContentView.swift
//  HabitTracking
//
//  Created by Tien Bui on 11/6/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.activities, id: \.id) { activity in
                    NavigationLink {
                        ActivityView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.name)
                            
                            Spacer()
                            
                            Text(String(activity.streak))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: delete)
                
            }.navigationTitle("Habit Tracking")
                .toolbar {
                    EditButton()
                    Button {
                        addingNewActivity.toggle()
                    } label: {
                        Label("Adding new Activity", systemImage: "plus")
                    }
                    
                }
                .sheet(isPresented: $addingNewActivity) {
                    AddActivityView(data: data)
                }
        }
    }
    
    func delete(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
    
    func color(for activity: Activity) -> Color {
        if activity.streak < 3 {
            return .red
        } else if activity.streak < 10 {
            return .orange
        } else if activity.streak < 20 {
            return .green
        } else if activity.streak < 50 {
            return .blue
        } else {
            return .indigo
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
