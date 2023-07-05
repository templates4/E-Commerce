using System;
using Fluid;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using OrchardCore.Admin;
using OrchardCore.BackgroundTasks;
using OrchardCore.ContentManagement;
using OrchardCore.ContentManagement.Display.ContentDisplay;
using OrchardCore.Data.Migration;
using OrchardCMS.Commands;
using OrchardCMS.ContentElementDisplays;
using OrchardCMS.Controllers;
using OrchardCMS.Drivers;
using OrchardCMS.Models;
using OrchardCMS.Services;
using OrchardCMS.TagHelpers;
using OrchardCore.DisplayManagement.Descriptors;
using OrchardCore.DisplayManagement.Handlers;
using OrchardCore.Environment.Commands;
using OrchardCore.Modules;
using OrchardCore.Mvc.Core.Utilities;
using OrchardCore.Navigation;
using OrchardCore.Security.Permissions;
using OrchardCore.Users.Models;
using OrchardCore.Users.Services;

namespace OrchardCMS
{
    public class Startup : OrchardCore.Modules.StartupBase
    {
        private readonly AdminOptions _adminOptions;

        public Startup(IOptions<AdminOptions> adminOptions)
        {
            _adminOptions = adminOptions.Value;
        }

        public override void Configure(IApplicationBuilder builder, IEndpointRouteBuilder routes, IServiceProvider serviceProvider)
        {
            routes.MapAreaControllerRoute(
                name: "Demo.Home.Index",
                areaName: "OrchardCMS",
                pattern: "Home/Index",
                defaults: new { controller = "Home", action = "Index" }
            );

            routes.MapAreaControllerRoute(
                name: "Demo.Home.Display",
                areaName: "OrchardCMS",
                pattern: "Home/Display/{contentItemId}",
                defaults: new { controller = "Home", action = "Display" }
            );

            routes.MapAreaControllerRoute(
                name: "Demo.Home.Error",
                areaName: "OrchardCMS",
                pattern: "Home/IndexError",
                defaults: new { controller = "Home", action = "IndexError" }
            );

            var demoAdminControllerName = typeof(AdminController).ControllerName();

            routes.MapAreaControllerRoute(
                name: "Demo.Admin",
                areaName: "OrchardCMS",
                pattern: _adminOptions.AdminUrlPrefix + "/Demo/Admin",
                defaults: new { controller = demoAdminControllerName, action = nameof(AdminController.Index) }
            );

            var demoContentControllerName = typeof(ContentController).ControllerName();

            routes.MapAreaControllerRoute(
                name: "Demo.Content.Edit",
                areaName: "OrchardCMS",
                pattern: _adminOptions.AdminUrlPrefix + "/Demo/Content/Edit",
                defaults: new { controller = demoContentControllerName, action = nameof(ContentController.Edit) }
            );

            builder.UseMiddleware<NonBlockingMiddleware>();
            builder.UseMiddleware<BlockingMiddleware>();
        }

        public override void ConfigureServices(IServiceCollection services)
        {
            services.AddScoped<ITestDependency, ClassFoo>();
            services.AddScoped<ICommandHandler, DemoCommands>();
            services.AddSingleton<IBackgroundTask, TestBackgroundTask>();
            services.AddScoped<IShapeTableProvider, DemoShapeProvider>();
            services.AddShapeAttributes<DemoShapeProvider>();
            services.AddScoped<INavigationProvider, AdminMenu>();
            services.AddScoped<IContentDisplayDriver, TestContentElementDisplayDriver>();
            services.AddDataMigration<Migrations>();
            services.AddScoped<IPermissionProvider, Permissions>();
            services.AddContentPart<TestContentPartA>();
            services.AddScoped<IUserClaimsProvider, UserProfileClaimsProvider>();

            services.AddScoped<IDisplayDriver<User>, UserProfileDisplayDriver>();

		// TYE - NEW CODE!!!
		services.AddRazorPages();
		/** Add the following to wire the client to the backend **/
		services.AddHttpClient<WeatherClient>(client =>
		{
		         client.BaseAddress = builder.Configuration.GetServiceUri("backend");
		});

            services.Configure<RazorPagesOptions>(options =>
            {
                // Add a custom page folder route (only applied to non admin pages)
                options.Conventions.AddAreaFolderRoute("OrchardCMS", "/", "Demo");

                // Add a custom admin page folder route (only applied to admin pages) using the current admin prefix
                options.Conventions.AddAdminAreaFolderRoute("OrchardCMS", "/Admin", _adminOptions.AdminUrlPrefix + "/Demo");

                // Add a custom admin page folder route without using the current admin prefix
                options.Conventions.AddAdminAreaFolderRoute("OrchardCMS", "/Foo/Admin", "Manage/Foo");

                // Add a custom admin page route using the current admin prefix
                options.Conventions.AddAreaPageRoute("OrchardCMS", "/OutsideAdmin", _adminOptions.AdminUrlPrefix + "/Outside");

                // Add a custom page route
                options.Conventions.AddAreaPageRoute("OrchardCMS", "/Hello", "Hello");

                // This declaration would define an home page
                //options.Conventions.AddAreaPageRoute("OrchardCMS", "/Hello", "");
            });

            services.AddTagHelpers(typeof(BazTagHelper).Assembly);

            services.Configure<TemplateOptions>(o =>
            {
                o.MemberAccessStrategy.Register<OrchardCMS.ViewModels.TodoViewModel>();
            });
        }
    }
}

