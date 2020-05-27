//
//  ContentView.swift
//  ChallengeDay19
//
//  Created by KazukiNakano on 2020/05/27.
//  Copyright © 2020 kazu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputWeight = ""
    @State private var selection = 0
    private let unit = ["kg", "metric ton"]
    private let unitMagnification = [1_000, 1_000_000]
    
    var calculationWeight: Double {
        let weight = Double(inputWeight) ?? 0
        let magnification = Double(unitMagnification[selection])
        let result = weight / magnification
        
        return result
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("変換したい重量を入力してください")) {
                    TextField("グラム", text: $inputWeight)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("変換したい単位を選択してください")) {
                    Picker(selection: $selection, label: Text("単位")) {
                        ForEach(0 ..< unit.count) {
                            Text(self.unit[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("変換後の値")) {
                    Text("\(calculationWeight) \(unit[selection])")
                }
            }
            .navigationBarTitle("重量変換")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
