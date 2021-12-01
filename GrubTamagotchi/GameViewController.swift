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
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var grubNameField: UITextField!
    
    
    let pets = PFObject(className: "Pets")
    
    
    
    @IBAction func onGrubName(_ sender: Any) {
    
        let usr = PFUser.current()
        usr!["petname"] = grubNameField.text
        usr?.saveInBackground()
        
    }
    
    func dbScore()
    {
        let usr = PFUser.current()
        usr!["score"] = Int(scoreLabel.text!)
        usr?.saveInBackground()
    }
        
    
    func scoreCalculated()
    {
        let str = scoreLabel.text
        let x = Int(str!)
        if(x!<100)
        {
        let num = Int.random(in: 0..<10)
        
        var score = x! + num
        if(score-100>0)
        {
         let dif = score-100
         score = score - dif
        }
        let str2 = String(score)
        
        scoreLabel.text = str2
        
        pets["score"] = score
        }
        dbScore()
    }
    
    func backgroundScore()
    {
        DispatchQueue.main.asyncAfter(deadline: .now()+20){
            let str = self.scoreLabel.text
            let x = Int(str!)
            if(x!>0)
            {
            let num = Int.random(in: 0..<10)
            
            var score = x! - num
            if(score<0)
            {
                score = 0
            }

            let str2 = String(score)
            
                self.scoreLabel.text = str2
                self.pets["score"] = score
                
            }
            self.imgChange()
        }
        dbScore()
    }
    
    func imgChange( )
    {
        let str = self.scoreLabel.text
        let score = Int(str!)
        
        if(score!<40)
        {
            self.imageView.image = UIImage(named:"SadView")
            
        }
        else if (score!>40&&score!<70)
        {
            self.imageView.image = UIImage(named:"MainView")
                                        
        }
        else{
            self.imageView.image = UIImage(named:"HappyView")
            
        }
        dbScore()
    }
    
    @IBAction func onFeed(_ sender: Any) {
        
        self.imageView.image = UIImage(named:"EatView")
        scoreCalculated()
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.imageView.image = UIImage(named:"GladView")
        }
    //    imgChange()
    }

    @IBAction func onSleep(_ sender: Any) {
        
        self.imageView.image = UIImage(named:"SleepView")
        scoreCalculated()
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.imageView.image = UIImage(named:"GladView")
        }
     //   imgChange()
        
    }
    
    
    @IBAction func onPet(_ sender: Any) {
        
        self.imageView.image = UIImage(named:"PetView")
        scoreCalculated()
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.imageView.image = UIImage(named:"GladView")
        }
       // imgChange()
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

        var timer = Timer()
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block:{
                _ in self.backgroundScore()
            })
        
        if let str = PFUser.current()!["petname"] as? String {
            grubNameField.text = str
            print(str)
        }
        if let str2 = PFUser.current()!["score"] as? Int {
            scoreLabel.text = String(str2)
            print(String(str2))
        }
        dbScore()
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
