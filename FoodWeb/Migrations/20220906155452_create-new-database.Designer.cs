﻿// <auto-generated />
using System;
using FoodWebMVC.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace FoodWebMVC.Migrations
{
    [DbContext(typeof(FoodWebMVCDbContext))]
    [Migration("20220906155452_create-new-database")]
    partial class createnewdatabase
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.8")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("FoodWebMVC.Models.Admin", b =>
                {
                    b.Property<int>("AdminId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AdminId"), 1L, 1);

                    b.Property<DateTime>("AdminDateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("AdminEmail")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("AdminImage")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("AdminPassword")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("AdminUserName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("AdminId");

                    b.HasIndex("AdminUserName")
                        .IsUnique();

                    b.ToTable("Admin", (string)null);
                });

            modelBuilder.Entity("FoodWebMVC.Models.Category", b =>
                {
                    b.Property<int>("CategoryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CategoryId"), 1L, 1);

                    b.Property<DateTime>("CategoryDateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("CategoryName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("CategoryId");

                    b.ToTable("Categories");
                });

            modelBuilder.Entity("FoodWebMVC.Models.Customer", b =>
                {
                    b.Property<int>("CustomerId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CustomerId"), 1L, 1);

                    b.Property<string>("CustomerAddress")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<DateTime>("CustomerDateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("CustomerEmail")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("CustomerFullName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("CustomerImage")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("CustomerPassword")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("CustomerPhone")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("CustomerState")
                        .HasColumnType("bit");

                    b.Property<string>("CustomerUserName")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("CustomerId");

                    b.HasIndex("CustomerUserName")
                        .IsUnique();

                    b.ToTable("Customer", (string)null);
                });

            modelBuilder.Entity("FoodWebMVC.Models.Order", b =>
                {
                    b.Property<int>("OrderId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("OrderId"), 1L, 1);

                    b.Property<int>("CustomerId")
                        .HasColumnType("int");

                    b.Property<DateTime>("DayDelivery")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("DayOrder")
                        .HasColumnType("datetime2");

                    b.Property<bool>("DeliveryState")
                        .HasColumnType("bit");

                    b.Property<bool>("PaidState")
                        .HasColumnType("bit");

                    b.Property<double>("TotalMoney")
                        .HasColumnType("float");

                    b.HasKey("OrderId");

                    b.HasIndex("CustomerId");

                    b.ToTable("Order", (string)null);
                });

            modelBuilder.Entity("FoodWebMVC.Models.OrderDetail", b =>
                {
                    b.Property<int>("ProductId")
                        .HasColumnType("int")
                        .HasColumnOrder(1);

                    b.Property<int>("OrderId")
                        .HasColumnType("int")
                        .HasColumnOrder(0);

                    b.Property<int>("Quantity")
                        .HasColumnType("int");

                    b.Property<decimal>("UnitPrice")
                        .HasColumnType("money");

                    b.HasKey("ProductId", "OrderId");

                    b.HasIndex("OrderId");

                    b.ToTable("OrderDetail", (string)null);
                });

            modelBuilder.Entity("FoodWebMVC.Models.Product", b =>
                {
                    b.Property<int>("ProductId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ProductId"), 1L, 1);

                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.Property<int>("ProductAmount")
                        .HasColumnType("int");

                    b.Property<DateTime>("ProductDateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("ProductDescription")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ProductDiscount")
                        .HasColumnType("int");

                    b.Property<string>("ProductImage")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("ProductName")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("nvarchar(100)");

                    b.Property<double>("ProductPrice")
                        .HasColumnType("float");

                    b.HasKey("ProductId");

                    b.HasIndex("CategoryId");

                    b.ToTable("Product", (string)null);
                });

            modelBuilder.Entity("FoodWebMVCWeb.Models.Banner", b =>
                {
                    b.Property<int>("BannerId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("BannerId"), 1L, 1);

                    b.Property<DateTime>("BannerDateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("BannerDescription")
                        .HasMaxLength(200)
                        .HasColumnType("nvarchar(200)");

                    b.Property<string>("BannerImage")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("BannerName")
                        .HasMaxLength(50)
                        .HasColumnType("nvarchar(50)");

                    b.Property<double?>("BannerPrice")
                        .HasColumnType("float");

                    b.Property<int?>("ProductDiscount")
                        .HasColumnType("int");

                    b.HasKey("BannerId");

                    b.ToTable("Banner", (string)null);
                });

            modelBuilder.Entity("FoodWebMVCWeb.Models.Blog", b =>
                {
                    b.Property<int>("BlogId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("BlogId"), 1L, 1);

                    b.Property<string>("BlogContent")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("BlogDateCreated")
                        .HasColumnType("datetime2");

                    b.Property<string>("BlogImage")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("BlogName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("BlogId");

                    b.ToTable("Blog");
                });

            modelBuilder.Entity("FoodWebMVCWeb.Models.Favorite", b =>
                {
                    b.Property<int>("ProductId")
                        .HasColumnType("int")
                        .HasColumnOrder(0);

                    b.Property<int>("CustomerId")
                        .HasColumnType("int")
                        .HasColumnOrder(1);

                    b.Property<DateTime>("PRDateCreated")
                        .HasColumnType("datetime2");

                    b.HasKey("ProductId", "CustomerId");

                    b.HasIndex("CustomerId");

                    b.ToTable("Favorite", (string)null);
                });

            modelBuilder.Entity("FoodWebMVCWeb.Models.ProductRating", b =>
                {
                    b.Property<int>("ProductRatingId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ProductRatingId"), 1L, 1);

                    b.Property<int>("CustomerId")
                        .HasColumnType("int");

                    b.Property<DateTime>("PRDateCreated")
                        .HasColumnType("datetime2");

                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.Property<string>("RatingContent")
                        .HasMaxLength(200)
                        .HasColumnType("nvarchar(200)");

                    b.Property<int>("Stars")
                        .HasColumnType("int");

                    b.HasKey("ProductRatingId");

                    b.HasIndex("CustomerId");

                    b.HasIndex("ProductId");

                    b.ToTable("ProductRating", (string)null);
                });

            modelBuilder.Entity("FoodWebMVCWeb.Models.Token", b =>
                {
                    b.Property<int>("TokenID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("TokenID"), 1L, 1);

                    b.Property<string>("CustomerUserName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("Expiry")
                        .HasColumnType("datetime2");

                    b.Property<string>("TokenValue")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("TokenID");

                    b.ToTable("Token", (string)null);
                });

            modelBuilder.Entity("FoodWebMVC.Models.Order", b =>
                {
                    b.HasOne("FoodWebMVC.Models.Customer", "Customer")
                        .WithMany("Orders")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Customer");
                });

            modelBuilder.Entity("FoodWebMVC.Models.OrderDetail", b =>
                {
                    b.HasOne("FoodWebMVC.Models.Order", "Order")
                        .WithMany("OrderDetails")
                        .HasForeignKey("OrderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FoodWebMVC.Models.Product", "Product")
                        .WithMany("OrderDetails")
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Order");

                    b.Navigation("Product");
                });

            modelBuilder.Entity("FoodWebMVC.Models.Product", b =>
                {
                    b.HasOne("FoodWebMVC.Models.Category", "Category")
                        .WithMany("Products")
                        .HasForeignKey("CategoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Category");
                });

            modelBuilder.Entity("FoodWebMVCWeb.Models.Favorite", b =>
                {
                    b.HasOne("FoodWebMVC.Models.Customer", "Customer")
                        .WithMany("Favorites")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FoodWebMVC.Models.Product", "Product")
                        .WithMany("Favorites")
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Customer");

                    b.Navigation("Product");
                });

            modelBuilder.Entity("FoodWebMVCWeb.Models.ProductRating", b =>
                {
                    b.HasOne("FoodWebMVC.Models.Customer", "Customer")
                        .WithMany("ProductRatings")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("FoodWebMVC.Models.Product", "Product")
                        .WithMany("ProductRatings")
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Customer");

                    b.Navigation("Product");
                });

            modelBuilder.Entity("FoodWebMVC.Models.Category", b =>
                {
                    b.Navigation("Products");
                });

            modelBuilder.Entity("FoodWebMVC.Models.Customer", b =>
                {
                    b.Navigation("Favorites");

                    b.Navigation("Orders");

                    b.Navigation("ProductRatings");
                });

            modelBuilder.Entity("FoodWebMVC.Models.Order", b =>
                {
                    b.Navigation("OrderDetails");
                });

            modelBuilder.Entity("FoodWebMVC.Models.Product", b =>
                {
                    b.Navigation("Favorites");

                    b.Navigation("OrderDetails");

                    b.Navigation("ProductRatings");
                });
#pragma warning restore 612, 618
        }
    }
}
