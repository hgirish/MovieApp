﻿using System;
using System.Collections.Generic;

namespace MovieApp.Shared.Models
{
    public partial class Genre
    {
        public int GenreId { get; set; }
        public string GenreName { get; set; } = null!;
    }
}
