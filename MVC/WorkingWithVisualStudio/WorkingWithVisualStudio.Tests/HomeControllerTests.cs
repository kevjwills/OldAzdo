using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using WorkingWithVisualStudio.Controllers;
using WorkingWithVisualStudio.Models;
using Xunit;
using System;
using Moq;

namespace WorkingWithVisualStudio.Tests
{
    public class HomeControllerTests
    {
        //class ModelCompleteFakeRepository : IRepository
        //{
        //    public IEnumerable<Product> Products { get; set; }
            
    
        //    public void AddProduct(Product p)
        //    {
        //        //do nothing - not required for test
        //    }
        //}
        [Theory]
        [ClassData(typeof(ProductTestData))]
        
        public void IndexActionModelIsComplete(Product[] products)
        {
            //Arrange
            var mock = new Mock<IRepository>();
            mock.SetupGet(m => m.Products)
                .Returns(new[] { new Product { Name = "P1", Price = 100 } });



            var controller = new HomeController() { Repository = mock.Object };
            
            //Act
            var result = controller.Index();

            //Assert
            mock.VerifyGet(m => m.Products, Times.Once);
        }

       class PropertyOnceFakeRepository: IRepository
        {
            public int PropertyCounter { get; set; } = 0;

            public IEnumerable<Product> Products
            {
                get
                {
                    PropertyCounter++;
                    return new[] { new Product { Name = "P1", Price = 100 } };

                }
            }
            public void AddProduct(Product p)
            {
                // do nothing - not required for test
            }
        }

        [Fact]
        public void RepositoryPropertyCalledOnce()
        {
            //Arrange
            var repo = new PropertyOnceFakeRepository();
            var controller = new HomeController { Repository = repo };

            //Act
            Assert.Equal(1, repo.PropertyCounter);

        }
    }
}
