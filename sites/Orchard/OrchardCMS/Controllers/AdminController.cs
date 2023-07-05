using Microsoft.AspNetCore.Mvc;

namespace OrchardCMS.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

