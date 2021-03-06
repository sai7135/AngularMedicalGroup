using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Angular_API.Utilites
{
    public class NotEqualAttribute:ValidationAttribute
    {
        private readonly string invalidvalue;
        public NotEqualAttribute(string InvalidValue) {
            invalidvalue = InvalidValue;
        }
        public override bool IsValid(object value)
        {
            return value.ToString() != invalidvalue;
        }
    }
}