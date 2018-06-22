
import Foundation
import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, HomeViewProtocol {
  
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabControll: UISegmentedControl!
    
    var window: UIWindow?
    var searchActive : Bool = false
    var filtered:[String] = []

    var viewModel: HomeViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        hideKeyboardWhenTappedAround()
        customizeSearchBar()
        searchBar.returnKeyType = UIReturnKeyType.done
        
        let homeViewProtocol = self
        viewModel = HomeViewModel(output: homeViewProtocol)
        
        viewModel?.getMoviesTopList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        if (viewModel?.movies.isEmpty == false && (viewModel?.isMovieSelected)! == true) && (searchActive == false) {
            cell.showMovieData(data: (viewModel?.movies[indexPath.row])!, position: indexPath.row)
        }
        
        else if (viewModel?.tvShows.isEmpty == false && (viewModel?.isMovieSelected)! == false && (searchActive == false)){
            cell.showTvShowData(data: (viewModel?.tvShows[indexPath.row])!, position: indexPath.row)
        }
        
        else if (viewModel?.searchResultMovies.isEmpty == false && (viewModel?.isMovieSelected)! == true && (searchActive == true)){
            cell.showMovieData(data: (viewModel?.searchResultMovies[indexPath.row])!, position: indexPath.row)
        }
            
        else if (viewModel?.searchResultTvShows.isEmpty == false && (viewModel?.isMovieSelected)! == false && (searchActive == true) ){
            cell.showTvShowData(data: (viewModel?.searchResultTvShows[indexPath.row])!, position: indexPath.row)
        }
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.listSize)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Details", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsStoryboard") as! DetailsViewController
        
        if ((viewModel?.isMovieSelected)! == true) {
            viewModel?.valueToPass = (viewModel?.movies[indexPath.row].id)!
             newViewController.isMovieSelected = true
        }
        else if ((viewModel?.isMovieSelected)! == false) {
            viewModel?.valueToPass  = (viewModel?.tvShows[indexPath.row].id)!
            newViewController.isMovieSelected = false
        }
        newViewController.id = (viewModel?.valueToPass)!
        
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func customizeSearchBar(){
        self.searchBar.barTintColor = UIColor.white
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       // tableView. = filtered.filter({$0.lowercased().contains(searchBar.text.lowercased())})
        
        
        
        //searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //searchActive = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        resetSearchResult()
    }
    
    func resetSearchResult(){
        if (viewModel?.isMovieSelected == true){
            viewModel?.listSize = (viewModel?.movies.count)!
            showMovieData(movies: (viewModel?.movies)!)
        }
        else if (viewModel?.isMovieSelected == false){
            viewModel?.listSize = (viewModel?.tvShows.count)!
            showTVShowData(tvShows: (viewModel?.tvShows)!)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //searchActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if ((searchBar.text?.count)! > 2) {
            searchActive = true
            if (viewModel?.isMovieSelected == true){
                viewModel?.searchMovies(query: searchBar.text!)
            }
            else if (viewModel?.isMovieSelected == false){
                viewModel?.searchTvShows(query: searchBar.text!)
            }
        }
        
        if (searchBar.text?.isEmpty)!{
            resetSearchResult()
            searchActive = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // movie
    func showMovieData(movies: Array<ApiMovies>) {
        tableView.reloadData()
    }
    
    func showMoviesSearchResult(movies: Array<ApiMovies>) {
        tableView.reloadData()
    }
    
    // tv shows
    func showTvShowSearchResult(tvShows: Array<ApiTVShows>) {
        tableView.reloadData()
    }
    
    func showTVShowData(tvShows: Array<ApiTVShows>) {
         tableView.reloadData()
    }
    
    func failedToShowData(error: String) {
        Alert.init().show("Whoops", message: "Something went wrong! ", buttonText: "Ok", viewController: self)
    }
    
    
    @IBAction func tabChanged(_ sender: Any) {
        switch tabControll.selectedSegmentIndex {
        case 0:
            searchBar.text = ""
            searchActive = false
            viewModel?.isMovieSelected = true
            viewModel?.getMoviesTopList()
        case 1:
            searchBar.text = ""
            searchActive = false
            viewModel?.isMovieSelected = false
            viewModel?.getTVShowTopList()
        default:
            break
        }
    }
}
