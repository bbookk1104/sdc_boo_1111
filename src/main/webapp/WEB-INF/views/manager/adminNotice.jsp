<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:choose>
    <c:when test="${not empty sessionScope.g }">
<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
     
    
        <title>똑독캣 마이페이지 - 관리자용</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
         <link rel="stylesheet" href="/resources/css/admin/style-admin.css">
         <link rel="stylesheet" href="/resources/css/admin/notice.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    </head>
    
    
    
	<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/adminIndex.do">똑독캣 관리자페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <!--<li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li>-->
                        <li><a class="dropdown-item" href="/logoutManager.do">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">홈</div>
                            <a class="nav-link" href="/adminIndex.do">

                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                마이페이지
                            </a>
                            <div class="sb-sidenav-menu-heading">메뉴</div>
                            <a class="nav-link collapsed" href="memberList.html" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                유저관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="/selectUserList.do">유저리스트</a>
                                    	 <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        	파트너관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                     <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="/partnerList.do">파트너승인</a>
                                            <a class="nav-link" href="/getPartner.do">파트너리스트</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                신고내역
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="reportList.html" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        리뷰신고
                                    </a>
                                    <a class="nav-link collapsed" href="reportList.html" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Q&A신고
                                    </a>
                                </nav>
                            </div>
                            <a class="nav-link" href="reservationList.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                예약내역
                            </a>
                            <a class="nav-link" href="/adminDmMessage.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                1:1문의내역
                            </a>
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <a class="nav-link" href="/adminNotice.do?reqPage=1">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                공지사항
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        DDOK DOG&CAT
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">공지사항</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">관리자용</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                관리페이지 공지사항
                            </div>
                            <div class="card-body">
                                <div style="font-size: 15px; padding-bottom: 10px;">게시글 총<code id="totalCount">[${totalNotice }]</code>건</div>
                                <c:if test="${not empty sessionScope.g }">
                                <div id="notice-write">
                                    <!-- <input type="hidden" id="memberId" value="${sessionScope.m.memberId}"> -->
                                            <a class="btn bc22 writeBtn" href="/adminNoticeWriteFrm.do">글쓰기</a> 
                                </div>
                               </c:if>
                                <table class="table">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">조회수</th>
                                        <th scope="col">관리</th>
                                    </tr>
                                    </thead>
                                   
                                    <tbody>
                                    <c:forEach items="${list }" var="ng" varStatus="i">
                                    <tr>
                                        <th scope="row">${(reqPage-1)*numPerPage + i.count }</th>
                                        <td><a href="/noticeGView.do?noticeGNo=${ng.noticeGNo }" style="text-decoration: none;color: #282f44;">${ng.noticeGTitle }</a></td>
                                        <td>${ng.noticeGWriter }</td>
                                        <td>${ng.noticeGDate }</td>
                                        <td>${ng.readGCount }</td>
                                        <td><button class="bc77"><a href="/delete.do?noticeGNo=${ng.noticeGNo }" class="bc77" style="text-decoration: none;border: none;">삭제</a></button></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div style="text-align: right;font-size: 20px;letter-spacing: 3px;margin-right: 25px;font-weight: bolder;">${pageNavi }</div>
                            
                            <div id="titleContentSerarch-Box">
                                <select style="width: 100px; height: 40px; margin-right: -4px;" >
                                    <option>제목</option>
                                    <option>제목+내용</option>
                                </select>
                                <input type="text" placeholder="입력하세요" style="width: 400px; height: 40px;" name="keyword" id="keyword">
                                <button class="searchbox-btn btn bc22 searchBtn" name="btnSearch" id="btnSearch">검색</button>
                            </div>
                        </div>
                        
                        
                        
                        
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; 똑독캣 2022</div>
                            <div>
                                <a href="/">메인으로 돌아가기</a>
                                &middot;
                                <a href="/#menu">산책 &amp; 돌봄 서비스</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
      	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/notice.js"></script>
    </body>
    </c:when>
    
    <c:otherwise>
    
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
    <title>똑독캣 공지사항</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
         <link rel="stylesheet" href="/resources/css/admin/style-admin.css">
         <link rel="stylesheet" href="/resources/css/admin/notice.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
        <jsp:include page="/WEB-INF/views/main/common/headContent.jsp"/>
    </head>
    <body>
	<jsp:include page="/WEB-INF/views/main/common/header.jsp"/>
	
	<main>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
				<div style="background-color: #1a1814;">
					<div style="height: 60px;line-height: 60px;margin-left: 50px;font-size: 25px;">똑독캣 공지사항</div>
                    <div class="container-fluid px-4">
                        <div class="card mb-4">
                            <div class="card-header" style="color:#ffc107;">
                                <i class="fas fa-table me-1"></i>
                                DDOK DOG&CAT NOTICE
                            </div>
                            <div class="card-body">
                                <div style="font-size: 15px; padding-bottom: 10px;color: black;">게시글 총<code id="totalCount">[${totalNotice }]</code>건</div>
                                <c:if test="${not empty sessionScope.g }">
                                <div id="notice-write">
                                    <!-- <input type="hidden" id="memberId" value="${sessionScope.m.memberId}"> -->
                                            <a class="btn bc22 writeBtn" href="/adminNoticeWriteFrm.do">글쓰기</a> 
                                </div>
                               </c:if>
                                <table class="table">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">No.</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">조회수</th>
                                    </tr>
                                    </thead>
                                   
                                    <tbody>
                                    <c:forEach items="${list }" var="ng" varStatus="i">
                                    <tr>
                                        <th scope="row">${(reqPage-1)*numPerPage + i.count }</th>
                                        <td><a href="/noticeGView.do?noticeGNo=${ng.noticeGNo }" style="text-decoration: none;color: #282f44;">${ng.noticeGTitle }</a></td>
                                        <td>${ng.noticeGWriter }</td>
                                        <td>${ng.noticeGDate }</td>
                                        <td>${ng.readGCount }</td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div style="text-align: right;font-size: 20px;letter-spacing: 3px;margin-right: 25px;font-weight: bolder;">${pageNavi }</div>
                            <!--  
                            <ul style="text-align: center;font-size: 20px;letter-spacing: 3px;" list-style-type: disc>${pageNavi }</ul>
                            -->
                            <!--  
                            <nav aria-label="Page navigation example" style="margin-right: 20px;">
                                <ul class="pagination justify-content-end">
                                
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                
                                <br>
                                <li style="text-align: center;">${pageNavi }</li>
                                <br>
                                <!--  
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                
                                <!--  
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                                
                                </ul>
                            </nav>
                            -->
                            <div id="titleContentSerarch-Box">
                                <select style="width: 100px; height: 40px; margin-right: -4px;" >
                                    <option>제목</option>
                                    <option>제목+내용</option>
                                </select>
                                <input type="text" placeholder="입력하세요" style="width: 400px; height: 40px;" name="keyword" id="keyword">
                                <button class="searchbox-btn btn bc22 searchBtn" name="btnSearch" id="btnSearch">검색</button>
                            </div>
                        </div>
                        
                        
                        
                        
                    </div>
                  </div>  
                </main>
	
	
	<jsp:include page="/WEB-INF/views/main/common/footer.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/notice.js"></script>
</body>
    
    </c:otherwise>
    
    </c:choose>
    
</html>