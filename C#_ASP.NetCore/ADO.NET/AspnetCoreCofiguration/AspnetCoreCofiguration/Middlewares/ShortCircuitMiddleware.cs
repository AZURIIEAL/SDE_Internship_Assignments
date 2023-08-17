namespace AspnetCoreCofiguration.Middlewares
{
    public class ShortCircuitMiddleware
    {
        private RequestDelegate nextDelegate;
        public ShortCircuitMiddleware(RequestDelegate next)
        {
            nextDelegate = next;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            /* if (httpContext.Request.Headers["User-Agent"].Any(v => v.Contains("Chrome")))*/
            if (httpContext.Items["Firefox"] as bool? == true)
            {
                httpContext.Response.StatusCode = StatusCodes.Status401Unauthorized;
            }
            else
            {
                await nextDelegate.Invoke(httpContext);
            }
        }
    }
}
