using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using Apl.Business.UoW;
using Apl.Data.Model;

namespace Apl.Data.UoW
{
    public class UnityOfWork : IUnityOfWork, IDisposable
    {
        internal readonly DefaultContext _myContext;

        public UnityOfWork(DefaultContext context)
        {
            _myContext = context;
        }

        public void Save()
        {
            try
            {
                _myContext.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {

                var outputLines = new List<string>();
                foreach (var eve in e.EntityValidationErrors)
                {
                    outputLines.Add(string.Format("{0}: Entity of type \"{1}\" in state \"{2}\" has the following validation errors:", DateTime.Now, eve.Entry.Entity.GetType().Name, eve.Entry.State));
                    foreach (var ve in eve.ValidationErrors)
                    {
                        outputLines.Add(string.Format("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage));
                    }
                }
                System.IO.File.AppendAllLines(@"C:\errors.txt", outputLines);

                throw;
            }
        }

        #region Implementing IDiosposable...

        #region private dispose variable declaration...
        private bool _disposed;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    Debug.WriteLine("UnitOfWork is being _disposed");
                    _myContext.Dispose();
                }
            }
            this._disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        #endregion

     }
  }
