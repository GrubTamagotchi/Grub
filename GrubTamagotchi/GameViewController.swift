//
//  GameViewController.swift
//  GrubTamagotchi
//
//  Created by user204206 on 11/14/21.
//

import UIKit
import Parse

class GameViewController: UIViewController {

    
    let imageArr = ["MainView","EatView","GladView","HappyView","SleepView","PetView","SadView"]
    var index = 0
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var grubNameField: UITextField!
    
    @IBAction func onFeed(_ sender: Any) {
        
        self.imageView.image = UIImage(named:"EatView")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.imageView.image = UIImage(named:"GladView")
        }
        
    }
    
    @IBAction func onGrubName(_ sender: Any) {
        
        let pets = PFObject(className: "Pets")
        pets["pet_name"] = grubNameField.text!
        pets["score"] = 0
        
        pets.saveInBackground{(success, error) in
            if success{
                print("Save")
            } else {
                print("Not Save")
            }
        }

    }
    
    

    @IBAction func onSleep(_ sender: Any) {
        
        self.imageView.image = UIImage(named:"SleepView")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.imageView.image = UIImage(named:"GladView")
        }
        
    }
    
    
    @IBAction func onPet(_ sender: Any) {
        
        self.imageView.image = UIImage(named:"PetView")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.imageView.image = UIImage(named:"GladView")
        }
    }
    
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = loginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        grubNameField.delegate = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GameViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        grubNameField.resignFirstResponder()
        return true
    }
}
