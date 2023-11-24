//
//  EditScreenViewController.swift
//  MovieDataBase MdevData
//
//  Created by NewGroup4 on 2023-11-23.
//

import UIKit
import CoreData

class AddMovieController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var studioTextField: UITextField!
    @IBOutlet weak var genresTextField: UITextField!
    @IBOutlet weak var directorsTextField: UITextField!
    @IBOutlet weak var writersTextField: UITextField!
    @IBOutlet weak var actorsTextField: UITextField!
    @IBOutlet weak var lenghtTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var criticsRatingTextField: UITextField!
    @IBOutlet weak var mpaRatingTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    let context = AppDelegate.shared.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addMovieButtonPressed(_ sender: UIButton) {
             if let entity = NSEntityDescription.entity(forEntityName: "Movies", in: context),
                let newMovie = NSManagedObject(entity: entity, insertInto: context) as? Movies {

                 newMovie.title = titleTextField.text
                 newMovie.studio = studioTextField.text
                 newMovie.genres = genresTextField.text
                 newMovie.directors = directorsTextField.text
                 newMovie.writers = writersTextField.text
                 newMovie.actors = actorsTextField.text
                 newMovie.movieDescription = descriptionTextView.text

                 if let criticsRatingText = criticsRatingTextField.text, let criticsRating = Double(criticsRatingText) {
                     newMovie.criticsRating = criticsRating
                 }

                 if let lengthText = lenghtTextField.text, let length = Int16(lengthText) {
                     newMovie.length = length
                 }
                 
                 newMovie.mpaRating = mpaRatingTextField.text
                 
                 if let yeartText = yearTextField.text, let year = Int16(yeartText) {
                     newMovie.year = year
                 }

                 AppDelegate.shared.saveContext()
             }
        
          navigationController?.popViewController(animated: true)
         }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    }
    


