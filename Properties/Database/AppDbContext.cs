using ApiWithCICD.Properties.Entity;
using Microsoft.EntityFrameworkCore;

namespace ApiWithCICD.Properties.Database;

public class AppDbContext : DbContext
{
    public DbSet<Employee> Employees { get; set; }
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    { }
}