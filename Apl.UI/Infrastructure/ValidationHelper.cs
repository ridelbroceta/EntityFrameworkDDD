﻿#region licence
// =====================================================
// Example code containing some useful methods that will be pulled out into libraries
// Filename: ValidationHelper.cs
// Date Created: 2014/10/22
// © Copyright Selective Analytics 2014. All rights reserved
// =====================================================
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web.Mvc;
using GenericLibsBase;

namespace Apl.UI.Infrastructure
{
    public static class ValidationHelper
    {

        /// <summary>
        /// This transfers error messages from the DtoValidation methods to the MVC modelState error dictionary.
        /// It looks for errors that have member names corresponding to the properties in the displayDto.
        /// This means that errors assciated with a field on display will show next to the name. 
        /// Other errors will be shown in the ValidationSummary
        /// </summary>
        /// <param name="errorHolder">The interface that holds the errors</param>
        /// <param name="modelState">The MVC modelState to add errors to</param>
        /// <param name="displayDto">This is the Dto that will be used to display the error messages</param>
        public static void CopyErrorsToModelState<T>(this ISuccessOrErrors errorHolder, ModelStateDictionary modelState, T displayDto) 
        {
            if (errorHolder.IsValid) return;

            var namesThatWeShouldInclude = PropertyNamesInDto(displayDto);
            foreach (var error in errorHolder.Errors)
            {
                if (!error.MemberNames.Any())
                    modelState.AddModelError("", error.ErrorMessage);
                else
                    foreach (var errorKeyName in error.MemberNames)
                        modelState.AddModelError(
                            (namesThatWeShouldInclude.Any(x => x == errorKeyName) ? errorKeyName : ""),
                            error.ErrorMessage);
            }
        }

        /// <summary>
        /// This copies errors for general display where we are not returning to a page with the fields on them
        /// </summary>
        /// <param name="errorHolder"></param>
        /// <param name="modelState"></param>
        public static void CopyErrorsToModelState(this ISuccessOrErrors errorHolder, ModelStateDictionary modelState)
        {
            if (errorHolder.IsValid) return;

            foreach (var error in errorHolder.Errors)
                    modelState.AddModelError("", error.ErrorMessage);
        }


        /// <summary>
        /// This returns the ModelState errors as a json array containing objects with the PropertyName and the first error message.
        /// Must only be called if there are model errors.
        /// </summary>
        /// <param name="modelState"></param>
        /// <returns>It returns a JsonResult with one parameter called Errors which contains key value pairs.
        /// The key is the name of the property which had the error, or is empty string if global error.
        /// The value is an array of error strings for that property key</returns>
        public static JsonResult ReturnModelErrorsAsJson(this ModelStateDictionary modelState)
        {
            if (modelState.IsValid)
                throw new ArgumentException("You should only call this if there are model errors to return.");

            var dict = new Dictionary<string, object>();
            var emptyNameErrors = new List<string>();
            foreach (var propertyError in modelState.Where(x => x.Value.Errors.Any()))
            {
                if (string.IsNullOrEmpty(propertyError.Key))
                    //The modelState doesn't seem to combine empty named items so we do it for it
                    emptyNameErrors.AddRange(propertyError.Value.Errors.Select(x => x.ErrorMessage));
                else
                    dict[propertyError.Key] = new { errors = propertyError.Value.Errors.Select(x => x.ErrorMessage) };
            }

            if (emptyNameErrors.Any())
                dict[string.Empty] = new { errors = emptyNameErrors };

            var result = new JsonResult { Data = new { Errors = dict } };

            return result;
        }

        /// <summary>
        /// This returns an Errors with any errors in ISuccessOrErrors transferred
        /// It looks for errors that have member names corresponding to the properties in the displayDto.
        /// This means that errors assciated with a field on display will show next to the name. 
        /// Other errors will be shown in the ValidationSummary
        /// Should only be called if there is an error
        /// </summary>
        /// <param name="errorHolder">The interface that holds the errors</param>
        /// <param name="displayDto">Dto that the error messages came from</param>
        /// <returns>It returns a JsonNetResult with one parameter called errors which contains key value pairs.
        /// The key is the name of the property which had the error, or is empty string if global error.
        /// The value is an array of error strings for that property key</returns>
        public static JsonResult ReturnErrorsAsJson<T>(this ISuccessOrErrors errorHolder, T displayDto)
        {
            if (errorHolder.IsValid)
                throw new ArgumentException("You should only call ReturnErrorsAsJson when there are errors in the status", "errorHolder");

            var modelState = new ModelStateDictionary();
            errorHolder.CopyErrorsToModelState(modelState, displayDto);
            return modelState.ReturnModelErrorsAsJson();
        }

        private static IList<string> PropertyNamesInDto<T> ( T objectToCheck)
        {
            return
                objectToCheck.GetType()
                             .GetProperties(BindingFlags.Public | BindingFlags.Instance)
                             .Select(x => x.Name)
                             .ToList();
        }

    }
}