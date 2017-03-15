using Apl.Business.Domain;
using Apl.Business.Repositories;
using Apl.Data.Model;

namespace Apl.Data.Repositories
{
    public class EntityRepository : GenericRepository<entidad>, IEntityRepository
    {
        public EntityRepository(DefaultContext dbContext) : base(dbContext)
        {
        }
    }
}
