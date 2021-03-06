using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Angular_API.Utilites
{
    public class AllowedValues:ValidationAttribute
    {
        public readonly string[] _values;
        public AllowedValues(string[] values) {
            _values = values;
        }
        public override bool IsValid(object value)
        {
            string converted = value.ToString();
            return _values.Any(s=>s==converted);
        }
    }
}