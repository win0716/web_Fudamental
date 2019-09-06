<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp" %>
<%
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	try{
		cPage= Integer.parseInt(tempPage);		
	}catch(NumberFormatException e){
		cPage = 1;
	}
%>
  <nav aria-label="breadcrumb">
    <ol class="breadcrumb justify-content-end">
      <li class="breadcrumb-item"><a href="/">Home</a></li>
      <li class="breadcrumb-item active" aria-current="page">Member</li>
    </ol>
  </nav>
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">회원가입</h5>
            <form class="form-horizontal" role="form" name="f" method="post" action="save.jsp">
              <div class="form-group">
                <label class="col-form-label" for="name">성명</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해 주세요">
              	<div id="nameMessage"></div>
              </div>
              <div class="form-group">
                <label class="col-form-label" for="id">아이디</label>
                <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
              	<div id="idMessage"></div>
              </div>
              <div class="form-group">
                <label for="email">이메일 주소</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소를 입력해주세요">
              	<div id="emailMessage"></div>
              </div>
              <div class="form-group">
                <label for="pwd">비밀번호</label>
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요">
              	<div id="pwdMessage"></div>
              </div>
              <div class="form-group">
                <label for="repwd">비밀번호 확인</label>
                <input type="password" class="form-control" name="repwd" id="repwd"
                  placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요">
              	<div id="repwdMessage"></div>
              </div>
              <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <input type="tel" class="form-control" name="phone" id="phone" placeholder="휴대폰번호를 입력해 주세요">
              	<div id=phoneMessage"></div>
              </div>
              <%-- 
              <div class="form-group text-center">
                <button type="submit" id="join-submit" class="btn btn-primary">
                  회원가입<i class="fa fa-check spaceLeft"></i>
                </button>
                <button type="reset" class="btn btn-warning">
                  가입취소<i class="fa fa-times spaceLeft"></i>
                </button>
              </div>
              --%>
              <input type="hidden" name="checkId" id="checkId" value="no"/>
              <input type="hidden" name="checkPwd" id="checkPwd" value="no"/>
            </form>
            <div class="text-right">
							<a href="" id="saveMember" class="btn btn-outline-primary">등록</a>
							<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
			</div>
			<script>
			 $(function(){
			 	$("#saveMember").on('click',function(event){
			 		event.preventDefault();
			 		if($("#name").val().length==0){
			 		$("#nameMessage").html("<span class='text-danger'>이름을 입력하세요</span>");
			 		$("#name").addClass("is-invalid");
			 		$("#name").focus();
			 		return;
			 	}
			 		
			 	if($("#id").val().length < 4 || $("#id").val().length > 12){
					$("#idMessage").html("<spen class='text-danger'>아이디는 4자 이상, 12자 이하 이여야 합니다.</span>");
			 		$("#id").addClass("is-invalid");
			 		$("#id").focus();
			 		return;
				}
			 	if($("#checkId").val()=="no"){
			 		return;			 	
			 	}
				
			 	let regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			 	if(regEmail.test($("#email").val())==false){
			 		$("#emailMessage").html("<spen class='text-danger'>올바른 이메일 형식이 아닙니다.</span>");
			 		$("#email").addClass("is-invalid");
			 		$("#email").focus();
			 		return;
			 		}
			 	
			
			 	f.submit();
			 });//enf of register click event
			 
			 $("#name").on("keyup",function(){
				$("#name").removeClass("is-invalid");
				$("#nameMessage").html('');
			 });
			 
			 $("#id").on("keyup",function(){
				$("#id").removeClass("is-invalid");
				$("#idMessage").html('');
				
				if($("#id").val().length >= 4 && $("#id").val().length <= 12){
					$.ajax({
						type : 'GET',
						url : 'check_id_ajax.jsp?id='+$("#id").val(),
						dataType : 'json',
						error : function(){
							alert('error');
						},
						success : function(json){
							//json => {"result" : "ok" }
							//json => {"result" : "fail"}
							
							if(json.result == "ok"){
							$("#idMessage").html("<span class='text-danger'>이미 등록된 아이디 입니다.</span>");
					 		$("#id").addClass("is-invalid");
					 		$("#checkId").val("no");
							}else{
							
					 		$("#idMessage").html("<span class='text-success'>등록 가능한 아이디 입니다.</span>");
					 		$("#checkId").val("yes");
							}
						}
					});			 
				}
			 });//end og id key event
			 
			 
			 $("#email").on("keyup",function(){
				$("#email").removeClass("is-invalid");
				$("#emailMessage").html('');
				if($("#email").val().length >= 4 && $("#email").val().length >= 12){
					$.ajax({
						type : 'GET',
						url : 'check_email_ajax.jsp?email='+$("#email").val(),
						dataType : 'json',
						error : function(){
							alert('error');
						},
						success : function(json){
							//json => {"result" : "ok" }
							//json => {"result" : "fail"}
							
							if(json.result == "ok"){
							$("#emailMessage").html("<span class='text-danger'>이미 등록된 이메일 입니다.</span>");
					 		$("#email").addClass("is-invalid");
					 		$("#checkId").val("no");
							}else{
							
					 		$("#emailMessage").html("<span class='text-success'>등록 가능한 이메일 입니다.</span>");
					 		$("#checkId").val("yes");
							}
						}
					});			 
				}
			 });
			 
			 });  //enf of load event
			 
			</script>
          </div>
        </div>
      </div>

    </div>
  </div>
<%@ include file="../inc/footer.jsp"%>