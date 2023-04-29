//
//  Update Some Packages View.swift
//  Cork
//
//  Created by David Bureš on 05.04.2023.
//

import SwiftUI

struct UpdateSomePackagesView: View {
    
    @EnvironmentObject var outdatedPackageTracker: OutdatedPackageTracker
    
    @Binding var isShowingSheet: Bool
    
    @State private var packageUpdatingStage: PackageUpdatingStage = .updating
    
    var selectedPackages: [OutdatedPackage] {
        return outdatedPackageTracker.outdatedPackages.filter({ $0.isMarkedForUpdating })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10)
        {
            Text("Would update:")
            ForEach(selectedPackages) { outdatedPackage in
                Text("\(outdatedPackage.package.name) - \(outdatedPackage.package.isCask ? "Cask" : "Formula")")
            }
        }
        .padding()
    }
}
