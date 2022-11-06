
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
            ArrayList<Group> groups = (ArrayList<Group>) request.getAttribute("groups");
            ArrayList<Sea> seas = (ArrayList<Sea>) request.getAttribute("seas");
            Pagination pagination = (Pagination) request.getAttribute("pagination");
            ArrayList<Category> categorys = (ArrayList<Category>) request.getAttribute("categorys");
        %>
    </head>
    <body class="bg-teal-500">
        <jsp:include page="../base/header.jsp" />
        <div class="container flex mx-auto mt-10 ">
            <div class="w-80">
                <div class="">
                    <h3 class="text-md font-medium mb-4 uppercase">Danh mục</h3>
                    <div class="w-full text-sm font-medium text-gray-900 bg-blue-500 border border-gray-200 py-2 px-3">
                        <a href="/cuongproject/index.jsp" class="uppercase block py-3 px-4 w-full font-small border-b border-dashed border-gray-200 cursor-pointer hover:bg-gray-100 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-700 focus:text-black-700">
                            HOME
                        </a>
                        <a href="/cuongproject/sea" class="uppercase block py-3 px-4 w-full font-small border-b border-dashed border-gray-200 cursor-pointer hover:bg-gray-100 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-700 focus:text-blue-700">
                            ALL
                        </a>
                        <c:forEach items="${groups}" var="group">
                            <a href="/cuongproject/sea?group=${group.getId()}" class="uppercase block py-3 px-4 w-full font-small border-b border-dashed border-gray-200 cursor-pointer hover:bg-gray-100 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-700 focus:text-blue-700">
                                ${group.getName()}
                            </a>
                        </c:forEach>
                        <!--                        <a href="/cuongproject/news" class="uppercase block py-3 px-4 w-full font-small border-b border-dashed border-gray-200 cursor-pointer hover:bg-gray-100 hover:text-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-700 focus:text-blue-700">
                                                    TIN TỨC
                                                </a>-->
                    </div>
                </div>
            </div>
            <div class="w-full p-5">
                <div class="w-full flex items-center mb-4">
                    <div>
                        <form action="/cuongproject/sea" method="GET" class="flex items-center">

                            <select id="group" name="group" class="ml-3 min-w-[200px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <option value="all">Group</option>
                                <c:forEach items="${groups}" var="group">
                                    <option value="${group.id}">${group.getName()}</option>
                                </c:forEach>
                            </select>
                            <select id="category" name="category" class="ml-3 min-w-[200px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <option value="all">category</option>
                            </select>
                            <div class="relative ml-5px ">
                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none pr-5px">
                                    <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
                                </div>
                                <input type="text" name="q" id="search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-80 pl-10 p-2.5" placeholder="SEAFOOD">
                            </div>
                            <button type="submit" class="ml-3 text-white bg-blue-500 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">search</button>
                            <div class="ml-auto">
                                <select id="countries" name ="orderBy" class="min-w-[200px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                    <option class="py-2 px-3">Sắp xếp</option>
                                    <option class="py-2 px-3" value="az">Tên: A-Z</option>
                                    <option class="py-2 px-3" value="za">Tên: Z-A</option>
                                    <option class="py-2 px-3" value="ptd">Giá: Tăng dần</option>
                                    <option class="py-2 px-3" value="pgd">Giá: Giảm dần</option>
                                    <option class="py-2 px-3" value="tgn">Thời gian: Mới nhất</option>
                                    <option class="py-2 px-3" value="tgo">Thời gian: Cũ nhất</option>
                                </select>
                            </div>
                        </form>
                    </div>

                </div>
                <c:if test="${seas.size()<=0}">
                    <div class="w-full min-h-[50vh] flex justify-center items-center">
                        <p class="text-5xl">NOT FOUND</p>
                    </div>
                </c:if>
                <div class="grid grid-cols-4 gap-5 <%=seas.size() <= 0 ? "hidden" : ""%>">
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
                                <button type="button" onclick="addToCart(${sea.id})" class="mt-5 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-3 py-2 text-center">THÊM VÀO GIỎ</button>
                            </div>
                        </div>
                    </c:forEach> 
                </div>
                <div class="mt-10 mb-5 w-full flex justify-center <%=seas.size() <= 0 ? "hidden" : ""%>">
                    <nav aria-label="Page navigation example">
                        <ul class="inline-flex -space-x-px">
                            <li>
                                <a href="/cuongproject/sea?page=<%=pagination.getPrev()%>" data="<%=pagination.getPrev()%>" class="pagination-link py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Previous</a>
                            </li>
                            <c:if test="${pagination.getPageIndex()>2}">
                                <li>
                                    <a href="/cuongproject/sea?page=<%=pagination.getPageIndex() - 2%>" data="<%=pagination.getPageIndex() - 2%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() - 2%></a>
                                </li>
                            </c:if>
                            <c:if test="${pagination.getPageIndex()>1}">
                                <li>
                                    <a href="/cuongproject/sea?page=<%=pagination.getPageIndex() - 1%>" data="<%=pagination.getPageIndex() - 1%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() - 1%></a>
                                </li>
                            </c:if>
                            <li>
                                <a href="/cuongproject/sea?page=<%=pagination.getPageIndex()%>" data="<%=pagination.getPageIndex()%>" aria-current="page" class="pagination-link py-2 px-3 text-blue-600 bg-blue-50 border border-gray-300 hover:bg-blue-100 hover:text-blue-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white"><%=pagination.getPageIndex()%></a>
                            </li>
                            <c:if test="${pagination.getPageIndex()<pagination.getCount()}">
                                <li>
                                    <a href="/cuongproject/sea?page=<%=pagination.getPageIndex() + 1%>" data="<%=pagination.getPageIndex() + 1%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() + 1%></a>
                                </li>
                            </c:if>
                            <c:if test="${pagination.getPageIndex()+1<pagination.getCount()}">
                                <li>
                                    <a href="/cuongproject/sea?page=<%=pagination.getPageIndex() + 2%>" data="<%=pagination.getPageIndex() + 2%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"><%=pagination.getPageIndex() + 2%></a>
                                </li>
                            </c:if>
                            <li>
                                <a href="/cuongproject/sea?page=<%=pagination.getNext()%>" data="<%=pagination.getNext()%>" class="pagination-link py-2 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div>
            <jsp:include page="/views/base/footer.jsp" />
        </div>
        <script>

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
            }).done(function(data){
            if (data?.detailMessage) {

            } else{
            $("#cart-quantity").text(data);
            }
            })
            }

            const categorys = [
            <%for (Category category : categorys) {%>
            {
            id: <%=category.getId()%>,
                    name: "<%=category.getName()%>",
                    group: {
                    id: <%=category.getGroup().getId()%>,
                            name: "<%=category.getGroup().getName()%>",
                    }
            },
            <%}%>
            ]

                    const category = document.getElementById("category");
            for (var i = 0; i < categorys.length - 1; i++) {
            category.innerHTML += '<option value="' + categorys[i].id + '">' + categorys[i].name + '</option>';
            }

            $("#group").on("change", function (e) {
            category.innerHTML = "";
            category.innerHTML += '<option value="all">Category</option>';
            categorys.forEach(item => {
            if (item.group.id == $("#group").val() || $("#group").val() == "all") {
            category.innerHTML += '<option value="' + item.id + '">' + item.name + '</option>';
            }
            });
            })


                    const url_string = window.location.href;
            const url = new URL(url_string);
            const search = url.searchParams.get("q");
            const paginationLinks = document.querySelectorAll(".pagination-link");
            if (paginationLinks) {
            paginationLinks.forEach(item => {
            var search = location.search.substring(1);
            const params = search ? JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"')
                    .replace(/&/g, '","').replace(/=/g, '":"') + '"}') : {};
            if (params?.group){
            $("#group").val(params?.group)
                    category.innerHTML = "";
            categorys.forEach(item => {
            if (item.group.id == params?.group || params?.group == "all") {
            if (params?.category == item.id){
            category.innerHTML += '<option value="' + item.id + '"selected>' + item.name + '</option>'
            } else{
            category.innerHTML += '<option value="' + item.id + '">' + item.name + '</option>'
            }
            }
            });
            }
            const page = item.getAttribute("data");
            params.page = page;
            const href = new URLSearchParams(params).toString();
            item.setAttribute("href", "?" + href);
            })
            }


        </script>
        <jsp:include page="../base/footerImport.jsp" />
    </body>
</html>
