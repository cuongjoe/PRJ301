<%-- 
    Document   : orders
    Created on : Mar 4, 2022, 11:18:34 PM
    Author     : giaki
--%>


<%@page import="model.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Page</title>
    </head>
    <%
        ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
    %>
    <body>
        <jsp:include page="../base/header.jsp" />
        <div class="container mx-auto">
            <div class="mt-10">
                <c:forEach items="${orders}" var="order">
                    <div class="overflow-hidden mb-3">
                        <div class="overflow-x-auto shadow-md sm:rounded-lg">
                            <div class="inline-block min-w-full align-middle">
                                <div class="flex items-center p-4">
                                    <div>
                                        <span class="text-lg font-medium">Thời gian: <fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${order.created_at}"/></span>
                                    </div>
                                    <div class="ml-10">
                                        <span class="text-lg font-medium">Tổng tiền: <span id="total-${order.id}">${order.total()}</span>
                                         <script>
                                            var price = Number.parseInt($("#total-${order.id}").text());
                                            price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#total-${order.id}").text(price);
                                        </script>
                                    </div>
                                    <div class="ml-auto">
                                        <span class="text-lg font-medium text-red-500">Trạng thái: ${order.state.name}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="min-w-full divide-y divide-gray-200 table-fixed">
                            <thead class="bg-gray-100">
                                <tr>
                                    <th scope="col" class="p-4">
                                        <div class="flex items-center">
                                            <input id="checkbox-search-all" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500focus:ring-2">
                                            <label for="checkbox-search-all" class="sr-only">checkbox</label>
                                        </div>
                                    </th>
                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                        id
                                    </th>
                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                        SEAFOOD
                                    </th>
                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                        quantity
                                    </th>
                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                        price
                                    </th>
                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                        discount
                                    </th>
                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                        total
                                    </th>
                                    <th scope="col" class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                                        real price
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200" id="tbodyUser">
                                <c:forEach items="${order.orderDetails}" var="orderDetail">
                                    <tr class="hover:bg-gray-100" id="user-item-${user.getId()}">
                                        <td class="p-4 w-4">
                                            <div class="flex items-center">
                                                <input id="checkbox-search-1" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 focus:ring-2">
                                                <label for="checkbox-search-1" class="sr-only">checkbox</label>
                                            </div>
                                        </td>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${orderDetail.id}</td> 
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">
                                            <a href="/cuongproject/seas/detail?id=${orderDetail.sea.id}">${orderDetail.sea.name}</a>
                                        </td> 
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${orderDetail.quantity}</td> 
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap" id="price-${order.id}-${orderDetail.sea.id}">${orderDetail.price}</td> 
                                        <script>
                                            var price = Number.parseInt($("#price-${order.id}-${orderDetail.sea.id}").text());
                                            price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#price-${order.id}-${orderDetail.sea.id}").text(price);
                                        </script>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">${orderDetail.discount}</td> 
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap" id="total-${order.id}-${orderDetail.sea.id}">${orderDetail.getTotal()}</td> 
                                        <script>
                                            var price = Number.parseInt($("#total-${order.id}-${orderDetail.sea.id}").text());
                                            price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#total-${order.id}-${orderDetail.sea.id}").text(price);
                                        </script>
                                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap" id="realprice-${order.id}-${orderDetail.sea.id}">${orderDetail.getRealPrice()}</td>
                                        <script>
                                            var price = Number.parseInt($("#realprice-${order.id}-${orderDetail.sea.id}").text());
                                            price = price.toLocaleString('vi', {style: 'currency', currency: 'VND'});
                                            $("#realprice-${order.id}-${orderDetail.sea.id}").text(price);
                                        </script>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="../base/footerImport.jsp" />
    </body>
</html>
