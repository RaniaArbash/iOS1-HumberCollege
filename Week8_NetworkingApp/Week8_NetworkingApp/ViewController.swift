//
//  ViewController.swift
//  Week8_NetworkingApp
//
//  Created by Rania Arbash on 2024-11-01.
//

import UIKit

class ViewController: UIViewController, NetworkingDelegate {
   
    var courseIndex = 0
    var stdInfo = StudentInfo()
    @IBOutlet weak var courseCounter: UILabel!
    
    @IBOutlet weak var stdName: UILabel!
    
    
    @IBOutlet weak var numOfCourses: UILabel!

    @IBOutlet weak var courseImage: UIImageView!
    
    
    @IBOutlet weak var courseTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingManager.shared.delegate = self
        NetworkingManager.shared.getStdDataFromAPI()
        
        // Do any additional setup after loading the view.
    }

    func networkingDidFinishWithStudentInfo(stdinfo: StudentInfo) {
        // this function is updating the UI from Background thread
        
        DispatchQueue.main.async {
            // I am back to main thread here
            self.stdInfo = stdinfo
            self.stdName.text = stdinfo.student
            self.numOfCourses.text = "\(stdinfo.count) Courses"
            if (stdinfo.data.count > 0){
                self.courseIndex = 0
                self.updateCourseUI()
            }
        }
        
    }
    
    
    func updateCourseUI(){
        
        if courseIndex >= stdInfo.data.count {
            courseIndex = 0
        }else if courseIndex < 0 {
            courseIndex = stdInfo.data.count - 1
        }
            // download the image --> in backgroud thread
            downloadImage(url: stdInfo.data[courseIndex].image)
            courseTitle.text = "\( stdInfo.data[courseIndex].courseCode) \(stdInfo.data[courseIndex].courseName)"
            
            courseCounter.text = "\(courseIndex + 1) \\ \(stdInfo.count )"
    }
        
    
func downloadImage( url: String){
    let myQ = DispatchQueue(label: "myThread")
    myQ.async {// any code here will run in background thread
        
        do {
            let imageData = try Data(contentsOf: URL(string: url)!)
        
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
            
        }catch {
            
        }
    }
}
    
    func networkingDidFail() {
        print("No student Info")
    }
    
    
    @IBAction func nextCourseClicked(_ sender: Any) {
        courseIndex += 1
        updateCourseUI()
    }
    
    
    @IBAction func prevCourseClicked(_ sender: Any) {
        courseIndex -= 1
        updateCourseUI()
        
    }
    
    
}

