using System;

namespace Apl.Business.UoW
{

    public interface IUnityOfWork 
    {
        void Save();
    }
}
