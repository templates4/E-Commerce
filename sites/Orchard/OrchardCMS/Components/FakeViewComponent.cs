using Microsoft.AspNetCore.Mvc;

namespace OrchardCMS.Components
{
    public class FakeViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(string value)
        {
            return View("Default", value);
        }
    }
}

