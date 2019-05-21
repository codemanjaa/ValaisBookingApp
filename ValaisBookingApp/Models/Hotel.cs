using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ValaisBookingApp.Models
{
    public class Hotel
    {
        [Key]
        public int IdHotel { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Category { get; set; }
        public bool HasWifi { get; set; }
        public bool HasParking { get; set; }

        public string Phone { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }



    }
}