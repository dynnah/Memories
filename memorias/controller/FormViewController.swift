//
//  FormViewController.swift
//  memorias
//
//  Created by IFPB on 06/12/2019.
//  Copyright © 2019 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var tfOpinar: UITextField!
    @IBOutlet weak var swGostou: UISwitch!
    @IBOutlet weak var tvComentario: UITextView!
    @IBOutlet weak var lbNota: UILabel!
    @IBOutlet weak var stNota: UIStepper!
    @IBOutlet weak var lbRecomendar: UILabel!
    @IBOutlet weak var slRecomendar: UISlider!
    var dao: MemoriaDAO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dao = MemoriaDAO()
    }
    
    
    @IBAction func Nota(_ sender: Any) {
        self.lbNota.text = String(Int(self.stNota.value))
    }
    
    @IBAction func Recomenda(_ sender: Any) {
        self.lbRecomendar.text = String(Int(self.slRecomendar.value))
    }
    
    @IBAction func salvar(_ sender: Any) {
        let assunto = self.tfOpinar.text
        let gostou = self.swGostou.isOn
        let comentarios = self.tvComentario.text
        let nota = Int(self.stNota.value)
        let recomendacao = Int(self.slRecomendar.value)
        
        
        if (self.dao.add(assunto: assunto!, gostou: gostou, comentarios: comentarios!, nota: nota, recomendacao: recomendacao)){
            let alert = UIAlertController(title: "Atencao", message: "Deu certo", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: {(UIAlertAction) in
                 self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Atencao", message: "Deu problema", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
