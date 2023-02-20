using TekusAppBackend.Contexts;
using Microsoft.EntityFrameworkCore;
using TekusAppBackend.Service;
using Microsoft.AspNetCore.Authentication;
using TekusAppBackend.Security;

var builder = WebApplication.CreateBuilder(args);

// Cors para hacer las consultas en angular
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(
        policy =>
        {
            policy.WithOrigins("http://localhost:4200")
            .WithMethods("PUT", "DELETE", "GET", "POST")
            .AllowAnyHeader();
        });
});

// Iniciar conexión a mi base de datos
builder.Services.AddDbContext<ConnectionSQLServer>(
    options =>
    {
        options.UseSqlServer(builder.Configuration.GetConnectionString("ConnectionSQLServer"));
    });

builder.Services.AddDbContext<ConnectionSQLServer>(options => options.UseSqlServer());

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddAuthentication("BasicAuthentication")
    .AddScheme<AuthenticationSchemeOptions, BasicAuthHandler>("BasicAuthentication", null);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();
