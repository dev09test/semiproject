<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>서버에 파라미터를 전송하려면</h1>
<p>
	form태그 input태그를 이용 -> input name속성, value속성을 이용해서 key=value가 된다.
	QueryString방식을 사용한다. -> url주소를 설정하는 부분에 ?key=value&key=value 작성
	key=value
</p>
<h2>form으로 데이터 보내기</h2>
<p>서버에 다수의 데이터를 전송하거나 보안요소가 필요한 정보는 대체적으로 form으로 전송</p>
<form action="<%=request.getContextPath()%>/paramTest.do" method="post">
	<input type="text" name="name">
	<input type="text" name="age">
	<input type="submit" value="전송">
</form>

<h2>QueryString으로 데이터 보내기</h2>
<a href="<%=request.getContextPath()%>/boardView.do?boardNo=1">게시글1</a>
<button onclick="getGallary();">갤러리1</button>
<ul id="menu">
	<li>공지사항</li>
	<li onclick="location.href='<%=request.getContextPath()%>/menu?menu=move'">이동하기</li>
</ul>


<form id="myform" name="testForm">
	<input name="age">
	<select id="addr" name="test">
		<option value="/test.do">/test.do</option>
		<option value="/test2/do">test2/do</option>
		<option value="/test3.do">/test3.do</option>
	</select>	
</form>

<select name="aaa" id="select">
		<option value="/test.do">/test.do</option>
		<option value="/test2/do">test2/do</option>
		<option value="/test3.do">/test3.do</option>
</select>
2

<button id="btn">전송</button>
<script>
	$("#select").change(e=>{
		$.get("<%=request.getContextPath()%>/test.do?select="+$(e.target).val(),data=>{
			alert("요청완료");
		})
		$.ajax({
			url:"<%=request.getContextPath()%>/test.do",
			data:{select:$("e.target").val()},
			success:data=>{
				alert("요청완료")
			}
		})
	})


	let count=1;
	document.getElementById("btn").addEventListener("click",e=>{
		const form=document.getElementById("myform")
		const addr=document.getElementById("addr").value;
		//const addr=["/test.do","test2/do","/test3.do"]
		/* let url="";
		switch(count++%3){
			case 0 : url=addr[0];break;
			case 1 : url=addr[1];break;
			case 2 : url=addr[2];break;
		} */
		form.action="<%=request.getContextPath()%>"+addr;
		form.submit();
	});

</script>



<script>
	const menu=document.querySelectorAll("#menu>li")
	for(let i=0;i<menu.length;i++){
		menu[i].addEventListener("click",e=>{
			location.replace("<%=request.getContextPath()%>/menu?menu="+menu[i].innerText);
		});
	}
	const getGallary=()=>{
		location.assign('<%=request.getContextPath()%>/gallary?category=kid&no=2');
	} 
	


</script>

<h1>ajax요청처리하기</h1>
<p>
	요청주소 : 
	응답처리할 함수 : 
</p>
<button	id="ajaxbtn">요청</button>
<div id="area"></div>
<script>
	$("#ajaxbtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajaxtest.do",
			data:{first:$("#select").val(),name:"유병승"},
			success:data=>{
				console.log(data);
				const persons=data.split("\n");
				console.log(persons[0].split(",")[0]);
				console.log(persons);
				const table=$("<table>");
				table.html("<tr><th>이름</th><th>나이</th><th>주소</th>");
				for(let i=0;i<persons.length;i++){
					//console.log(persons[i]);
					//if(i==0) {
					let p=persons[i].split(",");
					//	p[0]
					//}
					let name=$("<td>").text(p[0]);
					let age=$("<td>").text(p[1]);
					let addr=$("<td>").text(p[3]);
					let tr=$("<tr>").append(name).append(age).append(addr);
					table.append(tr);
				}
				$("#area").html(table);
				//$("#area").text(data);
			},error:(request,m)=>{
				console.log(request);
				$("#area").html(request.responseText);
			}
		})
	});
</script>

<h2>json데이터 요청하기</h2>
<button id="jsonBtn">가져오기</button>
<div id="jsonData"></div>
<script>
	$("#jsonBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ajaxJson.do",
			success:data=>{
				console.log(data);
				const table=$("<table>");
				const header=$("<tr><th>이름</th><th>나이</th><th>주소</th><th>성별</th><tr>");
				table.html(header);
				data
					.filter(v=>v['addr'].includes("수원"))
					.forEach(v=>{
					let name=$("<td>").text(v['name']);
					let age=$("<td>").text(v['age']);
					let addr=$("<td>").text(v['addr']);
					let gender=$("<td>").text(v['gender']);
					let tr=$("<tr>").append(name).append(age).append(addr).append(gender);
					table.append(tr);
				});
				$("#jsonData").html(table);
			}
		});
	});
</script>







</body>
</html>






