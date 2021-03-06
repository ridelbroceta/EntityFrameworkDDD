﻿using System;
using System.Collections.Generic;
using Apl.Business.Specifications;
using Apl.Business.UoW;


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

       IUnityOfWork UoW { get; }
   }

}
