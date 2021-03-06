﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using Apl.Business.Repositories;
using Apl.Business.Specifications;
using Apl.Business.UoW;
using Apl.Data.Model;

namespace Apl.Data.Repositories
{
    //Clase Base ó Layered-Supertype de Repositories 

    public class GenericRepository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        protected readonly DefaultContext DbContext;
        protected DbSet<TEntity> DbSet;

        //Constructor with Dependencies      
        public GenericRepository(DefaultContext dbContext)
        {
            //…          //set internal values         
            DbContext = dbContext;
            DbSet = dbContext.Set<TEntity>();
        }


        public void Add(TEntity item)
        {
            //…         //add object to IObjectSet for this type
            DbSet.Add(item);
        }

        public void Remove(TEntity item)
        {
            //delete object to IObjectSet for this type 
            DbSet.Attach(item);
            DbSet.Remove(item);
        }

        public void Attach(TEntity item)
        {
            DbSet.Attach(item);
        }

        public void Modify(TEntity item)
        {
            DbSet.Attach(item);
            DbContext.Entry(item).State = EntityState.Modified;
        }

        public void Modify(ICollection<TEntity> items)
        {
            foreach (var item in items)
            {
                DbSet.Attach(item);
                DbContext.Entry(item).State = EntityState.Modified;
                    
            }
        }

        public IEnumerable<TEntity> GetAll()
        {
            return DbSet;
        }


        public IEnumerable<TEntity> GetBySpec(ISpecification<TEntity> specification)
        {
            if (specification == null) throw new ArgumentNullException("specification");
            return DbSet.Where(specification.SatisfiedBy()).AsEnumerable();
        }

        public IEnumerable<TEntity> GetPagedElements<TS>(int pageIndex, int pageCount, Expression<Func<TEntity, TS>> orderByExpression, bool @ascending)
        {
            //checking arguments for this query          
            if (pageIndex < 0) throw new ArgumentException(/*Resources.Messages.exception_InvalidPageIndex*/ "exception_InvalidPageIndex", "pageIndex");

            if (pageCount <= 0) throw new ArgumentException(/*Resources.Messages.exception_InvalidPageCount*/"exception_InvalidPageCount", "pageCount");

            if (orderByExpression == null) throw new ArgumentNullException("orderByExpression", /*Resources.Messages.exception_OrderByExpressionCannotBeNull*/"exception_OrderByExpressionCannotBeNull");

            return (ascending) ? DbSet.OrderBy(orderByExpression).Skip(pageIndex * pageCount).Take(pageCount).ToList() : DbSet.OrderByDescending(orderByExpression).Skip(pageIndex * pageCount).Take(pageCount).ToList();
        }

        public IUnityOfWork UoW => DbContext as IUnityOfWork;
    }
}

