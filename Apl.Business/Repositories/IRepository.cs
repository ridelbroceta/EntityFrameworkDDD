using System;
using System.Collections.Generic;
using Apl.Business.Specifications;
using System.Data.Entity;

namespace Apl.Business.Repositories
{
  
   public interface  IRepository<TEntity> where TEntity : class
   {

       void Add(TEntity item);
       void Remove(TEntity item);
       void Attach(TEntity item);
       void Modify(TEntity item);
       void Modify(ICollection<TEntity> items);
       IEnumerable<TEntity> GetAll();
       IEnumerable<TEntity> GetBySpec(ISpecification<TEntity> specification);

       IEnumerable<TEntity> GetPagedElements<TS>(int pageIndex, int pageCount,
           System.Linq.Expressions.Expression<Func<TEntity, TS>> orderByExpression, bool ascending);

       DbContext Context { get; }
   }

}
