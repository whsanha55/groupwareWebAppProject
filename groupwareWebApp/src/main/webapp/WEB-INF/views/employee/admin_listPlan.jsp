<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/fullcalendar.min.css" />
<script type="text/javascript" src="<c:url value='/js/fullcalendar.min.js'/>"></script>
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title col-md-12">
				<div class="col-md-12 col-sm-9 col-xs-12">
					<div>
						<div class="col-md-7">
							<div class="col-md-2">
								<h2>�������</h2>
							</div>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target=".bs-example-modal-lg">����ϱ�</button>
						</div>
					</div>
					<div>
						<div class="col-md-3 col-xs-offset-2">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false">
										<span id="search_concept">�˻�</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#contains">����</a></li>
										<li><a href="#its_equal">�����</a></li>
									</ul>
								</div>
								<input type="hidden" name="search_param" value="all"
									id="search_param"> <input type="text"
									class="form-control" name="x" placeholder="Search term...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">

			<div id="calendar" class="fc fc-unthemed fc-ltr">
				<div class="fc-toolbar fc-header-toolbar">
					<div class="fc-left">
						<div class="fc-button-group">
							<button type="button"
								class="fc-prev-button fc-button fc-state-default fc-corner-left">
								<span class="fc-icon fc-icon-left-single-arrow"></span>
							</button>
							<button type="button"
								class="fc-next-button fc-button fc-state-default fc-corner-right">
								<span class="fc-icon fc-icon-right-single-arrow"></span>
							</button>
						</div>
						<button type="button"
							class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
							disabled="">today</button>
					</div>
					<div class="fc-right">
						<div class="fc-button-group">
							<button type="button"
								class="fc-month-button fc-button fc-state-default fc-corner-left fc-state-active">month</button>
							<button type="button"
								class="fc-agendaWeek-button fc-button fc-state-default">week</button>
							<button type="button"
								class="fc-agendaDay-button fc-button fc-state-default">day</button>
							<button type="button"
								class="fc-listMonth-button fc-button fc-state-default fc-corner-right">list</button>
						</div>
					</div>
					<div class="fc-center">
						<h2>January 2018</h2>
					</div>
					<div class="fc-clear"></div>
				</div>
				<div class="fc-view-container" style="">
					<div class="fc-view fc-month-view fc-basic-view" style="">
						<table>
							<thead class="fc-head">
								<tr>
									<td class="fc-head-container fc-widget-header"><div
											class="fc-row fc-widget-header">
											<table>
												<thead>
													<tr>
														<th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th>
														<th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th>
														<th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th>
														<th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th>
														<th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th>
														<th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th>
														<th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th>
													</tr>
												</thead>
											</table>
										</div></td>
								</tr>
							</thead>
							<tbody class="fc-body">
								<tr>
									<td class="fc-widget-content"><div
											class="fc-scroller fc-day-grid-container"
											style="overflow: hidden; height: 624px;">
											<div class="fc-day-grid fc-unselectable">
												<div class="fc-row fc-week fc-widget-content"
													style="height: 104px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td
																		class="fc-day fc-widget-content fc-sun fc-other-month fc-past"
																		data-date="2017-12-31"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2018-01-01"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2018-01-02"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2018-01-03"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2018-01-04"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2018-01-05"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2018-01-06"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-top fc-sun fc-other-month fc-past"
																		data-date="2017-12-31"><span
																		class="fc-day-number">31</span></td>
																	<td class="fc-day-top fc-mon fc-past"
																		data-date="2018-01-01"><span
																		class="fc-day-number">1</span></td>
																	<td class="fc-day-top fc-tue fc-past"
																		data-date="2018-01-02"><span
																		class="fc-day-number">2</span></td>
																	<td class="fc-day-top fc-wed fc-past"
																		data-date="2018-01-03"><span
																		class="fc-day-number">3</span></td>
																	<td class="fc-day-top fc-thu fc-past"
																		data-date="2018-01-04"><span
																		class="fc-day-number">4</span></td>
																	<td class="fc-day-top fc-fri fc-past"
																		data-date="2018-01-05"><span
																		class="fc-day-number">5</span></td>
																	<td class="fc-day-top fc-sat fc-past"
																		data-date="2018-01-06"><span
																		class="fc-day-number">6</span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">12a</span> <span
																					class="fc-title">All Day Event</span>
																			</div></a></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 104px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2018-01-07"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2018-01-08"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2018-01-09"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2018-01-10"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2018-01-11"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2018-01-12"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2018-01-13"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-top fc-sun fc-past"
																		data-date="2018-01-07"><span
																		class="fc-day-number">7</span></td>
																	<td class="fc-day-top fc-mon fc-past"
																		data-date="2018-01-08"><span
																		class="fc-day-number">8</span></td>
																	<td class="fc-day-top fc-tue fc-past"
																		data-date="2018-01-09"><span
																		class="fc-day-number">9</span></td>
																	<td class="fc-day-top fc-wed fc-past"
																		data-date="2018-01-10"><span
																		class="fc-day-number">10</span></td>
																	<td class="fc-day-top fc-thu fc-past"
																		data-date="2018-01-11"><span
																		class="fc-day-number">11</span></td>
																	<td class="fc-day-top fc-fri fc-past"
																		data-date="2018-01-12"><span
																		class="fc-day-number">12</span></td>
																	<td class="fc-day-top fc-sat fc-past"
																		data-date="2018-01-13"><span
																		class="fc-day-number">13</span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 104px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2018-01-14"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2018-01-15"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2018-01-16"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2018-01-17"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2018-01-18"></td>
																	<td class="fc-day fc-widget-content fc-fri fc-past"
																		data-date="2018-01-19"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-past"
																		data-date="2018-01-20"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-top fc-sun fc-past"
																		data-date="2018-01-14"><span
																		class="fc-day-number">14</span></td>
																	<td class="fc-day-top fc-mon fc-past"
																		data-date="2018-01-15"><span
																		class="fc-day-number">15</span></td>
																	<td class="fc-day-top fc-tue fc-past"
																		data-date="2018-01-16"><span
																		class="fc-day-number">16</span></td>
																	<td class="fc-day-top fc-wed fc-past"
																		data-date="2018-01-17"><span
																		class="fc-day-number">17</span></td>
																	<td class="fc-day-top fc-thu fc-past"
																		data-date="2018-01-18"><span
																		class="fc-day-number">18</span></td>
																	<td class="fc-day-top fc-fri fc-past"
																		data-date="2018-01-19"><span
																		class="fc-day-number">19</span></td>
																	<td class="fc-day-top fc-sat fc-past"
																		data-date="2018-01-20"><span
																		class="fc-day-number">20</span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 104px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-past"
																		data-date="2018-01-21"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-past"
																		data-date="2018-01-22"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-past"
																		data-date="2018-01-23"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-past"
																		data-date="2018-01-24"></td>
																	<td class="fc-day fc-widget-content fc-thu fc-past"
																		data-date="2018-01-25"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-today fc-state-highlight"
																		data-date="2018-01-26"></td>
																	<td class="fc-day fc-widget-content fc-sat fc-future"
																		data-date="2018-01-27"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-top fc-sun fc-past"
																		data-date="2018-01-21"><span
																		class="fc-day-number">21</span></td>
																	<td class="fc-day-top fc-mon fc-past"
																		data-date="2018-01-22"><span
																		class="fc-day-number">22</span></td>
																	<td class="fc-day-top fc-tue fc-past"
																		data-date="2018-01-23"><span
																		class="fc-day-number">23</span></td>
																	<td class="fc-day-top fc-wed fc-past"
																		data-date="2018-01-24"><span
																		class="fc-day-number">24</span></td>
																	<td class="fc-day-top fc-thu fc-past"
																		data-date="2018-01-25"><span
																		class="fc-day-number">25</span></td>
																	<td
																		class="fc-day-top fc-fri fc-today fc-state-highlight"
																		data-date="2018-01-26"><span
																		class="fc-day-number">26</span></td>
																	<td class="fc-day-top fc-sat fc-future"
																		data-date="2018-01-27"><span
																		class="fc-day-number">27</span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="fc-event-container" colspan="3"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">12a</span> <span
																					class="fc-title">Long Event</span>
																			</div></a></td>
																	<td></td>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">10:30a</span> <span
																					class="fc-title">Meeting</span>
																			</div></a></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">7p</span> <span
																					class="fc-title">Birthday Party</span>
																			</div></a></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 104px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td class="fc-day fc-widget-content fc-sun fc-future"
																		data-date="2018-01-28"></td>
																	<td class="fc-day fc-widget-content fc-mon fc-future"
																		data-date="2018-01-29"></td>
																	<td class="fc-day fc-widget-content fc-tue fc-future"
																		data-date="2018-01-30"></td>
																	<td class="fc-day fc-widget-content fc-wed fc-future"
																		data-date="2018-01-31"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																		data-date="2018-02-01"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																		data-date="2018-02-02"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																		data-date="2018-02-03"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-top fc-sun fc-future"
																		data-date="2018-01-28"><span
																		class="fc-day-number">28</span></td>
																	<td class="fc-day-top fc-mon fc-future"
																		data-date="2018-01-29"><span
																		class="fc-day-number">29</span></td>
																	<td class="fc-day-top fc-tue fc-future"
																		data-date="2018-01-30"><span
																		class="fc-day-number">30</span></td>
																	<td class="fc-day-top fc-wed fc-future"
																		data-date="2018-01-31"><span
																		class="fc-day-number">31</span></td>
																	<td class="fc-day-top fc-thu fc-other-month fc-future"
																		data-date="2018-02-01"><span
																		class="fc-day-number">1</span></td>
																	<td class="fc-day-top fc-fri fc-other-month fc-future"
																		data-date="2018-02-02"><span
																		class="fc-day-number">2</span></td>
																	<td class="fc-day-top fc-sat fc-other-month fc-future"
																		data-date="2018-02-03"><span
																		class="fc-day-number">3</span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"
																		href="http://google.com/"><div class="fc-content">
																				<span class="fc-time">12a</span> <span
																					class="fc-title">Click for Google</span>
																			</div></a></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<div class="fc-row fc-week fc-widget-content"
													style="height: 104px;">
													<div class="fc-bg">
														<table>
															<tbody>
																<tr>
																	<td
																		class="fc-day fc-widget-content fc-sun fc-other-month fc-future"
																		data-date="2018-02-04"></td>
																	<td
																		class="fc-day fc-widget-content fc-mon fc-other-month fc-future"
																		data-date="2018-02-05"></td>
																	<td
																		class="fc-day fc-widget-content fc-tue fc-other-month fc-future"
																		data-date="2018-02-06"></td>
																	<td
																		class="fc-day fc-widget-content fc-wed fc-other-month fc-future"
																		data-date="2018-02-07"></td>
																	<td
																		class="fc-day fc-widget-content fc-thu fc-other-month fc-future"
																		data-date="2018-02-08"></td>
																	<td
																		class="fc-day fc-widget-content fc-fri fc-other-month fc-future"
																		data-date="2018-02-09"></td>
																	<td
																		class="fc-day fc-widget-content fc-sat fc-other-month fc-future"
																		data-date="2018-02-10"></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="fc-content-skeleton">
														<table>
															<thead>
																<tr>
																	<td class="fc-day-top fc-sun fc-other-month fc-future"
																		data-date="2018-02-04"><span
																		class="fc-day-number">4</span></td>
																	<td class="fc-day-top fc-mon fc-other-month fc-future"
																		data-date="2018-02-05"><span
																		class="fc-day-number">5</span></td>
																	<td class="fc-day-top fc-tue fc-other-month fc-future"
																		data-date="2018-02-06"><span
																		class="fc-day-number">6</span></td>
																	<td class="fc-day-top fc-wed fc-other-month fc-future"
																		data-date="2018-02-07"><span
																		class="fc-day-number">7</span></td>
																	<td class="fc-day-top fc-thu fc-other-month fc-future"
																		data-date="2018-02-08"><span
																		class="fc-day-number">8</span></td>
																	<td class="fc-day-top fc-fri fc-other-month fc-future"
																		data-date="2018-02-09"><span
																		class="fc-day-number">9</span></td>
																	<td class="fc-day-top fc-sat fc-other-month fc-future"
																		data-date="2018-02-10"><span
																		class="fc-day-number">10</span></td>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td class="fc-event-container"><a
																		class="fc-day-grid-event fc-h-event fc-event fc-start fc-end fc-draggable"><div
																				class="fc-content">
																				<span class="fc-time">12p</span> <span
																					class="fc-title">Lunch</span>
																			</div></a></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>