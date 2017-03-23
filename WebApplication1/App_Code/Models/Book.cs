namespace Bookshop
{
    public class Book
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Author { get; set; }
        public double Price { get; set; }
        public string Genre { get; set; }
        public string Country { get; set; }
        public string Image { get; set; }
        public string Review { get; set; }

        public Book(int id, string name, string author, double price, string genre, string country, string image, string review)
        {
            Id = id;
            Name = name;
            Author = author;
            Price = price;
            Genre = genre;
            Country = country;
            Image = image;
            Review = review;
        }

        public Book(string name, string author, double price, string genre, string country, string image, string review)
        {
            Name = name;
            Author = author;
            Price = price;
            Genre = genre;
            Country = country;
            Image = image;
            Review = review;
        }
    }
}
