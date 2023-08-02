namespace AspnetCoreCofiguration.Middlewares
{
    public class RequestEditingMiddleware
    {
        private RequestDelegate nextDelegate;
        public RequestEditingMiddleware(RequestDelegate next) => nextDelegate = next;

        public async Task Invoke(HttpContext httpContext)
        {
            httpContext.Items["Firefox"] = httpContext.Request.Headers["User-Agent"].Any(v => v.Contains("Firefox"));
            await nextDelegate.Invoke(httpContext);
        }
    }
}
