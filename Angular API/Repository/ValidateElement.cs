using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Angular_API.Repository
{
    public static class ValidateElement
    {
        public static string GetValidation(string element,Element elreq,ushort least,ushort highest,string eleName)
        {
            switch (elreq) {
                case Element.Required:
                    if (element == null) {
                        return $"{eleName} is required ";
                    }
                    if (element == "")
                    {
                        return $"{eleName} is required ";
                    }
                    if(element.Length>=least && element.Length <= highest)
                    {
                        return $"{eleName} length lowest is {least} and hieghest is {highest} ";
                    }
                    return "";
                case Element.Situational:
                    if((!string.IsNullOrEmpty(element))&&(element.Length>=least && element.Length<=highest))
                    {
                        return $"{eleName} length lowest is {least} and hieghest is {highest} ";
                    }
                    return "";
            }
            return null;
        }
    }
}