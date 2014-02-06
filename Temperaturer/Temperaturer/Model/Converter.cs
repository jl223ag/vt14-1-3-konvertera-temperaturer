using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Temperaturer.Model
{
    public static class Converter
    {
        public static int CelToFah(int degreesC) // från celsius till fahren
        {

            return (int)Math.Round((double)((degreesC * 1.8) + 32));

        }

        public static int FahToCel(int degreesF) // från fahren till celsius
        {

            return (int)Math.Round((double)((degreesF - 32) / 1.8));

        }        
    }
}