<%-- 
    Document   : editCategory
    Created on : Feb 25, 2022, 2:57:40 PM
    Author     : giaki
--%>

<%@page import="model.product.Group"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.product.Category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
        <%
            Category category = (Category) request.getAttribute("category");
            ArrayList<Group> groups = (ArrayList<Group>)request.getAttribute("groups");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body class="bg-emerald-600">
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                
                <div class="flex justify-center items-center" style="height: 80vh">
                    <form style="width: 500px" id="form-category-edit">
                        <div id="showErrorForm" class="hidden">
                            <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                            </div>
                        </div>
                        <div id="showSuccessForm" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                            <span id="contentSuccessForm" class="font-medium"></span>
                        </div>
                        <input name="id" value="<%=category.getId()%>" type="hidden"/>
                        <div class="mb-6">
                            <label for="group" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">Group</label>
                            <select id="group" name="group" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5">
                                <c:forEach items="${groups}" var="group">
                                     <option value="${group.getId()}">${group.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-6">
                            <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Name category</label>
                            <input required type="text" id="name" name="name" value="<%=category.getName()%>"  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500">
                        </div>
                        <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            $("#group").val(<%=category.getGroupId()%>)
            $("#form-category-edit").on('submit', (e) => {
                e.preventDefault();
                if($("input[name='name']").val()===""){
                    $("#showSuccessForm").addClass("hidden")
                    $('#contentErrorForm').text("Value is empty");
                    $("#showErrorForm").removeClass("hidden")
                }else{
                    const data = {
                        id: $("input[name='id']").val(),
                        name: $("input[name='name']").val(),
                        groupId: $("#group").find(":selected").val(),
                    }
           
                    $.ajax({
                        method: "POST",
                        url: "/cuongproject/admin/category/edit",
                        data: data,
                    }).done(function (data) {
                        if (data?.detailMessage) {
                            $("#showSuccessForm").addClass("hidden")
                            $('#contentErrorForm').text(data?.detailMessage);
                            $("#showErrorForm").removeClass("hidden")
                        } else{
                            $("#showErrorForm").addClass("hidden")
                            $('#contentSuccessForm').text("Update success")
                            $("#category-show-name").text(data?.name)
                            $("#showSuccessForm").removeClass("hidden")
                        }
                    })
                }
                
            })
       </script>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>
