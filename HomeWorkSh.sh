result=${PWD##*/}          
result=${result:-/}        


mkdir -p "${PWD##*/}"
cd "${PWD##*/}"

dotnet new mvc -o "${PWD##*/}"
dotnet new sln -n "${PWD##*/}"
dotnet sln "${PWD}/${PWD##*/}".sln add "${PWD##*/}/${PWD##*/}".csproj

printf "${PWD}"
cd "${PWD##*/}"
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
cd "Models"
touch Category.cs
touch Product.cs

echo "public class Category
   {
      public int CategoryId { get; set; }
      public string CategoryName { get; set; }
     public string Description { get; set; }
   }"> category.cs
   
echo "public class Product
    {
       public int ProductId { get; set; }
    }"> Product.cs
