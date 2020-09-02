//
//  ViewController.swift
//  GetRequest
//
//  Created by Teslenko Anastasiya on 21.08.2020.
//  Copyright © 2020 Liza Lipatova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func getTapped(_ sender: UIButton) {
        //Url is optional type and you need to guard it
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")else{ return }
        //create request for this url
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            //if something will  not work response tell us it is like status
            if let response = response{
                print(response)
            }
            //
            guard let data = data else {return}
            print (data)
            
            //import to Json
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch{
                print (error)
            }
            //
        }.resume()
    }
    
}

