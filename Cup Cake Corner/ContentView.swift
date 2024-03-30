//
//  ContentView.swift
//  Cup Cake Corner
//
//  Created by Mayank Atri on 25/03/24.
//

import SwiftUI


//MARK: Classes


struct ContentView: View {
    // MARK: Varible Declarations
   @State private var order = Order()
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Please select your order" ,selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                        Stepper("Number of cakes: \(order.quantity)",value: $order.quantity, in:3...20)
                    }
                }
                Section{
                    Toggle("Any Special Requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkels" , isOn: $order.addSprinkles)
                    }
                }
                Section{
                    NavigationLink("Deivery Details") {
                        AdderssView(order: order)
                    }
                }
            }.navigationTitle("Cupcake Corner")
        }
    }
   
}

#Preview {
    ContentView()
}

