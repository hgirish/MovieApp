using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using MovieApp.Client;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

string graphQLServerPath = builder.HostEnvironment.BaseAddress + "graphql";

builder.Services.AddMovieClient()
   .ConfigureHttpClient(client =>
   {
       client.BaseAddress = new Uri(graphQLServerPath);
   }
);

await builder.Build().RunAsync();
