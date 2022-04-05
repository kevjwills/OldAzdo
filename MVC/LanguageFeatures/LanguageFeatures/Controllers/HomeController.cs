using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
//using System.Collections.Generic;
using LanguageFeatures.Models;

namespace LanguageFeatures.Controllers
{
    public class HomeController : Controller
    {
        public async Task<ViewResult> Index()
        {
            long? length = await MyAsyncMethods.GetPathLength();
            return View(new string[] { $"Length: {length}" });
        }
    }
}
