//
//  MovieListViewController.swift
//  MovieDataBase MdevData
//
//  Created by NewGroup4 on 2023-11-23.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movies: [Movies] = []
    let movieDataManager = MovieDataManager()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movies = movieDataManager.fetchMoviesFromEntity()
        print("movies \(movies.count)")
        tableView.reloadData()
        let cellNib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomCell")
    }
    
}


extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let moviesToDisplay = movies[indexPath.row]
    
        cell.movieTitle.text = moviesToDisplay.title
        cell.criticsRating.text = String(format: "%.1f", moviesToDisplay.criticsRating)

            switch moviesToDisplay.criticsRating {
            case ..<7.0:
                cell.criticsRating.textColor = .red
            case 7.0..<8.0:
                cell.criticsRating.textColor = .orange
            default:
                cell.criticsRating.textColor = .green
            }
      
        let imageID = moviesToDisplay.movieID
        let imageName = "\(imageID).jpg"

        if let image = UIImage(named: imageName) {
            cell.movieImage.image = image
        } else {
            cell.movieImage.image = UIImage(named: "defualtImage")
        }
        cell.studioName.text = moviesToDisplay.studio
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "EditMovie") as? UpdateMovieController {
            destinationVC.selectedMovieCell = selectedMovie
            navigationController?.pushViewController(destinationVC, animated: true)
        } else {
            print("Failed.")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           deleteMovie(at: indexPath)
        }
    }
    
    func deleteMovie(at indexPath: IndexPath) {
        let context = AppDelegate.shared.persistentContainer.viewContext
        guard indexPath.row < movies.count else {return}
        let movieToDelete = movies[indexPath.row]
        movies.remove(at: indexPath.row)
        context.delete(movieToDelete)
        AppDelegate.shared.saveContext()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

