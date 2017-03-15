using Apl.Application.IServices;
using Apl.Business;
using Autofac;

namespace Apl.Application
{
    public class ApplicationLayerModule : Module
    {
        /// <summary>
        /// This registers all items in service layer and below
        /// </summary>
        /// <param name="builder"></param>
        protected override void Load(ContainerBuilder builder)
        {

            //Reigister the BizLayer
            //builder.RegisterModule(new BizLayerModule());

            //---------------------------
            //Register service layer: autowire all 
            builder.RegisterAssemblyTypes(GetType().Assembly).AsImplementedInterfaces();

            //and register all the non-generic interfaces interfaces GenericServices assembly
            builder.RegisterAssemblyTypes(typeof(IEntityService).Assembly).AsImplementedInterfaces();
        }

    }

}

