using OrchardCore.Modules.Manifest;

[assembly: Module(
    Name = "OrchardCMS",
    Author = ManifestConstants.OrchardCoreTeam,
    Website = ManifestConstants.OrchardCoreWebsite,
    Version = ManifestConstants.OrchardCoreVersion
)]

[assembly: Feature(
    Name = "OrchardCMS",
    Id = "OrchardCMS",
    Description = "Test",
    Category = "Samples",
    Dependencies = new[] { "OrchardCore.Users", "OrchardCore.Contents" }
)]

[assembly: Feature(
    Id = "OrchardCMS.Foo",
    Name = "Orchard Foo Demo",
    Description = "Foo feature sample.",
    Category = "Samples"
)]


