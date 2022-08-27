using Microsoft.EntityFrameworkCore;
using MovieApp.Server.Interfaces;
using MovieApp.Server.Models;
using MovieApp.Shared.Models;

namespace MovieApp.Server.DataAccess
{
    public class MovieDataAccessLayer : IMovie
    {
        private readonly MovieDBContext _dbContext;

        public MovieDataAccessLayer(IDbContextFactory<MovieDBContext> dbContext)
        {
            _dbContext = dbContext.CreateDbContext();
        }

        public async Task AddMovie(Movie movie)
        {
            try
            {
                await _dbContext.Movies.AddAsync(movie);
                await _dbContext.SaveChangesAsync();
            }
            catch 
            {

                throw;
            }
        }

        public async Task<List<Genre>> GetGenre()
        {
            return await _dbContext.Genres.AsNoTracking().ToListAsync();
        }
    }
}
