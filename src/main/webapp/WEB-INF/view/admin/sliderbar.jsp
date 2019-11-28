<%@ page import="com.mobile.web.quiz.model.admin.SideBarItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    SideBarItem sideBarItem = (SideBarItem)request.getAttribute("sideBarItem");
    if (sideBarItem == null) {
        sideBarItem = new SideBarItem("", "");
    }
%>
<aside class="left-side sidebar-offcanvas">
    <section class="sidebar ">
        <div class="page-sidebar  sidebar-nav">
            <!-- BEGIN SIDEBAR MENU -->
            <ul id="menu" class="page-sidebar-menu">
                <li class="<%= sideBarItem.getMainMenu().equals("dashboard")? "active" : ""%>">
                    <a href="/admin">
                        <i class="livicon" data-name="home" data-size="18" data-c="#418BCA" data-hc="#418BCA" data-loop="true"></i>
                        <span class="title">仪表板</span>
                    </a>
                </li>

                <li class="<%= sideBarItem.getMainMenu().equals("user")? "active" : ""%>">
                    <a href="#">
                        <i class="livicon" data-name="users" data-size="18" data-c="#00bc8c" data-hc="#00bc8c" data-loop="true"></i>
                        <span class="title">用户管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="<%= sideBarItem.getMainMenu().equals("user") && sideBarItem.getSubMenu().equals("list")? "active" : ""%>">
                            <a href="/admin/user-list">
                                <i class="fa fa-angle-double-right"></i> 用户列表
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("user") && sideBarItem.getSubMenu().equals("analysis")? "active" : ""%>">
                            <a href="/admin/user-analysis">
                                <i class="fa fa-angle-double-right"></i> 用户分析
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("user") && sideBarItem.getSubMenu().equals("login-history")? "active" : ""%>">
                            <a href="/admin/user-login-history">
                                <i class="fa fa-angle-double-right"></i> 登录历史
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("info-center")? "active" : ""%>">
                    <a href="#">
                        <i class="livicon" data-name="brush" data-size="18" data-c="#EF6F6C" data-hc="#EF6F6C" data-loop="true"></i>
                        <span class="title">资讯中心</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="<%= sideBarItem.getMainMenu().equals("info-center") && sideBarItem.getSubMenu().equals("notice")? "active" : ""%>">
                            <a href="/admin/notice-list">
                                <i class="fa fa-angle-double-right"></i> 公告
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("info-center") && sideBarItem.getSubMenu().equals("article")? "active" : ""%>">
                            <a href="/admin/article-list">
                                <i class="fa fa-angle-double-right"></i> 话题
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("order")? "active" : ""%>">
                    <a href="#">
                        <i class="livicon" data-name="doc-portrait" data-c="#5bc0de" data-hc="#5bc0de" data-size="18" data-loop="true"></i>
                        <span class="title">订单管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="<%= sideBarItem.getMainMenu().equals("order") && sideBarItem.getSubMenu().equals("list")? "active" : ""%>">
                            <a href="/admin/order-list">
                                <i class="fa fa-angle-double-right"></i> 订单列表
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("order") && sideBarItem.getSubMenu().equals("check")? "active" : ""%>">
                            <a href="/admin/order-check">
                                <i class="fa fa-angle-double-right"></i> 查看订单
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("review")? "active" : ""%>">
                    <a href="#">
                        <i class="livicon" data-name="settings" data-c="#F89A14" data-hc="#F89A14" data-size="18" data-loop="true"></i>
                        <span class="title">审核管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="<%= sideBarItem.getMainMenu().equals("review") && sideBarItem.getSubMenu().equals("pending")? "active" : ""%>">
                            <a href="/admin/pending-review">
                                <i class="fa fa-angle-double-right"></i> 待审核
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("review") && sideBarItem.getSubMenu().equals("audited")? "active" : ""%>">
                            <a href="/admin/audited">
                                <i class="fa fa-angle-double-right"></i> 已审核
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("finance")? "active" : ""%>">
                    <a href="/admin/finance">
                        <i class="livicon" data-name="lab" data-c="#EF6F6C" data-hc="#EF6F6C" data-size="18" data-loop="true"></i>
                        <span class="title">财务管理</span>
                    </a>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("fund")? "active" : ""%>">
                    <a href="#">
                        <i class="livicon" data-name="briefcase" data-c="#418BCA" data-hc="#418BCA" data-size="18" data-loop="true"></i>
                        <span class="title">资金管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="<%= sideBarItem.getMainMenu().equals("fund") && sideBarItem.getSubMenu().equals("recharge")? "active" : ""%>">
                            <a href="/admin/fund-recharge">
                                <i class="fa fa-angle-double-right"></i> 充值管理
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("fund") && sideBarItem.getSubMenu().equals("cash")? "active" : ""%>">
                            <a href="/admin/fund-cash">
                                <i class="fa fa-angle-double-right"></i> 提现管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("plate")? "active" : ""%>">
                    <a href="#">
                        <i class="livicon" data-name="thumbnails-big" data-c="#00bc8c" data-hc="#00bc8c" data-size="18" data-loop="true"></i>
                        <span class="title">板块管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="<%= sideBarItem.getMainMenu().equals("plate") && sideBarItem.getSubMenu().equals("add-circle")? "active" : ""%>">
                            <a href="/admin/add-circle">
                                <i class="fa fa-angle-double-right"></i> 新增圈子
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("plate") && sideBarItem.getSubMenu().equals("circle-management")? "active" : ""%>">
                            <a href="/admin/circle-management">
                                <i class="fa fa-angle-double-right"></i> 圈子管理
                            </a>
                        </li>
                    </ul>
                    </a>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("withdrawal")? "active" : ""%>">
                    <a href="/admin/withdrawal">
                        <i class="livicon" data-name="credit-card" data-size="18" data-c="#F89A14" data-hc="#F89A14" data-loop="true"></i>
                        <span class="title">提现审核</span>
                    </a>
                </li>
                <li class="<%= sideBarItem.getMainMenu().equals("settings")? "active" : ""%>">
                    <a href="#">
                        <i class="livicon" data-name="gear" data-size="18" data-c="#EF6F6C" data-hc="#EF6F6C" data-loop="true"></i>
                        <span class="title">设置</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="<%= sideBarItem.getMainMenu().equals("settings") && sideBarItem.getSubMenu().equals("basic")? "active" : ""%>">
                            <a href="/admin/setting-basic">
                                <i class="fa fa-angle-double-right"></i> 基本设置
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("settings") && sideBarItem.getSubMenu().equals("parameter")? "active" : ""%>">
                            <a href="/admin/setting-parameter">
                                <i class="fa fa-angle-double-right"></i> 参数设置
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("settings") && sideBarItem.getSubMenu().equals("menu")? "active" : ""%>">
                            <a href="/admin/setting-menu">
                                <i class="fa fa-angle-double-right"></i> 菜单设置
                            </a>
                        </li>
                        <li class="<%= sideBarItem.getMainMenu().equals("settings") && sideBarItem.getSubMenu().equals("payment")? "active" : ""%>">
                            <a href="/admin/setting-payment">
                                <i class="fa fa-angle-double-right"></i> 支付设置
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
    </section>
    <!-- /.sidebar -->
</aside>