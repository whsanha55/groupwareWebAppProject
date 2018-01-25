<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문서 작성</title>
</head>
<body>

          <!--글쓰기-->


				   <span>
                        <span class="col-md-2 col-sm-2 col-xs-2">
                          <select class="form-control">
                            <option>1번라인</option>
                            <option>2번라인</option>
                            <option>3번라인</option>
                          </select>
                        </span>
					</span>
				  <a class="btn btn-primary" href="a_plain_page.html">관리</a>

				  <a class="btn btn-primary pull-right" href="a_index_authority.html">임시저장</a>
				  <a class="btn btn-primary pull-right" href="a_index_authority.html">상신</a>
				  <a class="btn btn-primary pull-right" href="a_index_authority.html">취소</a>
				


									<table id="approvalLine"
										class="table table-striped table-bordered">
										<tbody>
											<tr>
												<th rowspan="2">결재</th>
												<th>사장</th>
												<th>부장</th>
												<th>팀장</th>
												<th>대리</th>
											</tr>
											<tr>
												<td>사ㅇㅇ</td>
												<td>부ㅇㅇ</td>
												<td>팀ㅇㅇ</td>
												<td>대ㅇㅇ</td>
											</tr>
											<tr>
												<th rowspan="2">참조</th>
												<th>부장</th>
												<th></th>
												<th></th>
												<th></th>
											</tr>
											<tr>
												<td>참ㅇㅇ</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table>

									<table id="approvalData"
										class="table table-striped table-bordered">
										<tr>
											<th>양식명</th>
											<td>기안서</td>
											<th>보존기한</th>
											<td><select class="form-control">
													<option>영구보존</option>
													<option>10년</option>
												</select>
											</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>김사원</td>
											<th>부서</th>
											<td>인사1팀</td>

										</tr>
										<tr>
											<th>작성일</th>
											<td>2018년 01월 23일</td>
											<th>긴급여부</th>
											<td><select class="form-control">
						                            <option>일반</option>
						                            <option>긴급</option>
					                            </select>
										    </td> 

										</tr>
										<tr>
											<th>제목</th>
											<td colspan="3"><input type="text" name="apprTitle" id="apprTitle" class="form-control col-md-10"/></td>
										</tr>


									</table>





			  



					  <!---->
		 <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">
                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      </ul>
                    </div>

                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li>
                          <a data-edit="fontSize 5">
                            <p style="font-size:17px">Huge</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 3">
                            <p style="font-size:14px">Normal</p>
                          </a>
                        </li>
                        <li>
                          <a data-edit="fontSize 1">
                            <p style="font-size:11px">Small</p>
                          </a>
                        </li>
                      </ul>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                      <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                      <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                      <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                      <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                      <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                      <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                      <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                      <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                      <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
                      <div class="dropdown-menu input-append">
                        <input class="span2" placeholder="URL" type="text" data-edit="createLink" />
                        <button class="btn" type="button">Add</button>
                      </div>
                      <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
                    </div>

                    <div class="btn-group">
                      <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                      <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                    </div>
                  </div>
                  <div id="editor-one" style="min-height:500px" class="editor-wrapper"></div>		


                  <table id="approvalLine" class="table table-striped table-bordered">
					<tbody>
						<tr>
							<th rowspan="4">첨부파일</th>
							<td><input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" /></td>
						</tr>
						<tr>
							<td><input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" /></td>
						</tr>
						<tr>
							<td><input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" /></td>
						</tr>
						<tr>
							<td><input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" /></td>
						</tr>					
					</tbody>
				  </table>


                <!-- end of weather widget -->
              </div>
            </div>
          </div>
        <!-- /page content -->





</body>
</html>