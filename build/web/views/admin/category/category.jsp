<%-- 
    Document   : manageCategory
    Created on : Feb 25, 2022, 8:59:54 AM
    Author     : giaki
--%>

<%@page import="model.product.Group"%>
<%@page import="model.product.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Admin</title>
        <%
            ArrayList<Category> listCategory = (ArrayList<Category>) request.getAttribute("listCategory");
            ArrayList<Group> groups = (ArrayList<Group>) request.getAttribute("groups");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body class="bg-emerald-600">
        <div class="flex bg-emerald-600">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full px-20 py-5">
                
                <div class="mb-6 flex items-center space-x-3">
                    <a href="/cuongproject/admin/category/add" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add Category</a>
                    <form form="/cuongproject/admin/event" method="GET" class="flex items-center" id="form-search-category">
                        <div class="relative">
                            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input type="text" name="q" id="search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-80 pl-10 p-2.5" placeholder="Search for items">
                        </div>
                        <select id="group" name="group" class="ml-3 min-w-[200px] bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                             <option value="-1">Group</option>
                            <c:forEach items="${groups}" var="group">
                                <option value="${group.getId()}">${group.getName()}</option>
                            </c:forEach>
                        </select>
                        <button type="submit" class="ml-3 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">search</button>
                    </form>
                </div>
                <ul class="w-full grid col-start-1 col-end-7 ">
                    <c:forEach items="${listCategory}" var="category">
                        <li class="min-w-md bg-white rounded-lg border border-gray-200 shadow-md py-8 px-6 mb-3">
                            <div class="flex flex-col items-center pb-5">
                                <h3 class="mb-3 text-xl font-medium text-gray-900 text-center">${category.getName()}</h3>
                                <h3 class="mb-1 text-md font-medium text-red-500">${category.getGroup().getName()}</h3>
                                <span class="text-sm text-gray-500">id - ${category.getId()}</span>
                                <div class="flex mt-4 space-x-3">
                                    <a href="/cuongproject/admin/category/edit?id=${category.getId()}" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Edit</a>
                                    <a href="/cuongproject/admin/category/delete?id=${category.getId()}" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300">Delete</a>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>
