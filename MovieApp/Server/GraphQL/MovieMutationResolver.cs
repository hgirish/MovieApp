using MovieApp.Server.Interfaces;
using MovieApp.Shared.Models;

namespace MovieApp.Server.GraphQL;

public class MovieMutationResolver
{
    public record AddMoviePayload(Movie movie);

    private readonly IConfiguration _config;
    private readonly IMovie _movieService;
    private readonly IWebHostEnvironment _webHostEnvironment;
    private readonly string _posterFolderPath = string.Empty;
    public MovieMutationResolver(IConfiguration config, 
        IMovie movieService, 
        IWebHostEnvironment webHostEnvironment)
    {
        _config = config;
        _movieService = movieService;
        _webHostEnvironment = webHostEnvironment;
        _posterFolderPath = System.IO.Path.Combine(_webHostEnvironment.ContentRootPath, "Poster");
    }
    [GraphQLDescription("Add new movie data")]
    public AddMoviePayload AddMovie(Movie movie)
    {
        if (!string.IsNullOrEmpty(movie.PosterPath))
        {
            string fileName = Guid.NewGuid() + ".jpg";
            string fullPath = System.IO.Path.Combine(_posterFolderPath, fileName);
            byte[] imageBytes = Convert.FromBase64String(movie.PosterPath);
            File.WriteAllBytes(fullPath, imageBytes);
            movie.PosterPath = fileName;
        }
        else
        {
            movie.PosterPath = _config["DefaultPoster"];
        }
        _movieService.AddMovie(movie);
        return new AddMoviePayload(movie);
    }
}