//
//  recordViewModel.swift
//  Orato
//
//  Created by maple on 9/15/25.
//

import SwiftUI
import Alamofire

struct VodResponse :Decodable{}

@MainActor
class RecordViewModel : ObservableObject{
    @Published var array : [RecordModel] = [
        
    ]
    
    func getlist() async{
        do{
            let lst = try await NetworkRunner.share.request("records",method: .get, response: RecordResponse.self)
            array = lst.records
            print("됨")
            
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func deletelist(id : String) async {
        do {
            let result = try await NetworkRunner.share.request("/", method: .delete, parameters: ["id" : id])
        } catch {
            
        }
    }
}
