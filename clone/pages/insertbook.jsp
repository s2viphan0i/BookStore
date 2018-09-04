<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>        
    <title>Taurus</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <link rel="icon" type="image/ico" href="http://aqvatarius.com/themes/taurus_v12/html/favicon.ico"/>
    
    <link href="../css/stylesheets.css" rel="stylesheet" type="text/css" />        
    
    <script type='text/javascript' src='../js/plugins/jquery/jquery.min.js'></script>
    <script type='text/javascript' src='../js/plugins/jquery/jquery-ui.min.js'></script>   
    <script type='text/javascript' src='../js/plugins/jquery/jquery-migrate.min.js'></script>
    <script type='text/javascript' src='../js/plugins/jquery/globalize.js'></script>    
    <script type='text/javascript' src='../js/plugins/bootstrap/bootstrap.min.js'></script>
    
    <script type='text/javascript' src='../js/plugins/uniform/jquery.uniform.min.js'></script>
    <script type='text/javascript' src='../js/plugins/select2/select2.min.js'></script>
    <script type='text/javascript' src='../js/plugins/tagsinput/jquery.tagsinput.min.js'></script>
    <script type='text/javascript' src='../js/plugins/jquery/jquery-ui-timepicker-addon.js'></script>
    <script type='text/javascript' src='../js/plugins/bootstrap/bootstrap-file-input.js'></script>
    
    <script type='text/javascript' src='../js/plugins.js'></script>    
    <script type='text/javascript' src='../js/actions.js'></script>
    <script type='text/javascript' src='../js/settings.js'></script>
