<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/angular.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.0.0.js"></script>
<title>Insert title here</title>

<style type="text/css">
* {
	opacity: 0.95;
}

input {
	display: block;
}

.mask1 {
	position: absolute;
	background-color: grey;
	opacity: 0.5;
	-moz-opacity: 0.5;
	top: 0px;
	left: 0px;
	z-index: 1000;
	display: none;
}

.mask2 {
	position: absolute;
	background-color: grey;
	opacity: 0.5;
	-moz-opacity: 0.5;
	top: 0px;
	left: 0px;
	z-index: 1000;
	display: block;
	width: 5000px;
	height: 5000px;
}

div>button {
	margin-left: 60px;
	border-radius: 10px;
}
</style>

</head>
<body>
	<div ng-app="app" ng-controller="ctl">
		<table border="1px" ng-style="table_style">
			<tr>
				<td>ename</td>
				<td>eid</td>
				<td>sex</td>
				<td>city</td>
				<td>bdate</td>
				<td>did</td>
			</tr>
			<!-- 遍历数据 -->
			<tr ng-repeat="x in data">
				<td>{{x.ename}}</td>
				<td>{{x.eid}}</td>
				<td>{{x.sex}}</td>
				<td>{{x.city}}</td>
				<td>{{x.bdate}}</td>
				<td>{{x.did}}</td>
				<td><button type="button" ng-click="del(x.eid)">删除</button></td>
				<td><button type="button" ng-click="update(x)">修改</button></td>
			</tr>
		</table>

		<!-- ng-style绑定样式表或是切换类名 -->
		<div ng-style="update_style">
			<input type="text" value="{{x.ename}}" ng-model="x.ename" /> <input
				type="text" value="{{x.eid}}" ng-model="x.eid" /> <input
				type="text" value="{{x.sex}}" ng-model="x.sex" /> <input
				type="text" value="{{x.city}}" ng-model="x.city" /> <input
				type="text" value="{{x.bdate}}" ng-model="x.bdate" />
				<select>
				 <option   value="{{de.did}}" selected="{{de.did==x.did}}"  ng-repeat="de in dl">{{de.did==x.did}}{{de.dname}}</option>
				</select>
			<button type="button" ng-click="sub()">提交</button>
			
		</div>
		<!-- ng-class 对象方式绑定类选择与否 -->
		<div ng-class="{mask1:hide,mask2:show}"></div>

		<script type="text/javascript">
			//初始化模块	
			var app = angular.module("app", []);
			// 创建控制器
			app.controller("ctl", function($scope, $http) {

				/* 加载部门信息 */
					$http({
						url:"servlet04",
					    method:"post"
					}).then(function(response){
						  console.log(response.data);
						  /* 将结果绑定到dl变量中 */
						  $scope.dl=response.data;
					},function(){});
					
				
				
				
				
				/* 修改提交按钮事件 */
				$scope.sub = function() {
					/*切换ng-class类  */
					$scope.hide = true;
					$scope.show = false;
					console.log($scope.x);
					/* 将修改div样式隐藏 */
					$scope.update_style = {
						display : "none"

					};
					$http({
						url : "servlet03",
						method : "post",
						/* 会转化为字符串格式后台通过request可取 */
						params:$scope.x
						/* json对象后台需特殊处理request无法获取 */
						//data : $scope.x
					}).then(function(response) {
						alert(response.status);
					}, function(response) {
						alert(response.status);
					});

				};

				// 表格样式折叠边框
				$scope.table_style = {
					"borderCollapse" : "collapse"
				};
				/* 初始化时修改div样式隐藏 */
				$scope.update_style = {
					display : "none"

				}
				/* 变量赋值 */
				$scope.ename = "hhhe";
				/* 修改按钮事件 */
				$scope.update = function(x) {
					//	alert(2234);
					/* 给修改div赋值 */
					$scope.x = x;
					/* 切换ng-class */
					$scope.hide = false;
					$scope.show = true;
					//$scop.status=true;
					/* 修改div样式 显示并且增加效果样式*/
					$scope.update_style = {
						display : "block",
						position : "absolute",
						top : "50%",
						left : "50%",
						backgroundColor : "green",
						borderRadius : "10px",
						zIndex : 1002
					}

				}
				/*删除div回调函数  */
				$scope.del = function(eid) {
					//alert(eid);
					/* ajax请求 */
					$http({
						url : "servlet02",
						/* 后台需特殊处理 */
						/* data : {
							eid : eid
						}, */
						/* 后台可直接取 */
						params:{eid:eid},
						method : "post"
					/* 成功回调 */
					}).then(function(response) {
						alert(response.status);
						window.location.reload();
						/* 失败回调 */
					}, function(response) {
						alert(response.status);
					});
				}
              /* 查询所有雇员信息 */
				$http({
					url : "servlet01",
					method : "post"
				}).then(function(response) {
					//alert("ok");
					$scope.data = response.data;
					console.log($scope.data);
				}, function(response) {
					alert("error");
				});
			});
		</script>
	</div>

</body>
</html>