<%-- 
    Document   : dashboard
    Created on : Feb 23, 2022, 8:23:46 PM
    Author     : giaki
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin dashboard</title>
        <%
            ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
        %>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body class="bg-emerald-600">
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full p-5">
                <div class="flex justify-between">
                    <div class="p-8 m-2 text-lg text-blue-700 bg-lime-600 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                            <span class="font-medium mt-3" id="quantity"></span> 
                        </div>
                    </div>
                    <div class="p-8 m-2 text-lg text-red-700 bg-sky-400 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">    
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 19a2 2 0 01-2-2V7a2 2 0 012-2h4l2 2h4a2 2 0 012 2v1M5 19h14a2 2 0 002-2v-5a2 2 0 00-2-2H9a2 2 0 00-2 2v5a2 2 0 01-2 2z"></path></svg>
                            <span class="font-medium mt-3" id="total"></span> 
                        </div>
                    </div>
                </div>
                <div class="w-full px-20 py-10">
                    <div>
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
</style>
<div class="flex-auto" style="width:75%;">
    <canvas id="canvas"></canvas>
</div>
<!--<br>
<br>
<button id="randomizeData">Randomize Data</button>
<button id="addData">Add Data</button>
<button id="removeData">Remove Data</button>-->
<!--<script>
    window.onload = function() {
        function randomScalingFactor() {
            return Math.round(Math.random() * 100 * (Math.random() > 0.5 ? -1 : 1));
        }
        function randomColorFactor() {
            return Math.round(Math.random() * 255);
        }
        function randomColor(opacity) {
            return 'rgba(' + randomColorFactor() + ',' + randomColorFactor() + ',' + randomColorFactor() + ',' + (opacity || '.3') + ')';
        }
        function newDate(days) {
            return moment().add(days, 'd').toDate();
        }
        function newDateString(days) {
            return moment().add(days, 'd').format();
        }
        var config = {
            type: 'line',
            data: {
                datasets: [{
                    label: "Dataset with string point data",
                    data: [{
                        x: newDateString(0),
                        y: randomScalingFactor()
                    }, {
                        x: newDateString(2),
                        y: randomScalingFactor()
                    }, {
                        x: newDateString(4),
                        y: randomScalingFactor()
                    }, {
                        x: newDateString(5),
                        y: randomScalingFactor()
                    }],
                    fill: false
                }, {
                    label: "Dataset with date object point data",
                    data: [{
                        x: newDate(0),
                        y: randomScalingFactor()
                    }, {
                        x: newDate(2),
                        y: randomScalingFactor()
                    }, {
                        x: newDate(4),
                        y: randomScalingFactor()
                    }, {
                        x: newDate(5),
                        y: randomScalingFactor()
                    }],
                    fill: false
                }]
            },
            options: {
                responsive: true,
                title:{
                    display:true,
                    text:"Chart.js Time Point Data"
                },
                scales: {
                    xAxes: [{
                        type: "time",
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Date'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'value'
                        }
                    }]
                }
            }
        };
        jQuery.each(config.data.datasets, function(i, dataset) {
            dataset.borderColor = randomColor(0.4);
            dataset.backgroundColor = randomColor(0.5);
            dataset.pointBorderColor = randomColor(0.7);
            dataset.pointBackgroundColor = randomColor(0.5);
            dataset.pointBorderWidth = 1;
        });
        jQuery('#randomizeData').click(function() {
            jQuery.each(config.data.datasets, function(i, dataset) {
                jQuery.each(dataset.data, function(j, dataObj) {
                    dataObj.y = randomScalingFactor();
                });
            });
            window.myLine.update();
        });
        jQuery('#addData').click(function() {
            if (config.data.datasets.length > 0) {
                var lastTime = myLine.scales['x-axis-0'].labelMoments[0].length ? myLine.scales['x-axis-0'].labelMoments[0][myLine.scales['x-axis-0'].labelMoments[0].length - 1] : moment();
                var newTime = lastTime
                    .clone()
                    .add(1, 'day')
                    .format('MM/DD/YYYY HH:mm');
                for (var index = 0; index < config.data.datasets.length; ++index) {
                    config.data.datasets[index].data.push({
                        x: newTime,
                        y: randomScalingFactor()
                    });
                }
                window.myLine.update();
            }
        });
        jQuery('#removeData').click(function() {
            config.data.datasets.forEach(function(dataset, datasetIndex) {
                dataset.data.pop();
            });
            window.myLine.update();
        });
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myLine = new Chart(ctx, config);
    };
</script>-->
    <script>
        const labels = [
            'Tháng 1',
            'Tháng 2',
            'Tháng 3',
            'Tháng 4',
            'Tháng 5',
            'Tháng 6',
            'Tháng 7',
            'Tháng 8',
            'Tháng 9',
            'Tháng 10',
            'Tháng 11',
            'Tháng 12',
        ];

        const orders = [];
        const dataOrdersTotal = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        const dataOrdersQuantity = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var quantity = 0;
        var total = 0;
        <c:forEach items="${orders}" var="order">
        var quantityOrder = 0;
        var totalOrder = 0;
        var order = {
            id: ${order.id},
            date: new Date("${order.created_at}"),
            month: new Date("${order.created_at}").getMonth() + 1,
            state: "${order.state.name}",
            orderDetails: [],
        }
        orders.push(order)
            <c:forEach items="${order.orderDetails}" var="orderDetail">
        total += ${orderDetail.getRealPrice()};
        quantity += ${orderDetail.quantity};
        totalOrder += ${orderDetail.getRealPrice()};
        quantityOrder += ${orderDetail.quantity};
        order.orderDetails.push({
            id: ${orderDetail.id},
            quantity: ${orderDetail.quantity},
            price: ${orderDetail.price},
            discount: ${orderDetail.discount},
            isSale: ${orderDetail.sea.isSale},
            realPrice: ${orderDetail.getRealPrice()}
        })
            </c:forEach>
        dataOrdersTotal[new Date("${order.created_at}").getMonth()] += totalOrder;
        dataOrdersQuantity[new Date("${order.created_at}").getMonth()] += quantityOrder;
        var totalPrice = total;
        totalPrice = totalPrice.toLocaleString('vi', {style: 'currency', currency: 'VND'});
        $("#total").text(totalPrice);
        $("#quantity").text(quantity);
        </c:forEach>
        const data = {
            labels: labels,
            datasets: [{
                    label: 'Order',
                    data: dataOrdersTotal,
                    borderColor: 'rgb(255, 99, 132)',
                    backgroundColor: 'rgb(153, 51, 255)',
                    stack: 'combined',
                    type: 'bar'
                  },
                  {
                    label: 'Order',
                    data: dataOrdersTotal,
                    borderColor: 'rgb(255, 99, 132)',
                    backgroundColor: 'rgb(255, 99, 132)',
                    stack: 'combined'
                  }
            ]
        };

        const config = {
            type: 'line',
            data: data,
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: 'Total order'
                    }
                },
                scales: {
                    y: {
                        stacked: true
                    }
                }
            },
        };

        const myChart = new Chart(
                document.getElementById('myChart'),
                config
                );
    </script>
    
    <jsp:include page="../base/footer.jsp" />
</html>
