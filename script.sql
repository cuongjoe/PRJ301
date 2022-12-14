USE [SEAProject]
GO
/****** Object:  Table [dbo].[action]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[action](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
 CONSTRAINT [PK_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[seaid] [int] NULL,
	[quantity] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[groupid] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [nvarchar](1000) NULL,
	[seaid] [int] NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[customerid] [int] NULL,
	[stateid] [int] NULL,
	[created_at] [datetime] NULL,
	[update_at] [datetime] NULL,
	[orderstateid] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[seaid] [int] NULL,
	[discount] [int] NULL,
	[price] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[orderid] [int] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_state]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_order_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission_action]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission_action](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[licensed] [bit] NULL,
	[permisstionid] [int] NULL,
	[actionid] [int] NULL,
 CONSTRAINT [PK_permission_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sea]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sea](
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[brand] [nvarchar](50) NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](1000) NULL,
	[content] [nvarchar](1000) NULL,
	[issale] [bit] NULL,
	[discount] [int] NULL,
	[stateid] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[categoryid] [int] NULL,
 CONSTRAINT [PK_sea] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[first_name] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[birthday] [date] NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[is_super] [bit] NULL,
	[isactive] [bit] NULL,
	[permission] [nvarchar](50) NULL,
	[avatar] [nvarchar](200) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_permisstion]    Script Date: 11/6/2022 2:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_permisstion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[licensed] [bit] NULL,
	[userid] [int] NULL,
	[permisstionid] [int] NULL,
 CONSTRAINT [PK_user_permisstion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[action] ON 

INSERT [dbo].[action] ([id], [title], [code]) VALUES (1, N'USER', N'READ')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (2, N'ORDER', N'READ')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (3, N'SEA', N'READ')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (4, N'GROUP', N'DELETE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (5, N'GROUP', N'EDIT')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (6, N'GROUP', N'CREATE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (7, N'CATEGORY', N'EDIT')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (8, N'CATEGORY', N'CREATE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (9, N'CATEGORY', N'DELETE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (10, N'ORDER', N'DELETE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (11, N'ORDER_STATE', N'CREATE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (12, N'ORDER_STATE', N'DELETE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (13, N'ORDER_STATE', N'EDIT')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (14, N'ORDER_STATE', N'READ')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (15, N'SEA', N'CREATE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (16, N'SEA', N'DELETE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (17, N'SEA', N'EDIT')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (18, N'STATE', N'CREATE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (19, N'STATE', N'DELETE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (20, N'STATE', N'EDIT')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (21, N'STATE', N'READ')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (22, N'USER', N'DELETE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (23, N'USER', N'EDIT')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (24, N'USER', N'READ')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (1024, N'ORDER', N'READ')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (1028, N'ORDER', N'CREATE')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (1029, N'ORDER', N'EDIT')
INSERT [dbo].[action] ([id], [title], [code]) VALUES (1030, N'ORDER', N'DELETE')
SET IDENTITY_INSERT [dbo].[action] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([id], [userid], [seaid], [quantity], [created_at], [updated_at]) VALUES (2, 4, 10012, 2, CAST(N'1900-01-01T00:00:06.670' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (1, N'TÔM ĐL', 2)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (2, N'Cua', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (3, N'Ghẹ', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (4, N'Tôm', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (5, N'Hàu', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (6, N'Ốc', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (7, N'Bào Ngư', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (8, N'Mực', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (9, N'Cá', 1)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (20, N'Mực ĐL', 2)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (21, N'Cá ', 2)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (22, N'Chả Mực', 3)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (23, N'Ghẹ ĐL', 3)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (24, N'Shashimi', 3)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (25, N'Gia vị', 4)
INSERT [dbo].[Category] ([id], [name], [groupid]) VALUES (26, N'Không tươi2', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 

INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (1, N'cuong', N'nguyen', N'dnhcuong031@gmail.com', N'0867892800', N'na')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (2, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (3, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (4, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (5, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (6, N'Đậu', N'Tuấn', N'dinhcuong031@gmail.com', N'0867892800', N'xóm 5 nghi phong nghi lộc nghệ an')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (7, N'Đậu', N'Tuấn', N'dinhcuong031@gmail.com', N'0867892800', N'xóm 5 nghi phong nghi lộc nghệ an')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (8, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (9, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (10, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (11, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (12, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (13, N'Đậu', N'Tuấn', N'dinhcuong031@gmail.com', N'0867892800', N'xóm 5 nghi phong nghi lộc nghệ an')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (14, N'Đậu', N'Tuấn', N'dinhcuong031@gmail.com', N'0867892800', N'xóm 5 nghi phong nghi lộc nghệ an')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (1002, N'Cường', N'Nguyễn', N'dinhcuong031@gmail.com', N'0383733006', N'Khối Hải Lam ,Phường Nghi Hải ,TX Cửa Lò')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (1003, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
INSERT [dbo].[customer] ([id], [first_name], [last_name], [email], [phone], [address]) VALUES (2003, N'cuong', N'nguyen', N'cuongndhe164018@fpt.edu.vn', N'0867892800', N'Vietnam')
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([id], [name]) VALUES (1, N'Tươi Sống')
INSERT [dbo].[Group] ([id], [name]) VALUES (2, N'Đông Lạnh')
INSERT [dbo].[Group] ([id], [name]) VALUES (3, N'Chế Biến')
INSERT [dbo].[Group] ([id], [name]) VALUES (4, N'GIA VỊ - SỐT')
INSERT [dbo].[Group] ([id], [name]) VALUES (1005, N'Vi')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (1, N'https://product.hstatic.net/1000030244/product/king_acb9ccc565264c229197e2680892898d_grande.jpg', 10012)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (2, N'https://product.hstatic.net/1000030244/product/1_6ddb50f51f2341a894a6409fb02595fa_grande.png', 10014)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (3, N'https://product.hstatic.net/1000030244/product/tom_9a8230de68f04d61a5b5d27a68e2546d_grande.png', 10015)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (4, N'https://product.hstatic.net/1000030244/product/z2044207126018_284d167c0cec8115596d1c1a0ae75344_26a1ef39e21544f999cc955dc509761f_grande.png', 10020)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (5, N'https://product.hstatic.net/1000030244/product/muc__1__9b248b3b9d804d04a745a8e08863c608_grande.png', 10017)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (6, N'https://product.hstatic.net/1000030244/product/z1973641464265_87011858b1e8309456c9068ec1c42d80__5__5a136a9e1eb04e31a4067937c8513d00_grande.png', 10019)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (7, N'https://product.hstatic.net/1000030244/product/06_90eb13f0ca554508b45f7477bcc73032_grande.jpg', 10016)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (8, N'https://product.hstatic.net/1000030244/product/muc_ong__size_20-25__bd3c6b0650ad4135869d572ccc54f302_grande.jpg', 10018)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (9, N'https://product.hstatic.net/1000030244/product/web_141f2f06e02b42ffaec7d475f763922f_grande.jpg', 10011)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (10, N'https://product.hstatic.net/1000030244/product/100_4a38fbd3fc5349d590fab6dee7192fe6_grande.jpg', 10013)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (11, N'https://product.hstatic.net/1000030244/product/1_5e34c41e538e4ff7a4f3c5086980d1cb_grande_a8929bb9c8b149e1b98e76dd2d40c674_grande.png', 10021)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (12, N'https://product.hstatic.net/1000030244/product/cua-thit_9022c7fb2d4745148a5e7401af55e6a4_grande.jpg', 10023)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (13, N'https://product.hstatic.net/1000030244/product/cua-gach_f67c0568ad424e8481fcd9556d264618_grande.jpg', 10022)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (14, N'https://product.hstatic.net/1000030244/product/cua-long_944b75004c7f485c99fefce0ec941fc4_grande.png', 10024)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (15, N'https://product.hstatic.net/1000030244/product/ghe_6093c9d1438442aebf5e2fe7423ea47a_grande.jpg', 10025)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (16, N'https://product.hstatic.net/1000030244/product/z2443218462618_fv7addbdd3bc9a9177fa865b5d4e919f1_b348ebc8d3c7477296c7a83f4ed80761_medium.jpg', 10026)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (17, N'https://product.hstatic.net/1000030244/product/untitled-1_97dc8f58f86d4f40980ee3640def2340_grande.jpg', 10027)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (18, N'https://product.hstatic.net/1000030244/product/22_5ddcd5ff00174ee68f432d572e9597c3_grande.jpg', 10028)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (19, N'https://product.hstatic.net/1000030244/product/tom-su-song_2f96884642d14e03a943a8fc766ae106_grande.png', 10029)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (20, N'https://product.hstatic.net/1000030244/product/z2874524840540_eb3834635383f9fb31a93d46237a3f90_63319d688eed41c483ac6d639657a3da_medium.jpg', 10030)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (21, N'https://product.hstatic.net/1000030244/product/cang-ghe-bach-hoa-2_0f49c1c2de1b44cfbdaefd932ea25975_grande.jpg', 10031)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (22, N'https://product.hstatic.net/1000030244/product/3c011-01_37a4f01b7de042edad820bff25f83caa_grande.png', 10032)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (23, N'https://product.hstatic.net/1000030244/product/1_a9ed0281762d41d1b55b8144a8a5df1d_grande.jpg', 10033)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (24, N'https://product.hstatic.net/1000030244/product/cb-hanh-phuc_738cb31f4d5e4c75a0b205e58eabccec_grande.jpg', 10034)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (25, N'https://product.hstatic.net/1000030244/product/untitled-5-03_e911a9c112fa44f9848a965d3c570cf4_medium.png', 10035)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (26, N'https://product.hstatic.net/1000030244/product/2_7336879e37ba4036a22b7810a4f513a8_grande.png', 10036)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (27, N'https://product.hstatic.net/1000030244/product/sot-bo-cay-1_ea49db9167584765b939a760d0203ec7_grande.jpg', 10037)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (28, N'https://product.hstatic.net/1000030244/product/tomyum_0c2c8c0de7584d9293f9bf2652a76986_grande.jpg', 10038)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (29, N'https://product.hstatic.net/1000030244/product/muoi-hk-1_054d171e66f24449801189db0dd7c2c3_grande.jpg', 10039)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (30, N'https://product.hstatic.net/1000030244/product/tom-bac-bien_552fe6048e844182a816646292ab52ac_grande.jpg', 10040)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (31, N'https://product.hstatic.net/1000030244/product/43ce52242088ddd68499_a53446a2974044deb0ef7a5331b6b54f_grande.jpg', 10041)
INSERT [dbo].[Image] ([id], [image], [seaid]) VALUES (32, N'https://product.hstatic.net/1000030244/product/267756543_761227775279113_3779885466913377812_n_1b66083fa00642d680eca07263f6e1f6_grande.png', 10042)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [userid], [customerid], [stateid], [created_at], [update_at], [orderstateid]) VALUES (2, 3, 1, 1, CAST(N'2022-10-10T00:00:00.000' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[order] ([id], [userid], [customerid], [stateid], [created_at], [update_at], [orderstateid]) VALUES (1002, 3, 1, 1002, CAST(N'2022-10-11T00:00:00.000' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[order] ([id], [userid], [customerid], [stateid], [created_at], [update_at], [orderstateid]) VALUES (1003, 1005, 7, 1002, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [quantity], [seaid], [discount], [price], [created_at], [updated_at], [orderid]) VALUES (4, 30, 10011, 10, 3000000, CAST(N'2022-11-11T00:00:00.000' AS DateTime), CAST(N'2022-11-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[order_detail] ([id], [quantity], [seaid], [discount], [price], [created_at], [updated_at], [orderid]) VALUES (5, 20, 10015, 20, 900000, CAST(N'2022-10-11T00:00:00.000' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[order_detail] ([id], [quantity], [seaid], [discount], [price], [created_at], [updated_at], [orderid]) VALUES (6, 10, 10042, 10, 2000000, NULL, NULL, 1002)
INSERT [dbo].[order_detail] ([id], [quantity], [seaid], [discount], [price], [created_at], [updated_at], [orderid]) VALUES (7, 10, 10039, 10, 1000000, NULL, NULL, 1003)
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[order_state] ON 

INSERT [dbo].[order_state] ([id], [name]) VALUES (1, N'Chờ liên hệ')
INSERT [dbo].[order_state] ([id], [name]) VALUES (1002, N'Chờ lấy hàng')
INSERT [dbo].[order_state] ([id], [name]) VALUES (1003, N'Đang giao hàng')
INSERT [dbo].[order_state] ([id], [name]) VALUES (1004, N'Đã giao hàng')
INSERT [dbo].[order_state] ([id], [name]) VALUES (1005, N'Trả lại hàng')
SET IDENTITY_INSERT [dbo].[order_state] OFF
GO
SET IDENTITY_INSERT [dbo].[permission] ON 

INSERT [dbo].[permission] ([id], [name]) VALUES (1, N'user')
INSERT [dbo].[permission] ([id], [name]) VALUES (2, N'admin')
SET IDENTITY_INSERT [dbo].[permission] OFF
GO
SET IDENTITY_INSERT [dbo].[permission_action] ON 

INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (1, 1, 2, 1)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (2, 1, 2, 2)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (3, 1, 2, 3)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (4, 1, 2, 4)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (5, 1, 2, 5)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (6, 1, 2, 6)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (7, 1, 2, 7)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (8, 1, 2, 8)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (9, 1, 2, 9)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (10, 1, 2, 10)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (11, 1, 2, 11)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (12, 1, 2, 12)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (13, 1, 2, 13)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (14, 1, 2, 14)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (15, 1, 2, 15)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (16, 1, 2, 16)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (17, 1, 2, 17)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (18, 1, 2, 18)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (19, 1, 2, 19)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (20, 1, 2, 20)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (21, 1, 2, 21)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (22, 1, 2, 22)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (23, 1, 2, 23)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (24, 1, 2, 1024)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (2002, 1, 2, 1028)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (2003, 1, 2, 1029)
INSERT [dbo].[permission_action] ([id], [licensed], [permisstionid], [actionid]) VALUES (2004, 1, 2, 1030)
SET IDENTITY_INSERT [dbo].[permission_action] OFF
GO
SET IDENTITY_INSERT [dbo].[sea] ON 

INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10011, N'Cá Mú Trân Châu', N'Cá mú nuôi ở vùng biển  Cam Ranh - Nha Trang', 587000, 100, N'giao s.ống tận nơi hoặc sơ chế theo yêu cầu', N'Hấp Hồng Kong, chưng tương hành gừng , nấu cháo', 1, 5, 2, CAST(N'1900-01-01T00:00:06.673' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10012, N'Cua Hoàng Đế', N'Mỹ/CANADA', 2000000, 50, N'Nhập khẩu s.ống từ Mỹ/Canada', N'Hấp bia', 1, 10, 2, CAST(N'1900-01-01T00:00:06.677' AS DateTime), CAST(N'2022-10-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10013, N'Ốc Hương (100-110 con)', N'Nha Trang,Cà Mau', 260000, 1000, N'Giao s.ống tận nơi trong 2H', N' rang muối, xào bơ, rang me', 1, 25, 2, CAST(N'1900-01-01T00:00:06.680' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10014, N'Tôm Hùm Alaska Lớn', N'Alaska/CANADA', 1290000, 80, N'Con 1kg', N'Hấp thái, nướng phô mai, sốt bơ tỏi,.', 1, 4, 1, CAST(N'1900-01-01T00:00:06.683' AS DateTime), CAST(N'2021-10-11T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10015, N'Tôm Hùm Bông (500-700gr/con)', N' Đảo Bình Hưng - Cam Ranh', 775000, 99, N'Con 500g', N'Hấp nước dừa, hấp thái, nấu lẩu hải sản,', 1, 0, 2, CAST(N'1900-01-01T00:00:06.687' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10016, N'Mực 1 Nắng', N'Biển Mũi Né, Phan Thiết.', 141000, 100, N'Đông lạnh', N' Nướng ớt sa tế, chiên giòn', 1, 0, 2, CAST(N'1900-01-01T00:00:06.690' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10017, N'Mực Khô', N'Cửa Lò/Nghệ An', 447000, 100, N'Đông lạnh -18 độ C hoặc ngăn mát tủ lạnh', N'Nướng, nấu mực khô lấy nước dùng nấu hủ tiếu', 1, 0, 2, CAST(N'1900-01-01T00:00:06.693' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10018, N'Mực Ống Size S', N'Bình Thuận.', 195000, 100, N'Đông lạnh.', N' Hấp gừng, hấp sả', 1, 0, 2, CAST(N'1900-01-01T00:00:06.697' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10019, N'Mực Ống Trứng', N'Cà Mau,Cửa Lò,Kỳ Anh', 180000, 100, N'Đông lạnh.', N' Mực xào, mực hấp sả, mực chiên giòn, mực ram mặn.', 1, 0, 2, CAST(N'1900-01-01T00:00:06.700' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10020, N'Bạch Tuộc Đông Lạnh', N'Bình Thuận/Cam Ranh.', 125000, 50, N'Bảo quản cấp đông.Khay 500g', N'nướng sa tế, nướng tiêu đen, hấp sả, nhúng mẻ....', 1, 0, 2, CAST(N'1900-01-01T00:00:06.703' AS DateTime), CAST(N'2022-10-10T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10021, N'Bào Ngư Hàn Quốc Tươi', N'Hàn Quốc', 440000, 1000, N'bảo quản nhiệt độ tốt nhất từ -18 độ C.', N'bảo quản nhiệt độ tốt nhất từ -18 độ C.', 1, 0, 2, CAST(N'1900-01-01T00:00:06.707' AS DateTime), CAST(N'2022-10-20T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10022, N'Cua Gạch Cửa Lò', N'Nghệ An', 263000, 300, N' Dây mỏng, giao túi lưới gọn gàng sạch sẽ', N' sốt trứng muối, sốt ớt Singapore, sốt me, nấu lẩu tomyum, hấp thái, miến cua,...

Cua gạch Cà Mau s.ống khỏe nên rất phù hợp mang đi tỉnh hoặc làm quà biếu tặng. Đóng thùng xốp tiện lợi.', 1, 0, 2, CAST(N'1900-01-01T00:00:06.710' AS DateTime), CAST(N'2022-10-22T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10023, N'Cua Thịt Cà Mau', N'Cà Mau', 192500, 300, N'Dây mỏng, giao túi lưới gọn gàng sạch sẽ', N'Hấp bia, hấp nước dừa, nướng than, sốt me, sốt trứng muối, miến cua,...', 1, 0, 1, CAST(N'1900-01-01T00:00:06.713' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10024, N'Cua Lông HongKong Cái (7-9con)', N'HongKong & Thượng Hải', 495000, 300, N'Đóng thùng, giao sống tận nơi', N'Cua Lông HongKong Cái chỉ cần hấp cách thuỷ là ngon nhất vì giữ được vị ngon đặc trưng của cua. Cua có gạch béo đặc trưng mà không có loại cua nào có thể sánh được. ', 1, 14, 2, CAST(N'1900-01-01T00:00:06.717' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10025, N'Ghẹ Xanh Quảng Ninh', N'Quảng Ninh', 299500, 400, N'Giao s.ống bằng phương pháp lạnh hoặc giao nước sục oxy', N'sốt me, sốt bơ tỏi, sốt trứng muối, hấp, nấu bánh canh...', 1, 20, 2, CAST(N'1900-01-01T00:00:06.720' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10026, N'Cá Hồi Nguyên Con Tươi (con 5kg)', N'Vùng Biển Cửa lo, Sầm Sơn', 1795000, 400, N' cá hồi tươi 100%, size 5-7kg/con (đã làm sạch ruột, nguyên con, còn đầu).', N'sashimi, cuốn sushi, các món cơm cuộn, nướng, áp chảo, ...', 1, -12, 2, CAST(N'1900-01-01T00:00:06.723' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10027, N'Cá Chim Trắng ( con 0.7 kg)', N'vùng biển miền trung và Vũng Tàu,', 230000, 300, N' giao nguyên con tận nơi hoặc nhận sơ chế theo yêu cầu của Khách (Tỷ lệ hao hụt khi làm sạch từ 10%-16%)', N'chiên giòn, hấp gừng, nấu canh ngọt, nấu lẩu, đặc sắc nhất là cá chim trắng nướng muối ớt.', 1, 0, 2, CAST(N'1900-01-01T00:00:06.727' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10028, N'Cá Trích Phi Lê', N'Bình Thuận', 75000, 300, N'đông lạnh', N'Cá trích Phile được sơ chế từ những con cá trích tươi sống, loại bỏ xương chỉ lấy phần thịt ở 2 bên thân cá. ', 1, 0, 2, CAST(N'1900-01-01T00:00:06.730' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10029, N'Tôm Sú Sống (500g)', N'Cà Mau', 235000, 400, N'Giao s.ống tận nơi kèm nước và oxi', N'sốt thái ăn s.ống, sốt phô mai, sốt trứng muối, hấp nước dừa, hấp thái, làm món lẩu hải sản, tomyum thơm ngon,...', 1, 0, 2, CAST(N'1900-01-01T00:00:06.733' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10030, N'Tôm Tít Hấp Nguyên Con ( khay 500gr )', N'Cà Mau', 255000, 400, N'đông lạnh', N' rang muối Hồng Kong, sốt bơ tỏi, sốt phô mai, sốt trứng muối, sốt tứ xuyên hoặc hấp nóng chấm muối xanh.', 1, 0, 2, CAST(N'1900-01-01T00:00:06.737' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10031, N'Càng Ghẹ Bách Hoa Khay 240g', N'Việt Nam', 99000, 300, N'Đông lạnh', N'12 tháng kể từ NSX, bảo quản nhiệt độ tốt nhất từ -18 độ C.

Cách chế biến: Không cần rã đông, chiên ngập dầu đến khi vàng làm món khai vị hoặc ăn kèm trong buổi cơm.', 1, 2, 2, CAST(N'1900-01-01T00:00:33.337' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 23)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10032, N'Combo Sashimi 3C', N'Na uy', 380000, 400, N'Hướng dẫn sử dụng: Dùng ngay khi nhận hàng hoặc làm lạnh khoảng 15" trước khi ăn.', N'▪️ Cá hồi Nauy (150gr) | Cá trích ép trứng (80gr) | Sò đỏ Canada (100gr)
▪️ Gia vị ăn kèm: wasabi, gừng hồng, củ cải trắng, nước tương Nhật', 1, 5, 2, CAST(N'1900-01-01T00:00:33.347' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 24)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10033, N'sống 
Chia sẻ
Combo Gia Đình', N'Nhật', 930000, 300, N'Hướng dẫn sử dụng: Dùng ngay khi nhận hàng hoặc làm lạnh 10-15phút sẽ ngon hơn.', N'Bộ Combo Gia Đình mang đến cho gia đình bạn một bữa ăn trọn vẹn gồm 5 sản phẩm:

▪️  Sashimi cá Hồi 300g| Sashimi Cá Trích Ép Trứng| Sushi Mix 4B| Maki Bơ & Cá Ngừ| Salad Mix 7A

▪️ Gia vị ăn kèm :Sốt Maki, Sốt Salad,wasabi, gừng hồng, củ cải trắng, nước tương Nhật', 1, 15, 2, CAST(N'1900-01-01T00:00:33.350' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 24)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10034, N'Combo Hạnh Phúc', N'Nhật', 440000, 300, N'Hướng dẫn sử dụng:  Dùng ngay khi nhận hàng hoặc làm lạnh khoảng 15" trước khi ăn.', N'Bộ Combo Hạnh Phúc mang đến cho các bạn một bữa ăn trọn vẹn gồm 3 sản phẩm:

▪️ Cơm Lươn Sốt Teriyaki | Sushi Mix 8A | Salad Thanh Cua

▪️ Gia vị ăn kèm : wasabi, gừng hồng, củ cải trắng, nước tương Nhật', 1, 9, 2, CAST(N'1900-01-01T00:00:33.360' AS DateTime), CAST(N'2022-10-01T00:00:00.000' AS DateTime), 24)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10035, N'Sashimi Cá Trích Ép Trứng', N'Nhật', 150000, 300, N'Hướng dẫn sử dụng: Dùng ngay khi nhận hàng hoặc làm lạnh khoảng 15 phút trước khi ăn.', N'▪️ Cá trích ép trứng 120gr
▪️ Gia vị ăn kèm : wasabi, gừng hồng, củ cải trắng, nước tương Nhật', 1, 0, 2, CAST(N'1900-01-01T00:00:33.367' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime), 24)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10036, N'[ YOChef ] Combo 3 Sốt Nướng', N'China', 163000, 100, N'Bảo quản: bảo quản đông lạnh <= -18 độ C.', N'Bộ Combo 3 Sốt Nướng Siêu Ngon Tiện Lợi gồm Sốt Phô Mai Nướng, Sốt Sa Tế Nướng & Sốt Bơ Tỏi chế biến với Hải Sản nhanh chóng, tiện lợi và cực kì thích hợp trong những buổi tiệc với người thân, bạn bè.

Hướng dẫn sử dụng: chọn hải sản phù hợp, phủ sốt lên bề mặt hải sản sau đó nướng chín và thưởng thức ngay.', 1, 8, 2, CAST(N'1900-01-01T00:00:33.370' AS DateTime), NULL, 25)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10037, N'[ YOChef ] Sốt Bơ Cay', N'China', 60000, 50, N'Bảo quản : dưới 5 độ C. Tránh ánh nắng trực tiếp', N'Thành phần : bơ, tỏi, đường, cốt dừa, muối,ớt, kem.

Gợi ý hải sản phù hợp : ghẹ, cua, ốc hương, ốc nhảy,...Định lượng 1 túi 200gram dùng đủ cho 1kg -1.5kg hải sản.

Hướng dẫn sử dụng : Sốt gia vị hoàn chỉnh. Chọn hải sản phù hợp cần chế biến, làm chín hải sản, nấu sốt lại cho nóng và cho sốt vào hải sản, trộn đều và sử dụng. Ngon hơn khi ăn kèm với bánh mì nóng', 1, 0, 2, CAST(N'1900-01-01T00:00:33.377' AS DateTime), NULL, 25)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10038, N'[ YOChef ] Nước Lẩu Thái Tomyum', N'Nhật', 79000, 50, N'Bảo quản : ngăn mát hoặc ngăn đông', N'Thành phần : Nước dùng gà, tomym paste, sa tế tôm, sữa tươi, nước mắm, đường thốt nốt, gừng, sả cây, lá chanh,...

Xuất xứ : YoChef.Đảo Hải Sản 

Hướng dẫn sử dụng : Dùng trực tiếp hoặc điều chỉnh thêm nước tùy thích để phù hợp rồi cho hải sản và rau ăn kèm. Túi 500gram dùng cho khoảng 1-2 người', 1, 0, 2, CAST(N'1900-01-01T00:00:33.383' AS DateTime), NULL, 25)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10039, N'
Chia sẻ
[ YOChef ] Muối HongKong', N' HongKong', 45000, 50, N'Bảo quản : bảo quản khô ráo, tránh ánh nắng trực tiếp.HSD 6 tháng kể từ ngày sản xuất', N'Muối HongKong thuộc loại muối gia vị với hương vị hoàn chỉnh, thành phần chủ yếu là tép khô, nếp, bột ớt, bột mì, bột hành,...

Hướng dẫn sử dụng : chọn hải sản phù hợp cần chế biến, làm chín hải sản, cho muối trộn đều cho thấm vào hải sản và sử dụng ngay.', 1, 0, 2, CAST(N'1900-01-01T00:00:33.387' AS DateTime), NULL, 25)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10040, N'Tôm Bạc Biển', N'Bình Thuận', 250000, 80, N'Bảo quản: nhiệt độ dưới -18 độ C', N'Quy cách: đóng khay 500g, size 10-13 con/khay 

Tình trạng: đông lạnh

Xuất xứ: Bình Thuận', 1, NULL, 2, CAST(N'1900-01-01T00:00:33.390' AS DateTime), NULL, 1)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10041, N'Tôm Sú Biển 8 - 10 con', N'Cam Ranh - Khánh Hòa', 410000, 50, N'HSD/ bảo quản: bảo quản nhiệt độ tốt nhất -18 độ C ( 12 tháng kể từ ngày sản xuất )', N'Quy cách: đóng khay 500gr, size 8 - 10con/kg

Tình trạng: đông lạnh 

Xuất Xứ: Cam Ranh - Khánh Hòa', 1, NULL, 2, CAST(N'1900-01-01T00:00:33.393' AS DateTime), NULL, 1)
INSERT [dbo].[sea] ([id], [name], [brand], [price], [quantity], [description], [content], [issale], [discount], [stateid], [created_at], [updated_at], [categoryid]) VALUES (10042, N'Tôm Mũ Ni Tươi 5-7 Con', N'Cam Ranh - Khánh Hòa', 390000, 50, N'đông lạnh ', N'HSD/ bảo quản: bảo quản nhiệt độ tốt nhất -18 độ C ( 12 tháng kể từ ngày sản xuất )

Món ngon: hấp nước dừa, hấp thái, nấu lẩu, sốt trứng muối, sốt bơ tỏi, sốt phô mai, sốt me, ram mặn, nướng sa tế,...', 1, NULL, 2, CAST(N'1900-01-01T00:00:33.397' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[sea] OFF
GO
SET IDENTITY_INSERT [dbo].[state] ON 

INSERT [dbo].[state] ([id], [name]) VALUES (1, N'Hết Hàng')
INSERT [dbo].[state] ([id], [name]) VALUES (2, N'Còn Hàng')
SET IDENTITY_INSERT [dbo].[state] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (2, N'khanhlc', N'1234', N'Khanh', N'Le', CAST(N'2002-12-13' AS Date), N'khanhlc', N'4434', 1, 1, 1, N'1', N'1', CAST(N'2022-11-11T00:00:00.000' AS DateTime), CAST(N'2022-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (3, N'cuongkk', N'1234', N'cuong', N'nguyen', CAST(N'2002-10-22' AS Date), N'cuongndhe164018@gmail.com', N'384710247', 1, NULL, NULL, N'1', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (4, N'cuongtotbung', N'12345', N'cuong', N'nguyen', CAST(N'2002-10-02' AS Date), N'cuongndhe1640189@gmail.com', N'2553445', 1, 1, 1, N'1', N'', CAST(N'2022-10-11T00:00:00.000' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (1002, N'cuongkk1234', N'1234', N'cuong', N'nguyen', CAST(N'2002-10-22' AS Date), N'cuongndhe164018@gmail.com', N'384710247', 1, NULL, NULL, N'blala', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (1003, N'cuongkk1234', N'1234', N'cuong', N'nguyen', CAST(N'2002-10-22' AS Date), N'cuongndhe164018@gmail.com', N'384710247', 1, NULL, NULL, N'blala', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (1004, N'cuongkk1234', N'1234', N'cuong', N'nguyen', CAST(N'2002-10-22' AS Date), N'cuongndhe164018@gmail.com', N'384710247', 1, NULL, NULL, N'', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (1005, N'cuongnd', N'1234', N'cuong', N'nguyen', CAST(N'2002-10-01' AS Date), N'cuong@gmail.com', N'086789200', 1, 1, 1, N'1', N'1', CAST(N'2022-10-11T00:00:00.000' AS DateTime), CAST(N'2022-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [first_name], [lastname], [birthday], [email], [phone], [gender], [is_super], [isactive], [permission], [avatar], [created_at], [updated_at]) VALUES (1006, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[user_permisstion] ON 

INSERT [dbo].[user_permisstion] ([id], [licensed], [userid], [permisstionid]) VALUES (6, 1, 3, 2)
INSERT [dbo].[user_permisstion] ([id], [licensed], [userid], [permisstionid]) VALUES (1002, 1, 2, 2)
INSERT [dbo].[user_permisstion] ([id], [licensed], [userid], [permisstionid]) VALUES (1003, 1, 1005, 2)
SET IDENTITY_INSERT [dbo].[user_permisstion] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_sea] FOREIGN KEY([seaid])
REFERENCES [dbo].[sea] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_sea]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_user1] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_user1]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Group] FOREIGN KEY([groupid])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Group]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_sea] FOREIGN KEY([seaid])
REFERENCES [dbo].[sea] ([id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_sea]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_customer] FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_customer]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_order_state] FOREIGN KEY([orderstateid])
REFERENCES [dbo].[order_state] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_order_state]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([orderid])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_sea] FOREIGN KEY([seaid])
REFERENCES [dbo].[sea] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_sea]
GO
ALTER TABLE [dbo].[permission_action]  WITH CHECK ADD  CONSTRAINT [FK_permission_action_action] FOREIGN KEY([actionid])
REFERENCES [dbo].[action] ([id])
GO
ALTER TABLE [dbo].[permission_action] CHECK CONSTRAINT [FK_permission_action_action]
GO
ALTER TABLE [dbo].[permission_action]  WITH CHECK ADD  CONSTRAINT [FK_permission_action_permission] FOREIGN KEY([permisstionid])
REFERENCES [dbo].[permission] ([id])
GO
ALTER TABLE [dbo].[permission_action] CHECK CONSTRAINT [FK_permission_action_permission]
GO
ALTER TABLE [dbo].[sea]  WITH CHECK ADD  CONSTRAINT [FK_sea_Category1] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[sea] CHECK CONSTRAINT [FK_sea_Category1]
GO
ALTER TABLE [dbo].[sea]  WITH CHECK ADD  CONSTRAINT [FK_sea_state1] FOREIGN KEY([stateid])
REFERENCES [dbo].[state] ([id])
GO
ALTER TABLE [dbo].[sea] CHECK CONSTRAINT [FK_sea_state1]
GO
ALTER TABLE [dbo].[user_permisstion]  WITH CHECK ADD  CONSTRAINT [FK_user_permisstion_permission1] FOREIGN KEY([permisstionid])
REFERENCES [dbo].[permission] ([id])
GO
ALTER TABLE [dbo].[user_permisstion] CHECK CONSTRAINT [FK_user_permisstion_permission1]
GO
ALTER TABLE [dbo].[user_permisstion]  WITH CHECK ADD  CONSTRAINT [FK_user_permisstion_user1] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[user_permisstion] CHECK CONSTRAINT [FK_user_permisstion_user1]
GO
