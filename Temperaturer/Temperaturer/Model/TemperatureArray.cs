using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Temperaturer.Model
{
    public class TemperatureArray
    {
        protected int Start { get; set; }
        protected int End { get; set; }
        protected int Step { get; set; }

        public TemperatureArray(int start, int end, int step)
        {
            Start = start;
            End = end;
            Step = step;
        }

        public int[] tempSteps()
        {
            int[] arr;
            int diff = End - Start;
            
            if (diff % Step == 0) // om det går jämnt upp
            {
                arr = new int[(diff / Step) + 1];
            }
            else // annars öka på arrayens längd med 1
            {
                arr = new int[(diff / Step) + 2];
            }

            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = Start + (Step * i);
                if (arr[i] > End)
                {
                    arr[i] = End;
                }
            }

            return arr;
        }
    }
}