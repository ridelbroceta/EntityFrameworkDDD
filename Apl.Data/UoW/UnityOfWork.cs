using System;
using Apl.Business.UoW;
using Apl.Data.Model;

namespace Apl.Data.UoW
{
    public class UnityOfWork : IUnityOfWork
    {
        private DefaultContext _context;

        public UnityOfWork(DefaultContext context)
        {
            _context = context;
        }

        public void Save()
        {
            throw new System.NotImplementedException();
        }

    }
}
