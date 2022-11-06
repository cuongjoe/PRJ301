<%-- 
    Document   : sea
    Created on : Feb 24, 2022, 5:07:24 PM
    Author     : giaki
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="model.auth.User"%>
<%@page import="model.cart.Cart"%>
<%@page import="model.product.Category"%>
<%@page import="model.common.Pagination"%>
<%@page import="model.product.Sea"%>
<%@page import="model.product.Group"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEAFOOD Page</title>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                user = new User();
            }
            
            ArrayList<Cart> carts = (ArrayList<Cart>) request.getAttribute("carts");
            Integer quantity = (Integer) request.getAttribute("quantity");
            BigDecimal totalPrice = (BigDecimal) request.getAttribute("totalPrice");
            BigDecimal realPrice = (BigDecimal) request.getAttribute("realPrice");
        %>
    </head>
    <body class="bg-cyan-500">
        <jsp:include page="../base/header.jsp" />
        <div class="container mx-auto flex mt-5">
            <div class="w-96">
                <div class="p-4 w-96 bg-white rounded-lg border border-gray-200 shadow-md sm:p-6 lg:p-8">
                    <div class="border-dashed border-b-2 pb-6 mb-4">
                        <h5 class="text-xl font-medium text-gray-900">Tổng</h5>
                        <p class="text-lg font-medium mt-4">Số lượng: ${quantity}</p>
                        <p class="text-lg font-medium mt-2">Tổng tiền chưa discount: <span id="tien-not-discount">${totalPrice}</span></p>
                        <script>
                            var tien = Number.parseInt($("#tien-not-discount").text());
                            tien = tien.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                            $("#tien-not-discount").text(tien);
                        </script>
                        <p class="text-lg font-medium mt-2">Tổng tiền: <span id="tien-da-discount">${realPrice}</span></p>
                        <script>
                            var tien = Number.parseInt($("#tien-da-discount").text());
                            tien = tien.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                            $("#tien-da-discount").text(tien);
                        </script>
                        <p class="text-lg font-medium mt-2">Phí ship: <span id="phi-ship">30000</span></p>
                        <script>
                            var tien = Number.parseInt($("#phi-ship").text());
                            tien = tien.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                            $("#phi-ship").text(tien);
                        </script>
                    </div>
                    <form class="space-y" action="dropdownButton/checkout" class="w-96 mt-5" method="post" id="form-checkout">
                        <h5 class="text-xl font-medium text-gray-900 mb-5">Thông tin người nhận</h5>
                        <div id="showErrorForm" class="hidden">
                            <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                            </div>
                        </div>
                        <div id="showSuccessForm" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                            <span id="contentSuccessForm" class="font-medium"></span>
                        </div>
                        <div>
                            <label for="first_name" class="block mb-3 text-sm font-medium text-gray-900">First name</label>
                            <input type="text" name="first_name" id="first_name" value="${user.first_name}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                        </div>
                        <div>
                            <label for="last_name" class="block mb-3 text-sm font-medium text-gray-900">Last name</label>
                            <input type="text" name="last_name" id="last_name"  value="${user.last_name}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                        </div>
                        <div>
                            <label for="email" class="block mb-3 text-sm font-medium text-gray-900">Email</label>
                            <input type="email" name="email" id="email" value="${user.email}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                        </div>
                        <div>
                            <label for="phone" class="block mb-3 text-sm font-medium text-gray-900">Phone</label>
                            <input type="text" name="phone" id="phone" value="${user.phone}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                        </div>
                        <div>
                            <label for="address" class="block mb-3 text-sm font-medium text-gray-900">Address</label>
                            <input type="text" name="address" id="address" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                        </div>
                        <button type="submit" class="w-full mt-4 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Thanh toán</button>
                    </form>
                </div>
            </div>
            <div class="w-full px-5">
                <c:forEach items="${carts}" var="cart">
                    <div class="flex items-center relative bg-white rounded-lg border shadow-md w-full hover:bg-gray-100 mb-5">
                        <img style="width: 300px;" class="w-full h-full object-cover rounded-t-lg" src="${cart.sea.images.get(cart.sea.images.size()-1).image}" alt="">
                        <div>
                            <div class="flex justify-between px-4 pt-4">
                                <a href="/cuongproject/seas/detail?id=${cart.sea.id}" >
                                    <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">${cart.sea.name}</h5>
                                </a>
                                <button id="dropdownButton-${cart.sea.id}" data-dropdown-toggle="dropdown-delete-${cart.sea.id}" class="hidden sm:inline-block text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-1.5" type="button">
                                    <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z"></path></svg>
                                </button>
                                <!-- Dropdown menu -->
                                <div id="dropdown-delete-${cart.sea.id}" class="hidden z-10 w-44 text-base list-none bg-white rounded divide-y divide-gray-100 shadow dark:bg-gray-700">
                                    <ul class="py-1" aria-labelledby="dropdownButton">
                                        <li>
                                            <a href="/cuongproject/carts/delete?id=${cart.sea.id}" class="block py-2 px-4 text-sm text-red-600 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200">Delete</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="flex flex-col justify-between p-4 leading-normal">
                                <p class="mb-3 font-normal text-gray-700" style="overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">${cart.sea.description}</p>
                                <c:if test="${cart.sea.isSale}">
                                    <p class="mb-3 font-normal text-blue-700">discount: ${cart.sea.discount}%</p>
                                </c:if>
                                <p class="mb-3 font-normal text-xl font-bold text-red-700" id="price-${cart.sea.id}">${cart.sea.price}</p>
                                <script>
                                    var price = Number.parseInt($("#price-${cart.sea.id}").text());
                                    price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                    $("#price-${cart.sea.id}").text(price);
                                </script>
                                <div>
                                    <div class="mt-3">
                                        <p class="text-md text-gray-500 font-medium mb-3">SỐ LƯỢNG</p>
                                        <div class="flex items-center border-solid border border-gray-100" style="width: fit-content">
                                            <button id="button-minus-${cart.sea.id}" type="button" class="text-white focus:ring-1 font-medium px-2 py-2 text-center text-sm text-gray-500 border border-gray-100">
                                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4"></path></svg>
                                            </button>
                                            <span class="py-1 px-4 text-2xl font-bold" id="quantity-${cart.sea.id}">
                                                ${cart.quantity}
                                            </span>
                                            <button id="button-plus-${cart.sea.id}" type="button" class="text-white focus:ring-1 font-medium px-2 py-2 text-center text-sm text-gray-500 border border-gray-100">
                                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                                            </button>                            
                                        </div>
                                    </div>
                                    <script>
                                        $("#button-minus-" +${cart.sea.id}).on("click", function (e) {
                                        let quantity = Number.parseInt($("#quantity-" +${cart.sea.id}).text());
                                        if (quantity - 1 >= 0) {
                                        $("#quantity-" +${cart.sea.id}).text(quantity - 1);
                                        $.ajax({
                                        method: "POST",
                                                url: "/cuongproject/carts/update",
                                                data: {id: ${cart.sea.id}, quantity: quantity - 1},
                                        }).done(function(data){
                                        if (data?.detailMessage) {

                                        } else{
                                        $("#cart-quantity").text(data?.quantity);
                                        var price_not_discount = data?.totalPrice;
                                        var price_da_discount = data?.realPrice;
                                        price_not_discount = price_not_discount.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                        price_da_discount = price_da_discount.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                        $("#tien-not-discount").text(price_not_discount);
                                        $("#tien-da-discount").text(price_da_discount);
                                        }
                                        })
                                        } else {
                                        $("#quantity-" +${cart.sea.id}).text(0);
                                        }
                                        })

                                                $("#button-plus-" +${cart.sea.id}).on("click", function (e) {
                                        let quantity = Number.parseInt($("#quantity-" +${cart.sea.id}).text());
                                        if (quantity + 1 <= ${cart.sea.quantity}) {
                                        $("#quantity-" +${cart.sea.id}).text(quantity + 1);
                                        $.ajax({
                                        method: "POST",
                                                url: "/cuongproject/carts/update",
                                                data: {id: ${cart.sea.id}, quantity: quantity + 1},
                                        }).done(function(data){
                                        console.log(data);
                                        if (data?.detailMessage) {

                                        } else{
                                        $("#cart-quantity").text(data?.quantity);
                                        var price_not_discount = data?.totalPrice;
                                        var price_da_discount = data?.realPrice;
                                        price_not_discount = price_not_discount?.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                        price_da_discount = price_da_discount?.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                        $("#tien-not-discount").text(price_not_discount);
                                        $("#tien-da-discount").text(price_da_discount);
                                        }
                                        })
                                        } else {
                                        $("#quantity-" +${cart.sea.id}).text(${sea.quantity});
                                        }
                                        })
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script>
                    $("#form-checkout").on('submit', (e) => {
            e.preventDefault();
            const data = {
            first_name: $("input[name='first_name']").val(),
                    last_name: $("input[name='last_name']").val(),
                    email: $("input[name='email']").val(),
                    phone: $("input[name='phone']").val(),
                    address: $("input[name='address']").val(),
            }

            $.ajax({
            method: "POST",
                    url: "/cuongproject/checkout",
                    data: data,
            }).done(function (data) {
            if (data?.detailMessage) {
            $("#showSuccessForm").addClass("hidden")
                    $('#contentErrorForm').text(data?.detailMessage);
            $("#showErrorForm").removeClass("hidden")
            } else{
            location.pathname = "/cuongproject/orders";
            }
            })
            })
        </script>
        <jsp:include page="../base/footerImport.jsp" />
    </body>
</html>
