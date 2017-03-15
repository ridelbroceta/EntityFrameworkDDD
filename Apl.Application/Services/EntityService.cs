using System.Collections.Generic;
using System.Transactions;
using Apl.Application.IServices;
using Apl.Business.Domain;
using Apl.Business.Repositories;

namespace Apl.Application.Services
{


    /*… namespace Microsoft.Samples.NLayerApp.Application.MainModule.BankingManagement
    {


        public class BankingManagementService : IBankingManagementService
        {
            IBankTransferDomainService _bankTransferDomainService; IBankAccountRepository _bankAccountRepository;



            public BankingManagementService(IBankTransferDomainService bankTransferDomainService, IBankAccountRepository bankAccountRepository)
         
 {                         _bankTransferDomainService = bankTransferDomainService;             _bankAccountRepository = bankAccountRepository;         } 
 
 
 
 
        public void PerformTransfer(string fromAccountNumber, string toAccountNumber, decimal amount)         {             //Process: 1º Start Transaction             //         2º Get Accounts objects from Repositories             //         3º Call PerformTransfer method in Domain Service             //         4º If no exceptions, save changes using repositories and Commit Transaction                          //Create a transaction context for this operation             TransactionOptions txSettings = new TransactionOptions()             {                 Timeout = TransactionManager.DefaultTimeout,                 IsolationLevel = IsolationLevel.Serializable              }; 
 
 
 
 
             
 
        using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Required, txSettings))             { 
 
                //Get Unit of Work                 IUnitOfWork unitOfWork = _bankAccountRepository.StoreContext as IUnitOfWork; 
 
 
                //Create Queries' Specifications                 BankAccountNumberSpecification originalAccountQuerySpec = new BankAccountNumberSpecification(fromAccountNumber);                 BankAccountNumberSpecification destinationAccountQuerySpec = new BankAccountNumberSpecification(toAccountNumber); 
 
 
 
                //Query Repositories to get accounts                 BankAccount originAccount = _bankAccountRepository.GetBySpec(originalAccountQuerySpec as ISpecification<BankAccount>).SingleOrDefault(); 
 
                BankAccount destinationAccount = _bankAccountRepository.GetBySpec(destinationAccountQuerySpec as ISpecification<BankAccount>).SingleOrDefault();                 
 
                ////Start tracking STE entities (Self Tracking Entities)                 originAccount.StartTrackingAll();                 destinationAccount.StartTrackingAll(); 
 
 
 
                //Excute Domain Logic for the Transfer (In Domain Service)                  _bankTransferDomainService.PerformTransfer(originAccount, destinationAccount, amount); 
  //Save changes and commit operations.                  //This opeation is problematic with concurrency.                 //"balance" propety in bankAccount is configured                  //to FIXED in "WHERE concurrency checked predicates" 
 
 
 
                _bankAccountRepository.Modify(originAccount);                 _bankAccountRepository.Modify(destinationAccount);                
 
 
 
                //Complete changes in this Unit of Work                 unitOfWork.CommitAndRefreshChanges(); 
 
 
 
                //Commit the transaction                 scope.Complete();             }         }         } }           
         */


    public class EntityService : IEntityService
    {
        private readonly IEntityRepository _entityRepository;

        public EntityService(IEntityRepository entityRepository)
        {
            _entityRepository = entityRepository;
        }

        /*public EntityService()
        {
            _entityRepository = null;
        }*/


        public void Add(entidad entidad)
        {
            //Create a transaction context for this operation
            TransactionOptions txSettings = new TransactionOptions()
            {
                Timeout = TransactionManager.DefaultTimeout,
                IsolationLevel = IsolationLevel.Serializable
            };
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Required, txSettings))
            {
                var unityOfW = _entityRepository.UoW;
                _entityRepository.Add(entidad);
                unityOfW.Save();
                scope.Complete();
            }
        }

        public void Modify(entidad entidad)
        {
            var unityOfW = _entityRepository.UoW;
            _entityRepository.Modify(entidad);
            unityOfW.Save();
        }

        public IEnumerable<entidad> GetAll()
        {
            //return new[] {new entidad() {Nombre = "Ridel", Apellidos = "ddd", CodId = "00022"}};
            return _entityRepository.GetAll();
        }

        public void Remove(entidad entidad)
        {
            var unityOfW = _entityRepository.UoW;
            _entityRepository.Remove(entidad);
            unityOfW.Save();

        }
    }
}
