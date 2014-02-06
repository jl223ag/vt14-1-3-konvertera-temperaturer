using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Temperaturer.Model;

namespace Temperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConvertButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var temp = new TemperatureArray(int.Parse(StartInput.Text), int.Parse(EndInput.Text), int.Parse(StepInput.Text)); //start, slut och stegvärde
                var tempArr = temp.tempSteps();

                if (BulletList.SelectedValue == "CtF")
                {
                    First.Text = "Celsius";
                    Second.Text = "Fahrenheit";
                }
                else
                {
                    First.Text = "Fahrenheit";
                    Second.Text = "Celsius";
                }

                for (int i = 0; i < tempArr.Length; i++ )
                {
                    FirstHolder.Text += "<br />" + tempArr[i];

                    if (BulletList.SelectedValue == "CtF")
                    {
                        SecondHolder.Text += "<br />" + Converter.CelToFah(tempArr[i]);
                    }
                    else
                    {
                        SecondHolder.Text += "<br />" + Converter.FahToCel(tempArr[i]);
                    }
                }

                TheBoard.Visible = true;
            }
        }

        protected void StartInput_TextChanged(object sender, EventArgs e)
        {

        }
    }
}