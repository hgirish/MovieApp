using MovieApp.Shared.Models;

namespace MovieApp.Server.Interfaces
{
    public interface IMovie
    {
        Task<List<Genre>> GetGenre();
    }
}
