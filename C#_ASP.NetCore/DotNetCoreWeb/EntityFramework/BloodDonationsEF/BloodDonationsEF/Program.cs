using BloodDonationsEF.DataBaseMan;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


//After adding the connection string to the appsettings.json
//We now register the DbContext as a service in the Program.cs class of the app. So we add the below given code line to it.
builder.Services.AddDbContext<DonationsAPIDbContext>(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("SQLConnection")));
//After all this we would do our first migration




var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
