
<%@page import="java.util.ArrayList"%>
<%@page import="model.product.Sea"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            Sea sea = (Sea) request.getAttribute("sea");
            ArrayList<Sea> sameSeas = (ArrayList<Sea>) request.getAttribute("sameSeas");
        %>
        <title><%=sea.getName()%></title>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <link rel="stylesheet" type="text/css" href="/assets/css/ckeditor/preview.css">
    </head>
    <style>
        .swiper {
            max-width: 100%;
            height: 600px;
        }

        .swiper-button-next::after, .swiper-button-prev::after{
            font-size: 30px!important;
            font-weight: bold!important;
            color: #000!important;
        }

        .editor h1{
            font-size: 2em!important;
            display: block!important;
            margin-block-start: 0.67em!important;
            margin-block-end: 0.67em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
        }

        .editor h2{
            display: block!important;
            font-size: 1.5em!important;
            margin-block-start: 0.83em!important;
            margin-block-end: 0.83em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
        }

        .editor h3{
            display: block!important;
            font-size: 1.17em!important;
            margin-block-start: 1em!important;
            margin-block-end: 1em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
        }

        .editor h4{
            display: block!important;
            margin-block-start: 1.33em!important;
            margin-block-end: 1.33em!important;
            margin-inline-start: 0px!important;
            margin-inline-end: 0px!important;
            font-weight: bold!important;
            font-size: 1em!important;
        }

        .editor p{
            font-size: 1.1rem!important;
            font-weight: 500!important;
            color: #3b3a39!important;
        }
    </style>
    <body class="bg-teal-500">
        <jsp:include page="../base/header.jsp" />
        <div class="container mx-auto">
            <div class="w-full mt-10">
                <div class="container w-full grid grid-cols-5 gap-2 mx-auto">
                    <div class="col-span-2">
                        <div class="swiper">
                            <div class="swiper-wrapper">
                                <c:if test="${sea.getImages().size()>0}">
                                    <c:forEach items="${sea.getImages()}" var="image">
                                        <div class="swiper-slide">
                                            <img src="${image.getImage()}" style="width: 100%; height: 100%"/>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${sea.getImages().size()<=0}">
                                    <div class="swiper-slide">
                                        <img src="/assets/images/no-image.png" style="width: 100%; height: 100%"/>
                                    </div>
                                </c:if>
                            </div>
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <div class="col-span-3 px-3 h-full flex flex-col">
                        <h2 class="text-2xl font-medium">
                            <%=sea.getName()%>
                        </h2>
                        <div class="mt-6">
                            <table>
                                <tr>
                                    <td class="font-medium pr-10 uppercase">TÌNH TRẠNG:</td>
                                    <td class="font-medium uppercase"><%=sea.getState().getName()%></td>
                                </tr>
                                <tr>
                                    <td class="font-medium pr-10 uppercase">LOẠI SẢN PHẨM:</td>
                                    <td class="font-medium uppercase"><%=sea.getCategory().getName()%></td>
                                </tr>
                                <tr>
                                    <td class="font-medium pr-10 uppercase">THƯƠNG HIỆU/XUẤT XỨ:</td>
                                    <td class="font-medium uppercase"><%=sea.getBrand()%></td>
                                </tr>
                            </table>
                        </div>
                        <p class="mt-3 font-medium">
                            MÔ TẢ : <%=sea.getDescription()%>
                        </p>
                        <div>
                            <a href="https://www.facebook.com/profile.php?id=100054245292334" class="block">Facebook: DinhCuong.vn</a>
                            <a href="https://www.facebook.com/profile.php?id=100054245292334" class="block">CN1:245 Đường Ven Sông Lam, Phường Nghi Hải, Thị Xã Cửa Lò ,Nghệ An </a>
                        </div>
                        <div class="flex">
                            <c:choose>
                                <c:when test="${sea.isSale}">
                                    <p class="text-4xl line-through text-gray-900 font-bold mt-auto" id="price">
                                        <%=sea.getPrice()%>
                                    </p>
                                    <p class="ml-3 text-2xl text-red-600 font-bold mt-auto" id="price-discount">
                                        <%=sea.getPrice()%>
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-4xl text-red-600 font-bold mt-auto" id="price">
                                        <%=sea.getPrice()%>
                                    </p>
                                </c:otherwise>
                            </c:choose>

                        </div>

                        <div class="mt-6">
                            <p class="text-md text-gray-500 font-medium mb-3">SỐ LƯỢNG</p>
                            <div class="flex items-center border-solid border border-gray-100" style="width: fit-content">
                                <button id="button-minus" type="button" class="text-white focus:ring-1 font-medium px-2 py-2 text-center text-sm text-gray-500 border border-gray-100">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4"></path></svg>
                                </button>
                                <span class="py-1 px-4 text-2xl font-bold" id="quantity">
                                    0
                                </span>
                                <button id="button-plus" type="button" class="text-white focus:ring-1 font-medium px-2 py-2 text-center text-sm text-gray-500 border border-gray-100">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                                </button>                            
                            </div>
                        </div>
                        <button onclick="addToCart()" id="button-add-to-cart" type="button" class="max-w-lg mt-5 text-white bg-red-600 hover:bg-gray-900 focus:ring-1 focus:ring-gray-600 font-medium px-15 py-2 text-center text-lg rounded-sm">
                            THÊM VÀO GIỎ HÀNG
                        </button> 
                        <p class="mt-5">Sản phẩm sẽ được giao từ 30 phút - 1 tiếng đối với các đơn hàng nội thành HN và HCM, từ 1-3 ngày đối với các đơn hàng gửi CPN đến các tỉnh thành khác</p>
                    </div>
                </div>
                <div class="container mx-auto mt-20">
                    <div class="mb-4 border-b border-gray-200">
                        <ul class="flex justify-center flex-wrap -mb-px" id="myTab" data-tabs-toggle="#myTabContent" role="tablist">
                            <li class="mr-2" role="presentation">
                                <button class="inline-block py-4 px-4 text-lg font-medium text-center text-gray-500 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 uppercase active" id="dashboard-tab" data-tabs-target="#dashboard" type="button" role="tab" aria-controls="dashboard" aria-selected="true">Chi tiết sản phẩm</button>
                            </li>
                            <li class="mr-2" role="presentation">
                                <button class="inline-block py-4 px-4 text-lg font-medium text-center text-gray-500 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 uppercase"id="settings-tab" data-tabs-target="#settings" type="button" role="tab" aria-controls="settings" aria-selected="false">Thông tin mua hàng</button>
                            </li>
                            <li role="presentation">
                                <button class="inline-block py-4 px-4 text-lg font-medium text-center text-gray-500 rounded-t-lg border-b-2 border-transparent hover:text-gray-600 hover:border-gray-300 uppercase" id="contacts-tab" data-tabs-target="#contacts" type="button" role="tab" aria-controls="contacts" aria-selected="false">Giao hàng đổi trả</button>
                            </li>
                        </ul>
                    </div>
                    <div id="myTabContent">
                        <div class="p-4 rounded-lg w-full" id="dashboard" role="tabpanel" aria-labelledby="dashboard-tab">
                            <div class="editor preview ck-content w-full"></div>
                        </div>
                        <div class="hidden p-4 rounded-lg text-center" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                            <p class="text-xl font-bold">BẠN CÓ THẮC MẮC VỀ SẢN PHẨM NÀY?</p>
                            <p class="text-md font-medium">Đừng lo, bình luận không ảnh hưởng tới facebook của  bạn.</p>
                        </div>
                        <div class="hidden p-4 rounded-lg text-center" id="contacts" role="tabpanel" aria-labelledby="contacts-tab">
                            <p class="text-xl font-bold">BẠN CÓ THẮC MẮC VỀ SẢN PHẨM NÀY?</p>
                            <p class="text-md font-medium">Đừng lo, bình luận không ảnh hưởng tới facebook của bạnủa bạn.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mx-auto mt-20">
            <h3 class="text-4xl text-center">CÓ THỂ BẠN CẦN</h3>
            <div class="mt-20 w-full">
                <div class="grid grid-cols-4 gap-6 snap-x">
                    <c:forEach items="${sameSeas}" var="sea">
                        <div class="bg-white rounded-lg shadow-md flex flex-col relative">
                            <c:if test="${sea.isSale}">
                                <span class="absolute -top-5 -right-5 bg-red-600 text-white text-sm flex justify-center text-center font-semibold inline-flex items-center w-10 h-10 rounded-full">
                                    ${sea.discount}%
                                </span>
                            </c:if>
                            <a href="/cuongproject/sea/detail?id=${sea.getId()}">
                                <img class="rounded-t-lg w-full h-[340px]" src="${sea.getImages().get(sea.getImages().size()-1).getImage()}" alt="product image" />
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
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <jsp:include page="../base/footerImport.jsp" />
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
                                        const addToCart = () => {
                                            if (Number.parseInt($("#quantity").text()) > 0) {
                                                $("#cart-quantity").removeClass("hidden")
                                                const data = {
                                                    seaId: ${sea.id},
                                                    quantity: Number.parseInt($("#quantity").text()),
                                                }
                                                $.ajax({
                                                    method: "POST",
                                                    url: "/addCart",
                                                    data: data,
                                                }).done(function (data) {
                                                    if (data?.detailMessage) {

                                                    } else {
                                                        $("#cart-quantity").text(data);
                                                        $("#quantity").text(0);
                                                    }
                                                })
                                            }
                                        }
                                        const swiper = new Swiper('.swiper', {
                                            //                direction: 'vertical',
                                            loop: true,
                                            pagination: {
                                                el: '.swiper-pagination',
                                                clickable: true,
                                            },
                                            navigation: {
                                                nextEl: '.swiper-button-next',
                                                prevEl: '.swiper-button-prev',
                                            },
                                            scrollbar: {
                                                el: '.swiper-scrollbar',
                                            },
                                        });

                                        var price = <%=sea.getPrice()%>;
                                        price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                        $("#price").text(price);

                                        var price_discount = <%=sea.getPrice() - sea.getPrice() * (double) sea.getDiscount() / 100%>;
                                        price_discount = price_discount.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                        $("#price-discount").text(price_discount);

                                        $("#button-minus").on("click", function (e) {
                                            if (Number.parseInt($("#quantity").text()) - 1 > 0) {
                                                $("#quantity").text(Number.parseInt($("#quantity").text()) - 1);
                                            } else {
                                                $("#quantity").text(0);
                                            }
                                        })

                                        $("#button-plus").on("click", function (e) {
                                            if (Number.parseInt($("#quantity").text()) + 1 <${sea.quantity}) {
                                                $("#quantity").text(Number.parseInt($("#quantity").text()) + 1);
                                            } else {
                                                $("#quantity").text(${sea.quantity});
                                            }
                                        })

                                        $(".preview").html(`<%=sea.getContent()%>`)
        </script>
        <div>
            <jsp:include page="/views/base/footer.jsp" />
        </div>
    </body>
</html>
