//
//  Codable_.swift
//  SwiftUI_Elements_Templates
//
//  Created by PaulmaX on 10.03.23.
//

import SwiftUI

fileprivate struct Customer_Model: Identifiable, Codable {
    let id:     String
    let name:   String
    let points: Int
    let isPremium: Bool
    
    /**
     enum CodingKeys: String, CodingKey {
     case id, name, points, isPremium
     }
     
     // USE CODE USING STANDART INITIALIZER
     init(id: String, name: String, points: Int, isPremium: Bool) {
     self.id = id
     self.name = name
     self.points = points
     self.isPremium = isPremium
     }
     
     init(from decoder: Decoder) throws {
     let container   = try decoder.container(keyedBy: CodingKeys.self)
     self.id         = try container.decode(String.self, forKey: .id)
     self.name       = try container.decode(String.self, forKey: .name)
     self.points     = try container.decode(Int.self, forKey: .points)
     self.isPremium  = try container.decode(Bool.self, forKey: .isPremium)
     }
     
     func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
     try container.encode(id, forKey: .id)
     try container.encode(name, forKey: .name)
     try container.encode(points, forKey: .points)
     try container.encode(isPremium, forKey: .isPremium)
     }
     
     */
}

fileprivate class Codable_ViewModel: ObservableObject {
    
    @Published var customer: Customer_Model? = nil
    
    init() { getData() }
    
    private func getData() {
        do {
            // USE CODE USING JSONSerialization
            /**
             let localData = try JSONSerialization.jsonObject(with: data, options: [])
             if let dict = localData as? [String: Any],
             let id = dict["id"] as? String,
             let name = dict["name"] as? String,
             let points = dict["points"] as? Int,
             let isPremium = dict["isPremium"] as? Bool {
             
             let newCustomer = Customer_Model(
             id: id, name: name, points: points, isPremium: isPremium)
             customer = newCustomer
             } else {
             print("Data with No Data")
             }
             */
            let data = try getJSONData()
            customer = try JSONDecoder().decode(Customer_Model.self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func getJSONData() throws -> Data {
        do {
            /**
             GET JSON DATA FROM DICTIONARY OR GET FROM MODEL
             let jsonData = try JSONEncoder().encode(model)
             */
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            return jsonData
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}

struct Codable_: View {
    
    @StateObject private var vm = Codable_ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let customer = vm.customer {
                Text("ID: \(customer.id)")
                Text("NAME: \(customer.name)")
                Text("POINTS: \(customer.points)")
                Text("PREMIUM: " + customer.isPremium.description)
            } else {
                Text("NO DATA")
                    .font(.largeTitle)
            }
        }
    }
}

//FAKE DATA
fileprivate let dictionary: [String: Any] = ["id" : "AAA057129JG017",
                                             "name" : "PAULMAX",
                                             "points" : 100,
                                             "isPremium" : true
]

fileprivate let model = Customer_Model(id: "hasd7888asdn", name: "Amma", points: 79, isPremium: false)
