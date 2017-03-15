#region licence
// =====================================================
// Example code containing some useful methods that will be pulled out into libraries
// Filename: DataLayerModule.cs
// Date Created: 2014/10/20
// © Copyright Selective Analytics 2014. All rights reserved
// =====================================================
#endregion

using Apl.Application;
using Apl.Business;
using Apl.Data;
using Autofac;


namespace Apl.IoCModules
{

    public class IoCModuleRegisterFactory : Module
    {

        protected override void Load(ContainerBuilder builder)
        {

            //Now register the IoCModules
            builder.RegisterModule(new ApplicationLayerModule());
            builder.RegisterModule(new DataLayerModule());
            builder.RegisterModule(new BusinessLayerModule());

        }
    }

}
