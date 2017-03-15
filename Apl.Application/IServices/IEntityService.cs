using System.Collections.Generic;
using Apl.Business.Domain;

namespace Apl.Application.IServices
{
    public interface IEntityService
    {
        void Add(entidad entidad);
        void Modify(entidad entidad);
        IEnumerable<entidad> GetAll();
        void Remove(entidad entidad);
    }
}
