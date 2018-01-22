	<aside class="main-sidebar">
				<section class="sidebar">
					<ul class="sidebar-menu" data-widget="tree">
						<li class="{{request()->getPathInfo() == '/admin'? 'active':'' }}">
							<a href="{{route('home')}}"><i class="fa fa-dashboard"></i> <span>首页</span></a>
						</li>
						<li class="treeview  {{ substr(request()->getPathInfo(),0,10) == '/admin/sim' ? 'active' : ''}}">
							<a href="javascript:;"><i class="fa fa-dashboard"></i> <span>SIM卡管理</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
							<ul class="treeview-menu">
								<li class="{{request()->getPathInfo() == '/admin/sim/me'? 'active':'' }}"><a href="{{route('sim.me')}}">我的SIM卡</a></li>
								<li class="{{request()->getPathInfo() == '/admin/sim/customer'? 'active':'' }}"><a href="{{route('sim.customer')}}">客户SIM卡</a></li>
							</ul>
						</li>
						<li class="treeview">
							<a href="javascript:;"><i class="fa fa-dashboard"></i> <span>订单管理</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
							<ul class="treeview-menu">
								<li><a href="{{route('trade.orderlist')}}">采购物联卡</a></li>
								<li><a href="{{route('trade.orderlist')}}">订单列表</a></li>
							</ul>
						</li>
						<li class="treeview">
							<a href="javascript:;"><i class="fa fa-dashboard"></i> <span>客户管理</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
							<ul class="treeview-menu">
								<li class=""><a href="{{route('customer.list')}}">客户列表</a></li>
							</ul>
						</li>
						<li class="treeview">
							<a href="javascript:;"><i class="fa fa-dashboard"></i> <span>暂时不做-充值续费管理</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
							<ul class="treeview-menu">
								<li><a href="{{route('sim.renew')}}">号码续费</a></li>
								<li><a href="{{route('sim.record')}}">续费记录</a></li>
							</ul>
						</li>
						<li class="treeview">
							<a href="javascript:;"><i class="fa fa-dashboard"></i> <span>告警管理</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
							<ul class="treeview-menu">
								<li><a href="{{route('alarm.config')}}">告警设置</a></li>
								<li><a href="{{route('alarm.record')}}">告警记录</a></li>
							</ul>
						</li>
						<li class="treeview">
							<a href="javascript:;"><i class="fa fa-dashboard"></i> <span>短信管理</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
							<ul class="treeview-menu">
								<li><a href="{{route('sms.send')}}">短信收发</a></li>
								<li><a href="{{route('sms.templet')}}">模板编辑</a></li>
							</ul>
						</li>
						<li>
							<a href="{{route('support.debug')}}"><i class="fa fa-dashboard"></i> <span>SIM卡故障报修</span></a>
						</li>
						<li class="treeview">
							<a href="javascript:;"><i class="fa fa-dashboard"></i> <span>系统管理</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>
							<ul class="treeview-menu">
								<li><a href="{{route('sys.import')}}">录入SIM卡</a></li>
								<li><a href="{{route('sys.custom')}}">客户定制</a></li>
								<li><a href="{{route('sys.role')}}">最后再做-角色管理</a></li>
							</ul>
						</li>
					</ul>
				</section>
			</aside>