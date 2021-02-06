using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Angular_API.Utilites
{
    public class ArrayContainsAttribute:ValidationAttribute
    {
        private readonly string[] _values;
        public ArrayContainsAttribute(string[] values) {
            _values = values;
        }
        public override bool IsValid(object value)
        {
            return ((string[])value).All(v=>_values.Contains(v));
        }
    }
}