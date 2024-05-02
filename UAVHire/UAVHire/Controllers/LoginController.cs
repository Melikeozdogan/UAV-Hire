using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UAVHire.Classes.Login;
using UAVHire.Classes.Helpers;
using Microsoft.Win32;

namespace UAVHire.Controllers
{
    public class LoginController : Controller
    {
        Authenticate auth = new Authenticate();
        LogHelper logHelper = new LogHelper();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Index(string username,string password)
        {
            try
            {
                // Login işlemi
                bool login = auth.AuthenticateUser(username, password);
                
                if (login)
                {
                    string userIP = Request.UserHostAddress;
                    Session["Username"] = username;
                    Session["IsLoggedIn"] = true;
                    TempData["result"] = login;

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    TempData["result"] = login;

                    TempData["Message"] = "Username or password is incorrect, please try again.";
                    return View();
                }



            }
            catch
            {
                TempData["Message"] = "An unexpected problem occurred, please try again.";
                return View();
            }
        }




        public ActionResult Register()
        {
            return View();
        }



        [HttpPost]
        public ActionResult Register(string name, string email, string username, string password, string passwordagain)  
        {
            try
            {
                if ( password != passwordagain)
                {
                    TempData["Message"] = "Password and password again values ​​do not match!";
                    return View();
                }

                // Kullanıcıyı Kaydet
                bool register = auth.Register(name, email, username, password);

                if (register)
                {
                    TempData["result"] = register;
                    TempData["Message"] = "Registration is successful, you can log in.";
                    return RedirectToAction("Index");
                }
                else
                {
                    TempData["result"] = register;

                    TempData["Message"] = "An unexpected problem occurred, please try again.";
                    return View();
                }

            }
            catch
            {
                TempData["Message"] = "An unexpected problem occurred, please try again.";
                return View();
            }
        }




        public ActionResult Logout()
        {
            // Kullanıcıyı oturumdan çıkar
            Session.Clear();

            // Giriş sayfasına yönlendir
            return RedirectToAction("Index", "Login");
        }
    }
}