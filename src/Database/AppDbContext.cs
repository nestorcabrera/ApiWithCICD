using ApiWithCICD.src.Entity;
using Microsoft.EntityFrameworkCore;

namespace ApiWithCICD.src.Database;

public class AppDbContext : DbContext
{
    public DbSet<Employee> Employees { get; set; }
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    { }
}