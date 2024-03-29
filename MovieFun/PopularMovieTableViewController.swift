import UIKit

class PopularMovieTableViewController: UITableViewController {
    var movies = [movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "最受歡迎"
        if let urlStr = "https://api.themoviedb.org/3/movie/popular?api_key=6ac4780523b1635d3bf190ca8b4658ce&language=zh-TW&page=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            //weak var weakSelf = self
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                if let data = data, let MovieResults = try?
                    decoder.decode(movieResults.self, from: data)
                {
                    
                    for Movie in MovieResults.results {
                        self.movies.append(movie(id:Movie.id, title:Movie.title,poster_path: Movie.poster_path, backdrop_path: Movie.backdrop_path, vote_average: Movie.vote_average, vote_count: Movie.vote_count, release_date: Movie.release_date, overview: Movie.overview, genres_ids: Movie.genres_ids))
                        //print(self.movies)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    
                    print("error")
                    
                }
            }
            //print(self.movies)
            task.resume()
        }
        if let urlStr = "https://api.themoviedb.org/3/movie/popular?api_key=6ac4780523b1635d3bf190ca8b4658ce&language=zh-TW&page=2".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
            //weak var weakSelf = self
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                
                let decoder = JSONDecoder()
                
                decoder.dateDecodingStrategy = .iso8601
                
                if let data = data, let MovieResults = try?
                    decoder.decode(movieResults.self, from: data)
                {
                    
                    for Movie in MovieResults.results {
                        self.movies.append(movie(id:Movie.id, title:Movie.title,poster_path: Movie.poster_path, backdrop_path: Movie.backdrop_path, vote_average: Movie.vote_average, vote_count: Movie.vote_count, release_date: Movie.release_date, overview: Movie.overview, genres_ids: Movie.genres_ids))
                        //print(self.movies)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } else {
                    
                    print("error")
                    
                }
            }
            //print(self.movies)
            task.resume()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "popularCell", for: indexPath) as! PopularMovieTableViewCell
        
        var movie = self.movies[indexPath.row]
        cell.titleLabel.text = movie.title
        //cell.releaseDateLabel.text = "\(movie.release_date)"
        if(movie.poster_path != nil){
            let url = URL(string: "https://image.tmdb.org/t/p/w300"+movie.poster_path!)
            let data = try! Data(contentsOf: url!)
            let newImage = UIImage(data: data)
            cell.overviewLabel.text = movie.overview
            cell.posterImage.image = newImage
            cell.rateLabel.layer.masksToBounds = true
            cell.rateLabel.layer.cornerRadius = 10
            cell.rateLabel.text = movie.vote_average?.description
        }
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let controller = segue.destination as? MovieDetailViewController
        if let row = tableView.indexPathForSelectedRow?.row {
            controller?.movie = movies[row]
        }
    }
    
}
