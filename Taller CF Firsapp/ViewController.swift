//
//  ViewController.swift
//  Taller CF Firsapp
//
//  Created by Luis Enrique Hernandez Celaya on 24/05/17.
//  Copyright © 2017 CódigoFacilito. All rights reserved.
//  @petrizcelaya

import UIKit

class ViewController: UIViewController {
    // vínculo de elementos de la vista
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var intentosLbl: UILabel!
    @IBOutlet weak var mensajeLbl: UILabel!
    var random = ""
    var intentos = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //función Alerta
    func showAlert(){
        let alert = UIAlertController(title: nil, message: "Intenta de Nuevo", preferredStyle: .alert)
        let playAgain = UIAlertAction(title: "Juega de Nuevo", style: .default) { (UIAlertAction) in
            self.setValues()
        }
        alert.addAction(playAgain)
        self.present(alert, animated: true, completion: nil)
    }
    //resetear valores
    func setValues(){
        random = String(arc4random_uniform(10))
        print(random)
        intentos = 5
        intentosLbl.text = String(intentos)
        numberText.text = ""
        mensajeLbl.text = "Ingresa un Número del 0 - 9 "
        self.view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    //Validar los datos
    @IBAction func validarBtn(_ sender: UIButton) {
        if numberText.text == random{
            mensajeLbl.text = "Felicidades Ganaste"
            self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            showAlert()
        }else{
            mensajeLbl.text = "Fallaste intenta de nuevo"
            if intentos == 1{
                self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
                showAlert()
            }else{
                intentos -= 1
                intentosLbl.text = String(intentos)
                mensajeLbl.text = "Intenta de Nuevo"
                numberText.text = ""
            }
            
        }
    }


}

