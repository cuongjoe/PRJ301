<%-- 
    Document   : index
    Created on : Feb 24, 2022, 3:45:58 PM
    Author     : giaki
--%>


<%@page import="model.product.Sea"%>
<%@page import="dal.product.SeaDBContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.product.Group"%>
<%@page import="dal.product.GroupDBContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%
            GroupDBContext groupDB = new GroupDBContext();
            ArrayList<Group> groups = groupDB.list();
            request.setAttribute("groups", groups);
            SeaDBContext seaDB = new SeaDBContext();
            ArrayList<Sea> seas = seaDB.getSeas("", -1, -1, 1, 12,"","");
            request.setAttribute("seas", seas);
        %>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    </head>
    <style>
        .swiper {
            width: 100%;
            height: 100%;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
    </style>
    <body class="bg-teal-500">
        <jsp:include page="/views/base/header.jsp" />
        <div class="w-full h-[480px]">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="images/cualong.webp" class="container h-full"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="images/cahoi.webp" class="container h-full"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="images/ochuong.jpg" class="container h-full"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="images/kinggrap.webp" class="container h-full"/>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
            <div class="container mx-auto">
                <div class="text-center mt-10 w-full">
                    <h3 class="text-4xl text-red-600">DANH MỤC SẢN PHẨM</h3>
                    <div class="grid grid-cols-3 w-full mt-10 space-x-5">
                        <a href="/cuongproject/sea" class="block max-w-lg bg-white rounded-lg border border-gray-200 shadow-sm hover:bg-gray-1000">
                            <img src="images/shashimi.webp" style="width: 100%"/>
                            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">SEAFOOD</h5>
                        </a>
                        <a href="/cuongproject/sea" class="block max-w-lg bg-white rounded-lg border border-gray-200 shadow-sm hover:bg-gray-1000">
                            <img src="images/camu.jpg" style="width: 100%"/>
                            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Tươi Sống</h5>
                        </a>
                        <a href="/cuongproject/sea" class="block max-w-lg bg-white rounded-lg border border-gray-200 shadow-sm hover:bg-gray-1000">
                            <img src="images/donglanh.jpg" style="width: 100%"/>
                            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Đông lạnh</h5>
                        </a>
                    </div>
                </div>
                <div class="text-center mt-10 w-full">
                    <h3 class="text-4xl text-red-600">SẢN PHẨM NỔI BẬT</h3>
                    <div class="grid grid-cols-4 gap-6 mt-10 <%=seas.size() <= 0 ? "hidden" : ""%>">
                        <c:forEach items="${seas}" var="sea">
                            <div class="bg-white rounded-lg shadow-md flex flex-col relative">
                                <c:if test="${sea.isSale}">
                                    <span class="absolute -top-5 -right-5 bg-red-600 text-white text-sm flex justify-center text-center font-semibold inline-flex items-center w-10 h-10 rounded-full">
                                        ${sea.discount}%
                                    </span>
                                </c:if>
                                <a href="/cuongproject/sea/detail?id=${sea.getId()}">
                                    <img class="rounded-t-lg w-full h-[280px]" src="${sea.getImages().get(sea.getImages().size()-1).getImage()}" alt="product image" />
                                </a>
                                <div class="px-5 pb-5 mt-4 flex flex-col flex-1">
                                    <a class="mb-10" href="/cuongproject/sea/detail?id=${sea.getId()}">
                                        <h3 class="text-xl font-semibold tracking-tight text-gray-900 dark:text-white" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">${sea.getName()}</h3>
                                    </a>
                                    <div class="flex justify-center items-end mt-auto">
                                        <c:choose>
                                            <c:when test="${sea.isSale}">
                                                <span class="text-xl line-through font-medium text-gray-900" id="price-not-discount-${sea.id}">${sea.price}</span>
                                                <span class="ml-2 text-md font-medium text-red-500" id="price-${sea.id}">
                                                    ${sea.price-sea.price*sea.discount/100}
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-xl font-medium text-gray-900" id="price-not-discount-${sea.id}">${sea.price}</span>
                                                </c:otherwise>
                                            </c:choose>

                                        </span>
                                        <script>
                                            var price = Number.parseInt($("#price-${sea.id}").text());
                                            price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#price-${sea.id}").text(price);

                                            var discount_price = Number.parseInt($("#price-not-discount-${sea.id}").text());
                                            discount_price = discount_price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#price-not-discount-${sea.id}").text(discount_price);
                                        </script>
                                    </div>
                                    <button type="button" onclick="addToCart(${sea.id})" class="mt-5 text-white bg-red-600 hover:bg-red-600 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-3 py-2 text-center">Add to cart</button>
                                </div>
                            </div>
                        </c:forEach> 
                    </div>
                </div>
            </div>
            <div>
                <jsp:include page="/views/base/footer.jsp" />
            </div>
        </div>
        <jsp:include page="/views/base/footerImport.jsp" />
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
                                        var swiper = new Swiper(".mySwiper", {
                                            loop: true,
                                            centeredSlides: true,
                                            autoplay: {
                                                delay: 2500,
                                                disableOnInteraction: false,
                                            },
                                            pagination: {
                                                el: ".swiper-pagination",
                                                dynamicBullets: true,
                                            },
                                        });
                                        const addToCart = (seaId) => {
                                            console.log(seaId);
                                            $("#cart-quantity").removeClass("hidden")
                                            const data = {
                                                seaId: seaId,
                                                quantity: 1,
                                            }
                                            $.ajax({
                                                method: "POST",
                                                url: "/cuongproject/addCart",
                                                data: data,
                                            }).done(function (data) {
                                                if (data?.detailMessage) {

                                                } else {
                                                    $("#cart-quantity").text(data);
                                                }
                                            })
                                        }
        </script>
    </body>
</html>
