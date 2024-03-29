USE [Apple]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/14/2024 1:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](255) NOT NULL,
	[pass] [nvarchar](255) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[Email] [varchar](255) NULL,
	[Name] [varchar](255) NULL,
	[phone] [varchar](13) NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/14/2024 1:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/14/2024 1:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateId] [int] NOT NULL,
	[CateName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordered]    Script Date: 3/14/2024 1:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordered](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/14/2024 1:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1000) NOT NULL,
	[Price] [float] NOT NULL,
	[Color] [varchar](255) NULL,
	[Images] [text] NULL,
	[Description] [text] NULL,
	[CateId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 3/14/2024 1:33:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_session] [nvarchar](50) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_mail] [nvarchar](50) NOT NULL,
	[user_phone] [nvarchar](20) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[message] [nvarchar](4000) NOT NULL,
	[amount] [nvarchar](20) NOT NULL,
	[payment] [nvarchar](30) NOT NULL,
	[status] [nvarchar](30) NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (1, N'admin', N'1234', 1, N'', N'', N'', N'')
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (2, N'admin1', N'1234', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (3, N'user', N'123456', 0, N'user@gmail.com', N'123456789', N'Nguyen Van A', N'Hoan Kiem')
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (4, N'usertest', N'123456', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (5, N'user1', N'1234', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (6, N'user2', N'123456', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (7, N'user3', N'1234', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (8, N'user4', N'123', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([uID], [user], [pass], [isAdmin], [Email], [Name], [phone], [address]) VALUES (9, N'test', N'123', 0, N'adc@gamil.com', N'Vu Minh Dang', N'09876', N'Ha Noi')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (1, N'IPhone')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (2, N'IPad')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (3, N'MacBook')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (4, N'Watch')
INSERT [dbo].[Category] ([CateId], [CateName]) VALUES (5, N'Phukien')
GO
SET IDENTITY_INSERT [dbo].[ordered] ON 

INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (1, 2, 1, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (2, 3, 2, 3)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (3, 2, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (4, 3, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (5, 4, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (6, 33, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (7, 21, 4, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (8, 27, 5, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (9, 29, 5, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (10, 8, 5, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (11, 1, 6, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (12, 4, 6, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (13, 20, 7, 3)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (14, 3, 7, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (15, 1, 7, 1)
SET IDENTITY_INSERT [dbo].[ordered] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (1, N'IPhone 15 128GB', 999, N'Green', N'https://shopdunk.com/images/thumbs/0019776_green_550.jpeg', N'6.1 inch, OLED, Super Retina XDR, 2556 x 1179 Pixels48.0 MP + 12.0 MP12.0 MPApple A16 Bionic128 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (2, N'IPhone 15 Plus 128GB', 1200, N'Blue', N'https://shopdunk.com/images/thumbs/0019940_iphone-15-plus-128gb_550.jpeg', N'6.7 inch, OLED, Super Retina XDR, 2796 x 1290 Pixels
48.0 MP + 12.0 MP
12.0 MP
Apple A16 Bionic
128 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (3, N'IPhone 15 Pro 128GB', 1500, N'White Titanium', N'https://shopdunk.com/images/thumbs/0019569_titan-trang_550.jpeg', N'6.1 inch, OLED, Super Retina XDR, 2556 x 1179 Pixels
48.0 MP + 12.0 MP + 12.0 MP
12.0 MP
Apple A17 Pro
128 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (4, N'IPhone 15 ProMax 256GB', 1800, N'Blue Titanium', N'https://shopdunk.com/images/thumbs/0020074_iphone-15-pro-max-128gb_550.jpeg', N'6.7 inch, OLED, Super Retina XDR, 2556 x 1179 Pixels
48.0 MP + 12.0 MP + 12.0 MP
12.0 MP
Apple A17 Pro
256 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (5, N'IPhone 14 128GB', 899, N'Yellow', N'https://shopdunk.com/images/thumbs/0013751_yellow_550.jpeg', N'6.1 inch, OLED, Super Retina XDR, 2532 x 1170 Pixels
12.0 MP + 12.0 MP
12.0 MP
Apple A15 Bionic
128 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (6, N'IPhone 14 Plus 128GB', 989, N'Violet', N'https://shopdunk.com/images/thumbs/0009523_iphone-14-plus-128gb_550.webp', N'6.7 inch, AMOLED, Super Retina XDR, 2778 x 1284 Pixels
12.0 MP + 12.0 MP
12.0 MP
Apple A15 Bionic
128 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (7, N'IPhone 14 Pro 128GB', 1199, N'Deep Purple', N'https://shopdunk.com/images/thumbs/0008735_iphone-14-pro-128gb_550.png', N'6.1 inch, OLED, Super Retina XDR, 2556 x 1179 Pixels
48.0 MP + 12.0 MP + 12.0 M
12.0 MP
Apple A16 Bionic
128 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (8, N'IPhone 14 ProMax 128GB', 1300, N'Silver', N'https://shopdunk.com/images/thumbs/0018642_silver_550.jpeg', N'6.7 inch, OLED, Super Retina XDR, 2796 x 1290 Pixels
48.0 MP + 12.0 MP + 12.0 MP
12.0 MP
Apple A16 Bionic
128 GB', 1)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (9, N'IPad gen 9 10.2 inch WiFi 64GB', 300, N'Space Gray', N'https://shopdunk.com/images/thumbs/0006309_space-gray_550.webp', N'10.2 inch, IPS LCD, Liquid Retina HD, 2160 x 1620 Pixels
8.0 MP
12.0 MP
Apple A13 Bionic
64 GB', 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (10, N'IPad Gen 10 th 10.9 inch WiFi 64GB', 500, N'Pink', N'https://shopdunk.com/images/thumbs/0022986_pink_550.jpeg', N'10.9 inch, Liquid Retina HD, 2360 x 1640 Pixels12.0 MP12.0 MPApple A14 Bionic64 GB', 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (11, N'IPad Air 4 WiFi Cellular 64GB', 600, N'Space Gray', N'https://shopdunk.com/images/thumbs/0019398_ipad-air-5-wifi-cellular-256gb_550.webp', N'10.9 inch, IPS LCD, Liquid Retina HD, 2360 x 1640 Pixels
12.0 MP
7.0 MP
Apple A14 Bionic
64 GB', 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (12, N'IPad Air 5 WiFi Cellular 64GB', 650, N'Blue', N'https://shopdunk.com/images/thumbs/0019367_ipad-air-5-wifi-cellular-64gb_550.webp', N'10.9 inch, Retina, Liquid Retina HD, 2360 x 1640 Pixels
12.0 MP
12.0 MP
Apple M1
64 GB', 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (13, N'IPad Pro M2 12.9 inch WiFi 128GB', 1399, N'Silver', N'https://shopdunk.com/images/thumbs/0007313_ipad-pro-m2-129-inch-wifi-128gb_550.webp', N'12.9 inch, Retina, Liquid Retina HD, 2732 x 2048 Pixels
12.0 MP + 10.0 MP
12.0 MP
Apple M2
128 GB', 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (14, N'IPad Pro M2 11 inch WiFi 128GB', 1000, N'Space Gray', N'https://shopdunk.com/images/thumbs/0007072_ipad-pro-m2-11-inch-wifi-128gb_550.png', N'11.0 inch, Retina, Liquid Retina HD, 2388 x 1668 Pixels
12.0 MP + 10.0 MP
12.0 MP
Apple M2
128 GB', 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (15, N'IPad mini 6', 499, N'Purple', N'https://shopdunk.com/images/thumbs/0001087_purple_550.webp', N'8.3 inch, IPS LCD, Liquid Retina HD, 2048 x 1536 Pixels
12.0 MP
12.0 MP
Apple A15 Bionic
64 GB', 2)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (16, N'MacBook Air M1 2020 (8GB RAM | 256GB SSD)', 900, N'Gold', N'https://shopdunk.com/images/thumbs/0006171_gold_550.webp', N'13.3 inch, 2560 x 1600 Pixels, IPS, IPS LCD LED Backlit, True Tone
Apple, M1
8 GB, LPDDR4
SSD 256 GB
Apple M1 GPU 7 nhân', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (17, N'MacBook Air M2 2022 (8GB RAM | 256GB SSD)', 1299, N'Starlight', N'https://shopdunk.com/images/thumbs/0008525_macbook-air-136-inch-m2-chip-with-8-core-cpu-and-8-core-gpu-256gb_550.png', N'13.6 inch, 2560 x 1644 Pixels, IPS, 60, 500 nits, Retina
Apple, M2, 8 - Core
8 GB, LPDDR4, 3200 MHz
SSD 256 GB
Apple M2 GPU 8 nhân', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (18, N'MacBook Air 15 inch M2 (8GB RAM | 256GB SSD)', 1499, N'Midnight', N'https://shopdunk.com/images/thumbs/0017889_midnight_550.jpeg', N'15.0 inch, 2880 x 1800 Pixels, OLED, 60, 500 nits, Liquid Retina
Apple, M2, 8 - Core
8 GB, Hãng không công b?, Hãng không công b? MHz
SSD 256 GB
Apple M2 GPU 10 nhân', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (19, N'MacBook Pro 13 inch M2 (10 core| 8GB RAM| 256GB SSD)', 1549, N'Silver', N'https://shopdunk.com/images/thumbs/0008682_macbook-pro-13-inch-m2-10-core-8gb-ram-256gb-ssd_240.png', N'13.3 inch, 2560 x 1600 Pixels, OLED, Hãng không công b?, 500 nits, Retina
Apple, M2, 8 - Core
8 GB, LPDDR4, 3200 MHz
SSD 256 GB
Apple M2 GPU 10 nhân', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (20, N'MacBook Pro 16 inch M2 Pro (19 Core| 16GB| 512GB)', 2799, N'SpaceGray', N'https://shopdunk.com/images/thumbs/0011410_space-gray_550.jpeg', N'16.2 inch, 3456 x 2234 Pixels, OLED, 120, 1000 nits, Retina
Apple, M2 Pro, 12-Core
16 GB (1 thanh 16 GB), Hãng không công b?, Hãng không công b? MHz
SSD 512 GB
Apple M2 Pro 16-core GPU', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (21, N'MacBook Pro 16 inch M2 Max (38 Core| 64GB| 1TB) - CTO', 4500, N'Silver', N'https://shopdunk.com/images/thumbs/0011555_macbook-pro-16-inch-m2-max-38-core-64gb-1tb-cto_550.jpeg', N'16.2 inch, 3456 x 2234 Pixels, OLED, 120, 1000 nits, Retina
Apple, M2 Max, 12-Core
64 GB, Hãng không công b?, Hãng không công b? MHz
SSD 1 TB
Apple M2 Max 38-core GPU', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (22, N'iMac M1 2021 24 inch (7 Core GPU/8GB/256GB)', 1399, N'Pink', N'https://shopdunk.com/images/thumbs/0010498_pink_550.webp', N'24 inch, 4480 x 2520 Pixels, Retina
Apple, M1, 8 - Core
8 GB, LPDDR4
Apple M1 GPU 7 nhân', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (23, N'Mac mini M2 Pro (16-Core GPU| 16GB RAM | 512GB SSD)', 1599, N'None', N'https://shopdunk.com/images/thumbs/0012355_mac-mini-m2-pro-16-core-gpu-16gb-ram-512gb-ssd_550.webp', N'Apple, M2 Pro, 10-Core
16 GB
SSD 512 GB
Apple M2 Pro 16-core GPU', 3)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (24, N'Apple Watch Series 7 Thép GPS + Cellular', 600, N'Silver', N'https://shopdunk.com/images/thumbs/0001048_apple-watch-series-7-thep-gps-cellular_550.png', N'1.61 inch, LTPO OLED, 430 x 352 Pixels
32 GB
Vi?n máy: Nh?a', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (25, N'Apple Watch Series 8 41mm nhôm GPS', 400, N'Red', N'https://shopdunk.com/images/thumbs/0002083_product-red_550.png', N'1.9 inch, Retina, 484 x 396 Pixels
Dây: Cao su - Nhôm', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (26, N'Apple Watch Series 9 Nhôm (GPS) 41mm | Sport Band', 500, N'Pink', N'https://shopdunk.com/images/thumbs/0020412_pink_550.jpeg', N'1.9 inch, OLED
Dây: Cao su - Nhôm', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (27, N'Apple Watch SE Nhôm 2022 GPS', 300, N'Black', N'https://shopdunk.com/images/thumbs/0011842_midnight_550.webp', N'1.61 inch, LTPO OLED, 448 x 368 Pixels
Apple S5
32 GB
M?t kính: Kính cu?ng l?c - Dây: Cao su', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (28, N'Apple Watch SE 2023 GPS + Cellular Sport Band', 350, N'Starlight', N'https://shopdunk.com/images/thumbs/0022387_starlight_550.jpeg', N'1.56 inch, Retina
Dây: Cao su - Nhôm', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (29, N'Apple Watch Ultra 2 GPS + Cellular 49mm Ocean Band', 999, N'Orange', N'https://shopdunk.com/images/thumbs/0021384_orange_550.jpeg', N'1.92 inch, OLED', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (30, N'Apple Watch Ultra 2 GPS + Cellular 49mm Alpine Loop', 989, N'Olive', N'https://shopdunk.com/images/thumbs/0021437_olive_550.jpeg', N'1.92 inch, OLED', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (31, N'Apple Watch Ultra 2 GPS + Cellular 49mm Trail Loop', 989, N'Beige', N'https://shopdunk.com/images/thumbs/0021538_orangebeige_550.jpeg', N'1.92 inch, OLED', 4)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (32, N'Apple AirPods 2', 120, N'None', N'https://shopdunk.com/images/thumbs/0015613_airpods-2_550.jpeg', N'Headphones: Use 5 hours
Charging box: Use 24 hours', 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (33, N'Apple AirPods 3', 190, N'None', N'https://shopdunk.com/images/thumbs/0006059_tai-nghe-apple-airpods-3-sac-co-day-lightning_550.jpeg', N'Headphones: Use 6 hours
Charging box: Use 30 hours
Spatial studio, 3D Sound, Dolby Atmos', 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (34, N'Apple AirPods Pro (2021)', 230, N'None', N'https://shopdunk.com/images/thumbs/0012020_airpods-pro-2021_550.webp', N'Headphones: Use 6 hours
Charging box: Use 30 hours
Active Noise Cancellation
Apple H2 chip
Adaptive EQ', 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (35, N'Apple AirPods Pro 2 (USB-C) 2023', 290, N'None', N'https://shopdunk.com/images/thumbs/0022022_airpods-pro-2-usb-c-2023_550.jpeg', N'Headphones: Use 6 hours
Charging box: Use 30 hours
Active Noise Cancellation
Apple H2 chip
Apple U1 chip in MagSafe Charging Case
Adaptive EQ', 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (36, N'Apple AirPods Max', 590, N'Blue', N'https://shopdunk.com/images/thumbs/0012010_sky-blue_550.webp', N'Use 20 hours - Charge 3 hours
Spatial Audio
Active Noise Cancellation
Apple H1 chip
Adaptive EQ
Transparency Mode', 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (37, N'Magic Mouse 2', 55, N'White', N'https://shopdunk.com/images/thumbs/0001442_white_550.jpeg', N'Use 600 hours - Charge 3 hours', 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (38, N'Magic Keyboard', 110, N'White', N'https://shopdunk.com/images/thumbs/0002365_magic-keyboard_550.jpeg', N'Use 600 hours - Charge 3 hours', 5)
INSERT [dbo].[Product] ([Id], [Name], [Price], [Color], [Images], [Description], [CateId]) VALUES (39, N'Pencil 2', 100, N'White', N'https://shopdunk.com/images/thumbs/0001417_pencil-2_550.png', N'Length: 166 mm (6.53 inches)
Diameter: 8.9 mm (0.35 inch)
Weight: 20.7 grams (0.73 ounces)', 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (1, N'user', N'Test', N'test@gmail.com', N'098765', N'test', N'test', N'1200.00', N'0', NULL, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (2, N'test', N'Vu Minh Dang', N'adc@gamil.com', N'09876', N'Ha Noi', N'', N'4500.00', N'1', N'done', CAST(N'2024-10-02' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (3, N'test', N'Vu Minh Dang', N'adc@gamil.com', N'09876', N'Ha Noi', N'', N'4690.00', N'0', N'0', CAST(N'2024-10-02' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (4, N'user', N'12345678', N'user@gmail.com', N'Nguyen Van A', N'Cau Giay', N'Ship nhanh', N'4500.00', N'1', N'1', CAST(N'2024-11-02' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (5, N'user', N'Nguyen Van A', N'user@gmail.com', N'123456789', N'Cau Giay', N'', N'2599.00', N'1', N'1', CAST(N'2024-11-02' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (6, N'user', N'Nguyen Van A', N'user@gmail.com', N'123456789', N'Cau Giay', N'', N'2799.00', N'1', N'1', CAST(N'2024-11-02' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (7, N'user', N'Nguyen Van A', N'user@gmail.com', N'123456789', N'Cau Giay', N'', N'1500', N'1', N'1', CAST(N'2024-11-02' AS Date))
SET IDENTITY_INSERT [dbo].[transactions] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_cart_product]
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transactions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([CateId])
GO
