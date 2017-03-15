using System;
using System.Web.Mvc;
using Apl.Application.IServices;
using Apl.Business.Domain;
using Apl.UI.Models;

namespace Apl.UI.Controllers
{
    public class EntityController : Controller
    {

        // GET: Entity
        public ActionResult Index(IEntityService entityService)
        {
            return View(entityService.GetAll());
        }

        // GET: Entity
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost, ActionName("Add")]
        public ActionResult AddConfirmed(EntidadViewModel model, IEntityService entityService)
        {
            var entidad = new entidad()
            {
                Nombre = model.Name,
                Apellidos = model.LastName,
                CodId = model.CodId,
                IdPais = 1,
                Direccion = "dkd",
                IdAdminPropiedades = 1,
                UserCreated = 1,
                DateCreated = DateTime.Now
            };
            entityService.Add(entidad);
            return RedirectToAction("Index");
        }

    }
}