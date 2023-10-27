//
//  ViewController.swift
//  Currencyconverter
//
//  Created by ömer  faruk sezer on 25.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadlabel: UILabel!
    @IBOutlet weak var chflabel: UILabel!
    @IBOutlet weak var gbplabel: UILabel!
    @IBOutlet weak var jpylabel: UILabel!
    @IBOutlet weak var usdlabel: UILabel!
    @IBOutlet weak var trylabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getratesclicked(_ sender: Any) {
        
        //1)reguest & session
        //2)response & Data
        //3)Parsing & json serialization
        
        
        //1
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=a134b671ff26b8b1d8d3c9f4d498ac5f")
        let session = URLSession.shared
        
        //closure
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                let alert = UIAlertController(title: "error", message:error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                //2
                if data != nil {
                    do{
                        let jsonresponse = try JSONSerialization.jsonObject(with:data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary  <String, Any>
                        
                        
                        //ASYNC
                        
                        
                        
                        DispatchQueue.main.async {
                            
                            if let rates = jsonresponse["rates"] as? [String : Any ]{
                                print(rates)
                                
                                if let cad = rates["CAD"] as? Double{
                                    self.cadlabel.text = "CAD:\(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chflabel.text = "CHF:\(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.gbplabel.text = "GBP:\(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.jpylabel.text = "JPY:\(jpy)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.usdlabel.text = "USD:\(usd)"
                                }
                                if let Try = rates["TRY"] as? Double{
                                    self.trylabel.text = "TRY:\(Try)"
                                }
                                if let eur = rates["EUR"] as? Double{
                                    self.aznlabel.text = "EUR:\(eur)"
                                }
                              
                                
                              
                            }
                        }
                    }catch{
                        print("error")
                    }
                    
                }
            }
        }
        
        task.resume()
    }
    

}

