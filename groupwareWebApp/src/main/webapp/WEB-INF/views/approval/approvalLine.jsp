<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>결재선 선택</title>

		<style>
			.nav_menu{ background-color:#1abb9c !important}
			
			.toggle {
			float: right;
			margin: 0;
			padding-top: 16px;
			width: 150px;
			padding-right: 10px;
			}
	
			.toggle a i {
			font-size: 26px;
			float: right;
			padding-right: 12px;
			}
	
			.nav_menu {
			position: static;
			height: 57px;
			}
	
			.x_panel {
		    width: 40%;
		    padding: 10px 16px;
		    display: inline-block;
		    background: #fff;
		    border: 1px solid #E6E9ED;
		    -webkit-column-break-inside: avoid;
		    -moz-column-break-inside: avoid;
		    column-break-inside: avoid;
		    opacity: 1;
		    transition: all .2s ease;
		    margin-left: 20px;
		    height: 600px;
			}
		</style>

	</head>
	
	<body>
        <!-- page content -->
        <div class="right_col" role="main" style="min-height: 939px; background-color: rgb(230, 233, 237);">
          <div class="">
            <div class="page-title">
           
              <div class="title_right">
			
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
             
  
					
					<div class="x_panel" style="width: 30%">
						
						  <!--검색창-->
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
				<!--검색창 끝-->

						<div class="panel-body">
                            <table class="table table-bordered">
                              <thead>
                                <tr>
                                  <th>#</th>
                                  <th>First Name</th>
                                  <th>Last Name</th>
                                  <th>Username</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <th scope="row">1</th>
                                  <td>Mark</td>
                                  <td>Otto</td>
                                  <td>@mdo</td>
                                </tr>
                                <tr>
                                  <th scope="row">2</th>
                                  <td>Jacob</td>
                                  <td>Thornton</td>
                                  <td>@fat</td>
                                </tr>
                                <tr>
                                  <th scope="row">3</th>
                                  <td>Larry</td>
                                  <td>the Bird</td>
                                  <td>@twitter</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
								
							 
                </div>

					
					<div class="x_panel"style="width: 20%">
						<!--버튼있어야함-->
							  
					</div>

					
					<div class="x_panel" style="width: 40%">
						<!--내 결재선 선택-->
								
							  
					</div>
                </div>

              </div>
                  </div>
                </div>
              </div>
            </div>




          </div>
        </div>
        <!-- /page content -->

	</body>
</html>