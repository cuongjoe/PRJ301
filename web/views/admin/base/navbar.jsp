<%-- 
    Document   : navbar
    Created on : Feb 23, 2022, 9:10:53 PM
    Author     : giaki
--%>

<%@page import="model.auth.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            User user = (User) session.getAttribute("admin");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <aside class="w-64 fixed top-0 left-0 " aria-label="Sidebar">
            <div class="px-3 py-4 overflow-y-auto rounded bg-slate-900 min-h-screen">
                <div class="mb-8 flex items-center justify-center flex-col">
                    <h4 class="text-xl mt-3"><%=user.getUsername()%></h4>
                </div>
                <ul class="space-y-2 w-full">
                    <li>
                       <a href="/cuongproject/index.jsp" class="flex items-center p-2 text-base font-normal text-white rounded-lg  hover:bg-red-500 ">
                            <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-white dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="/cuongproject/dashboard" class="flex items-center p-2 text-base font-normal text-white rounded-lg  hover:bg-red-500 ">
                            <svg class="w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-white dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"></path><path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"></path></svg>
                            <span class="ml-3">Chart</span>
                        </a>
                    </li>
                    <li>
                        <a href="/cuongproject/admin/users" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-red-500">
                            <svg class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path></svg>
                            <span class="flex-1 ml-3 text-white whitespace-nowrap">Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="/cuongproject/admin/group" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-red-500">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"></path></svg>                                
                            <span class="flex-1 ml-3 whitespace-nowrap">Group</span>
                        </a>
                    </li>
                    <li>
                        <a href="/cuongproject/admin/category" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-red-500">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"></path></svg>                            
                            <span class="flex-1 ml-3 whitespace-nowrap">Category</span>
                        </a>
                    </li>
                    <li>
                        <a href="/cuongproject/admin/state" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-red-500">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 19a2 2 0 01-2-2V7a2 2 0 012-2h4l2 2h4a2 2 0 012 2v1M5 19h14a2 2 0 002-2v-5a2 2 0 00-2-2H9a2 2 0 00-2 2v5a2 2 0 01-2 2z"></path></svg>
                            <span class="flex-1 ml-3 whitespace-nowrap">State SEAFOOD</span>
                        </a>
                    </li>
                    <li>
                        <a href="/cuongproject/admin/seas" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-red-500">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"></path></svg>
                            <span class="flex-1 ml-3 whitespace-nowrap">SEAFOOD</span>
                        </a>
                    </li>
                    <!--                    <li>
                                            <a href="/cuongproject/admin/order/state" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-gray-100">
                                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 11.5V14m0-2.5v-6a1.5 1.5 0 113 0m-3 6a1.5 1.5 0 00-3 0v2a7.5 7.5 0 0015 0v-5a1.5 1.5 0 00-3 0m-6-3V11m0-5.5v-1a1.5 1.5 0 013 0v1m0 0V11m0-5.5a1.5 1.5 0 013 0v3m0 0V11"></path></svg>
                                                <span class="flex-1 ml-3 whitespace-nowrap">Order state</span>
                                            </a>
                                        </li>-->
                    <li>
                        <a href="/cuongproject/admin/order" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-red-500">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10l-2 1m0 0l-2-1m2 1v2.5M20 7l-2 1m2-1l-2-1m2 1v2.5M14 4l-2-1-2 1M4 7l2-1M4 7l2 1M4 7v2.5M12 21l-2-1m2 1l2-1m-2 1v-2.5M6 18l-2-1v-2.5M18 18l2-1v-2.5"></path></svg>
                            <span class="flex-1 ml-3 whitespace-nowrap">Order</span>
                        </a>
                    </li>
                    <li>
                        <a href="/cuongproject/admin/logout" class="flex items-center p-2 text-base font-normal text-white rounded-lg hover:bg-red-500">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>                            
                            <span class="flex-1 ml-3 whitespace-nowrap">Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
    </body>
</html>
