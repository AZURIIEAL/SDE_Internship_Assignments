using Configuation.Services;

namespace AspnetCoreCofiguration.Middlewares; //Middleware is a piece of code that that can intercept and process the incoming HTTP requests and outgoing responses.

public class ContentMiddleware
{
    private RequestDelegate nextDelegate;
    private TotalUsers totalUsers;

    public ContentMiddleware(RequestDelegate next, TotalUsers tu)
    {
        nextDelegate = next;
        totalUsers = tu;
    }

    public async Task Invoke(HttpContext httpContext)
    {
        if (httpContext.Request.Path.ToString() == "/middleware")
        {
            await httpContext.Response.WriteAsync("This is from the content middleware, Total Users: " + totalUsers.TUsers());
        }
        else
        {
            await nextDelegate.Invoke(httpContext);
        }
    }
}