using MovieApp.Server.Interfaces;
using MovieApp.Shared.Models;

namespace MovieApp.Server.GraphQL;

public class MovieQueryResolver
{
    private readonly IMovie _movieService;

    public MovieQueryResolver(IMovie movieService)
    {
        _movieService = movieService;
    }
    [GraphQLDescription("Gets the list of generes")]
    public async Task<List<Genre>> GetGenreList()
    {
        return await _movieService.GetGenre();
    }
}
