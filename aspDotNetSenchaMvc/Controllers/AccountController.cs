using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace aspDotNetSenchaMvc.Controllers
{
    [JsonpFilter]
    public class AccountController : Controller
    {
        //
        // GET: /Account/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LogOn(String UserName, String Password)
        {
            try
            {
                
                if (UserName.Equals("kurtzace") && Password.Equals("kurtzace"))
                    return Json(new { responseText = "success" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { errorMessage = ex.Message }, JsonRequestBehavior.AllowGet);
            }
            return Json(new { errorMessage = "The username or password provided is incorrect." }, JsonRequestBehavior.AllowGet);
        }



    }
}
