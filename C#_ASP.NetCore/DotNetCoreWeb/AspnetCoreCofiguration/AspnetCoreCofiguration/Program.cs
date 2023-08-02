using AspnetCoreCofiguration.Middlewares;
using Configuation.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

//The builder.Services.AddSingleton<TotalUsers>() will add the service which can now be shared all thought the application. Next we will inject this service on the controller and show the total number of users on the browser.
builder.Services.AddSingleton<TotalUsers>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days.
    app.UseHsts();
}
 

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseMiddleware<RequestEditingMiddleware>();

app.UseMiddleware<ShortCircuitMiddleware>();

app.UseMiddleware<ContentMiddleware>();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();