</head>
<body class="wall-num9"> 
    
    <div class="container theme-black container-fixed">        
        <div class="row">                   
            <div class="col-md-12">
                
                 <nav class="navbar brb" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-reorder"></span>                            
                        </button>                                                
                        <a class="navbar-brand" href="index.html"><img src="../img/logo.png"/></a>                                                                                     
                    </div>
                    <div class="collapse navbar-collapse navbar-ex1-collapse">                                     
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="index.html">
                                    <span class="icon-home"></span> dashboard
                                </a>
                            </li>                            
                            <li class="dropdown active">
                                <a href="form_elements.html#" class="dropdown-toggle" data-toggle="dropdown"><span class="icon-pencil"></span> forms</a>
                                <ul class="dropdown-menu">                                    
                                    <li><a href="form_elements.html">Form elements</a></li>
                                    <li><a href="form_editors.html">WYSIWYG</a></li>
                                    <li><a href="form_files.html">File handling</a></li>
                                    <li><a href="form_validation.html">Validation and wizard</a></li>
                                </ul>                                
                            </li>
                            <li class="dropdown">
                                <a href="form_elements.html#" class="dropdown-toggle" data-toggle="dropdown"><span class="icon-cogs"></span> components</a>
                                <ul class="dropdown-menu">
                                    <li><a href="component_blocks.html">Blocks and panels</a></li>
                                    <li><a href="component_buttons.html">Buttons</a></li>
                                    <li><a href="component_modals.html">Modals and popups</a></li>                                    
                                    <li><a href="component_tabs.html">Tabs, accordion, selectable, sortable</a></li>
                                    <li><a href="component_progress.html">Progressbars</a></li>
                                    <li><a href="component_lists.html">List groups</a></li>
                                    <li><a href="component_messages.html">Messages</a></li>                                    
                                    <li>
                                        <a href="form_elements.html#">Tables<i class="icon-angle-right pull-right"></i></a>
                                        <ul class="dropdown-submenu">
                                            <li><a href="component_table_default.html">Default tables</a></li>
                                            <li><a href="component_table_sortable.html">Sortable tables</a></li>                                            
                                        </ul>
                                    </li>                                                                        
                                    <li>
                                        <a href="form_elements.html#">Layouts<i class="icon-angle-right pull-right"></i></a>
                                        <ul class="dropdown-submenu">
                                            <li><a href="component_layout_blank.html">Default layout(blank)</a></li>
                                            <li><a href="component_layout_custom.html">Custom navigation</a></li>
                                            <li><a href="component_layout_scroll.html">Content scroll</a></li>
                                            <li><a href="component_layout_fixed.html">Fixed content</a></li>
                                            <li><a href="component_layout_white.html">White layout</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="component_charts.html">Charts</a></li>
                                    <li><a href="component_maps.html">Maps</a></li>
                                    <li><a href="component_typography.html">Typography</a></li>
                                    <li><a href="component_gallery.html">Gallery</a></li>
                                    <li><a href="component_calendar.html">Calendar</a></li>
                                    <li><a href="component_icons.html">Icons</a></li>  
                                    <li><a href="component_portlet.html">Portlet</a></li>
                                </ul>
                            </li>                          
                            <li><a href="widgets.html"><span class="icon-globe"></span> widgets</a></li>
                            <li class="dropdown">
                                <a href="form_elements.html#" class="dropdown-toggle" data-toggle="dropdown"><span class="icon-file-alt"></span> pages</a>
                                <ul class="dropdown-menu">
                                    <li><a href="sample_login.html">Login</a></li>
                                    <li><a href="sample_registration.html">Registration</a></li>
                                    <li><a href="sample_profile.html">User profile</a></li>
                                    <li><a href="sample_profile_social.html">Social profile</a></li>
                                    <li><a href="sample_edit_profile.html">Edit profile</a></li>
                                    <li><a href="sample_mail.html">Mail</a></li>
                                    <li><a href="sample_search.html">Search</a></li>
                                    <li><a href="sample_invoice.html">Invoice</a></li>
                                    <li><a href="sample_contacts.html">Contacts</a></li>
                                    <li><a href="sample_tasks.html">Tasks</a></li>
                                    <li><a href="sample_timeline.html">Timeline</a></li>
                                    <li>
                                        <a href="form_elements.html#">Email templates<i class="icon-angle-right pull-right"></i></a>
                                        <ul class="dropdown-submenu">
                                            <li><a href="email_sample_1.html">Sample 1</a></li>
                                            <li><a href="email_sample_2.html">Sample 2</a></li>
                                            <li><a href="email_sample_3.html">Sample 3</a></li>
                                            <li><a href="email_sample_4.html">Sample 4</a></li>
                                        </ul>
                                    </li>                                     
                                    <li>
                                        <a href="form_elements.html#">Error pages<i class="icon-angle-right pull-right"></i></a>
                                        <ul class="dropdown-submenu">
                                            <li><a href="sample_error_403.html">403 Forbidden</a></li>
                                            <li><a href="sample_error_404.html">404 Not Found</a></li>
                                            <li><a href="sample_error_500.html">500 Internal Server Error</a></li>
                                            <li><a href="sample_error_503.html">503 Service Unavailable</a></li>
                                            <li><a href="sample_error_504.html">504 Gateway Timeout</a></li>                                                                                       
                                        </ul>
                                    </li>                                    
                                </ul>
                            </li>                       
                            <li><a href="http://aqvatarius.com/themes/taurus_v12/front-end/index.html"><span class="icon-star"></span> Front-end Template</a></li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="search..."/>
                            </div>                            
                        </form>                                            
                    </div>
                </nav>               

            </div>            
        </div>

        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="form_elements.html#">Trang chủ</a></li>                    
                    <li><a href="form_elements.html#">Sách</a></li>                    
                    <li class="active">Thêm mới</li>
                </ol>
            </div>
        </div>        
        
        <div class="row">
            <div class="col-md-12">
                
                <div class="block">
                    <div class="header">
                        <h2>Thêm sản phẩm</h2>
                    </div>
                    <div class="content controls">
                    	<c:url value="/admin/pages/insertBook" var="insertBook"/>
                    	<form action="/BookShopOnline/admin/pages/insertBook" method="post" enctype = "multipart/form-data">
	                        <div class="form-row">
	                            <div class="col-md-3">Tên sách:</div>
	                            <div class="col-md-9"><input type="text" name="name" class="form-control" placeholder="Tên sách"/></div>
	                        </div>
	                        <div class="form-row">
	                            <div class="col-md-3">Tác giả:</div>
	                            <div class="col-md-9"><input type="text" name="author" class="form-control" placeholder="Tên tác giả"/></div>
	                        </div>
	                        <div class="form-row">
	                            <div class="col-md-3">Hình ảnh:</div>
	                            <div class="col-md-9">
	                                <div class="input-group file">                                    
	                                    <input type="text" class="form-control" placeholder="Hình ảnh"/>
	                                    <input type="file" name="file" accept="image/*"/>
	                                    <span class="input-group-btn">
	                                        <button class="btn btn-primary" type="button">Duyệt</button>
	                                    </span>
	                                </div>                                
	                            </div>
	                        </div>
	                        <div class="form-row">
	                            <div class="col-md-3">Ngày xuất bản:</div>
	                            <div class="col-md-9">
	                                <div class="input-group">
	                                    <div class="input-group-addon"><span class="icon-calendar-empty"></span></div>
	                                    <input type="text" name="releaseDate" class="datepicker form-control" value="09/15/2000"/>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-row">
	                            <div class="col-md-3">Giá bán:</div>
	                            <div class="col-md-9">
	                                <input type="text" name="price" class="form-control" placeholder="VND"/>
	                            </div>
	                        </div>
	                        <div class="form-row">
	                            <div class="col-md-3">Số lượng:</div>
	                            <div class="col-md-9">
	                                <input id="spinner" name="quantity" class="form-control" name="spinner" value="10"/>
	                            </div>
	                        </div>                                       
	                        <div class="form-row">
	                            <div class="col-md-3">Mô tả:</div>
	                            <div class="col-md-9"><textarea class="form-control" name="note" placeholder="Viết mô tả"></textarea></div>
	                        </div>
	                        <div class="form-row" style="margin-top:10px; margin-bottom:10px;">
	                            <div class="col-md-1 col-md-offset-5 col-sm-2 col-sm-offset-4 col-xs-2 col-xs-offset-4">
	                                <input type="submit" class="btn btn-success" value="Đăng"/>
	                            </div>
	                            <div class="col-md-1 col-sm-2 col-xs-2">
	                                <div style="width:100%" class="btn btn-danger">Đặt lại</div>
	                            </div>
	                        </div>           
                    	</form>
                    </div>
                </div>
			</div>
        </div>
    </div>
    
</body>
</html>