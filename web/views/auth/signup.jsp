<%-- 
    Document   : login
    Created on : Feb 24, 2022, 4:35:38 PM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Singup Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.4/dist/flowbite.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="w-full min-h-screen text-white bg-slate-900 flex justify-center items-center">
            <div class="w-[600px] px-12 py-20 rounded-[10px]" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
                <form class="w-full" method="POST" action="/cuongproject/signup" id="signup">
                    <div class="mb-10 text-center">
                        <h3 class="text-5xl">Sign Up</h3>
                    </div>
                    <div id="showErrorForm" class="hidden">
                        <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                        </div>
                    </div>
                    <div id="showSuccessForm" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                        <span id="contentSuccessForm" class="font-medium"></span>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="username" class="block mb-2 text-sm font-medium text-white">Username</label>
                        <input type="text" id="username" name="username" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="cuongndhe" required>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="email" class="block mb-2 text-sm font-medium text-white">Email</label>
                        <input type="email" id="email" name="email" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="name@flowbite.com" required>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="password" class="block mb-2 text-sm font-medium text-white">Password</label>
                        <input type="password" id="password" name="password" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="confirm_password" class="block mb-2 text-sm font-medium text-white">Confirm password</label>
                        <input type="password" id="confirm_password" name="confirm_password" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="phone" class="block mb-2 text-sm font-medium text-white">Phone</label>
                        <input type="text" id="phone" name="phone" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="first_name" class="block mb-2 text-sm font-medium text-white">First Name</label>
                        <input type="text" id="first_name" name="first_name" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="Cuong" required>
                    </div>
                    <div class="mb-6 w-full">
                        <label for="last_name" class="block mb-2 text-sm font-medium text-white">Last Name</label>
                        <input type="text" id="last_name" name="last_name" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="Nguyen Dinh" required>
                    </div>
                    <div class="mb-3 w-full flex items-center justify-start">
                        <div class="flex items-center mb-4 mr-4">
                            <input id="male" type="radio" name="gender" value="male" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" aria-labelledby="country-option-1" aria-describedby="country-option-1" checked>
                            <label for="male" class="block ml-2 text-sm font-medium text-white">
                                Male
                            </label>
                        </div>
                        <div class="flex items-center mb-4">
                            <input id="female" type="radio" name="gender" value="female" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" aria-labelledby="country-option-2" aria-describedby="country-option-2">
                            <label for="female" class="block ml-2 text-sm font-medium text-white">
                                Female
                            </label>
                        </div>
                    </div>
                    <div>
                        <div class="mb-6 w-full">
                            <label for="birthday" class="block mb-2 text-sm font-medium text-white">Birthday</label>
                            <input type="date" id="birthday" name="birthday" class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="Chu Tuấn" required>
                        </div>
                    </div>
                    <div class="flex items-baseline justify-between mt-4">
                        <button class="px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900">Sign Up</button>
                        <div>
                            <a href="/cuongproject/login" class="text-sm text-blue-600 hover:underline">Sign Up</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            $("#signup").on("submit", function(e){
                e.preventDefault();
                const data = {
                    username: $("#username").val(),
                    email: $("#email").val(),
                    password: $("#password").val(),
                    confirm_password: $("#confirm_password").val(),
                    phone: $("#phone").val(),
                    first_name: $("#first_name").val(),
                    last_name: $("#lastname").val(),
                    gender: $("input[name='gender']:checked").val(),
                    birthday: $("#birthday").val(),
                }
                $.ajax({
                    method: "POST",
                    url: "/cuongproject/signup",
                    data: data,
                }).done(function(data){
                    console.log(data);
                    if (data?.detailMessage) {
                        $("#showSuccessForm").addClass("hidden")
                        $('#contentErrorForm').text(data?.detailMessage);
                        $("#showErrorForm").removeClass("hidden")
                    } else{
                        location.pathname = "/cuongproject/login";
                        $("#showErrorForm").addClass("hidden")
                        $('#contentSuccessForm').text("Sigup success")
                        $("#showSuccessForm").removeClass("hidden")
                   }
                })
            })
        </script>
        <script src="https://unpkg.com/flowbite@1.3.4/dist/flowbite.js"></script>
    </body>
</html>
