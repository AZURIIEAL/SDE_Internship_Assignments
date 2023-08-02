namespace AspnetCoreCofiguration.Middlewares; //Middleware is a piece of code that that can intercept and process the incoming HTTP requests and outgoing responses.

public class ContentMiddleware
{
    private RequestDelegate nextDelegate; //The requestdelegate reprents the next middleware in the pipeline that should be invoked after the completion of the process.
    public ContentMiddleware(RequestDelegate next) => nextDelegate = next;

    public async Task Invoke(HttpContext httpContext) //Heart of the middleware.
    {
        if (httpContext.Request.Path.ToString() == "/middleware")
        {
            await httpContext.Response.WriteAsync("This is from the content middleware");
        }
        else
        {
            await nextDelegate(httpContext);
        }
    } 
}
 