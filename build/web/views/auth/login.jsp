<%-- 
    Document   : login
    Created on : Feb 24, 2022, 4:35:38 PM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.4/dist/flowbite.min.css" />
        <%
            String error = (String) request.getAttribute("error");
        %>
        
    </head>
    <body>
        <div class="w-full min-h-screen bg-slate-900 text-white flex justify-center items-center">
            <div class="w-[1000px] px-40 py-20 rounded-[30px]" style="box-shadow: rgba(150, 100, 111, 0.2) 0px 7px 29px 0px;">
                <form class="login w-full" method="POST" action="/cuongproject/login">
                    <div class="mb-10 text-center">
                        <h3 class="text-5xl text-white">Login</h3>
                    </div>
                    <c:if test="${error!=null}">
                        <div id="showErrorForm" class="mb-6">
                            <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                                ${error}
                            </div>
                        </div>
                    </c:if>
                    <div class="mb-6 w-full">
<!--                        <input type="hidden" name="name" value="value">-->
                        <label for="username" class="block mb-2 text-sm font-medium text-white">Your email</label>
                        <input type="text" name="username" id="username" class="w-full bg-green-50 border border-green-300 text-sm text-gray-900 rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="name@flowbite.com" required>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="password" class="block mb-2 text-sm font-medium text-white">Your password</label>
                        <input type="password" name="password" id="password" class="w-full bg-green-50 border border-green-300 text-sm text-gray-900 rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                    </div>
                    <div class="flex items-baseline justify-between mt-4">
                        <button class="px-6 py-2 mt-4 text-white bg-red-600 rounded-lg hover:bg-blue-900">Login</button>
                        <div>
                            <a href="/cuongproject/signup" class="text-sm text-blue-600 hover:underline">Signup</a>
                            <span>/</span>
                            <a href="/cuongproject/forgotPassword" class="text-sm text-blue-600 hover:underline">Forgot password?</a>
                            <span>/</span>
                             <a href="/cuongproject/admin/login" class="text-sm text-blue-600 hover:underline">Login By Admin</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>
    </body>
</html>