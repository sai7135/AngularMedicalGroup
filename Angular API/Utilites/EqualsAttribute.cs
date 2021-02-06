using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Angular_API.Utilites
{
    public class EqualsAttribute:ValidationAttribute
    {
        private readonly string _value;
        public EqualsAttribute(string value){
            _value = value;
        }
        public override bool IsValid(object value)
        {
            return value.ToString() == _value;
        }
    }
}