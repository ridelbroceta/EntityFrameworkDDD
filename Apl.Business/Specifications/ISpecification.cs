using System;
using System.Linq.Expressions;

namespace Apl.Business.Specifications
{
    public interface ISpecification<TEntity> where TEntity : class {     
        /// <summary>     
        /// /// Check if this specification is satisfied by a      
        /// /// specific lambda expression      
        /// /// </summary>     
        /// /// <returns></returns>     
        Expression<Func<TEntity, bool>> SatisfiedBy();
    }

}
