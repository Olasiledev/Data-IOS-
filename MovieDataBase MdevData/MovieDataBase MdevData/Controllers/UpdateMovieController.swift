//
//  AddViewController.swift
//  MovieDataBase MdevData
//
//  Created by New Group4 on 2023-11-24.
//

import UIKit

class UpdateMovieController: UIViewController {

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
    
    var selectedMovieCell: Movies?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = selectedMovieCell {
                  titleTextField.text = movie.title
                  studioTextField.text = movie.studio
                  genresTextField.text = movie.genres
                  directorsTextField.text = movie.directors
                  writersTextField.text = movie.writers
                  actorsTextField.text = movie.actors
                  lenghtTextField.text = String(movie.length)
                  yearTextField.text = String(movie.year)
                  criticsRatingTextField.text = String(movie.criticsRating)
                  mpaRatingTextField.text = movie.mpaRating
                  descriptionTextView.text = movie.movieDescription
              }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
        guard let selectedMovie = selectedMovieCell else {return}
        selectedMovie.title = titleTextField.text
        selectedMovie.studio = studioTextField.text
        selectedMovie.genres = genresTextField.text
        selectedMovie.directors = directorsTextField.text
        selectedMovie.writers = writersTextField.text
        selectedMovie.actors = actorsTextField.text
        selectedMovie.length = Int16(lenghtTextField.text ?? "") ?? 0
        selectedMovie.year = Int16(yearTextField.text ?? "") ?? 0
        selectedMovie.criticsRating = Double(criticsRatingTextField.text ?? "") ?? 0.0
        selectedMovie.mpaRating = mpaRatingTextField.text
        selectedMovie.movieDescription = descriptionTextView.text
        
        AppDelegate.shared.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
