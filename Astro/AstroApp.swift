//
//  AstroApp.swift
//  Astro
//
//  Created by Rio Jonathan on 26/04/24.
//

import SwiftUI
import SwiftData

@main
struct AstroApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Questions.self])
        let config = ModelConfiguration()
        
        do {
            return try ModelContainer(for: schema, configurations: config)
        }
        catch{
            fatalError("Could not create ModelContainer; \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(sharedModelContainer)
        }
        
    }
}
