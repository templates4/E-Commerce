using OrchardCore.ContentManagement;
using OrchardCore.DisplayManagement.Shapes;

namespace OrchardCMS.Models
{
    public class TestContentPartA : ContentPart
    {
        public ShapeMetadata Metadata { get; set; }
        public string Line { get; set; }
    }
}

