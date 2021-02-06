using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Angular_API.Utilites
{
    public class MaximumArrayLengthAttribute:ValidationAttribute
    {
        public readonly int _length;
        public MaximumArrayLengthAttribute(int length) {
            _length = length;
        }
        public override bool IsValid(object value)
        {
            return ((object[])value).Length <= _length;
        }
    }
}