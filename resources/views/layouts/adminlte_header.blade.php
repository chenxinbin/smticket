<style>
.navbar-right .dropdown-user{right:0;left:auto;width:280px}
.navbar-right .dropdown-user .dw-user-box{padding:15px}
.navbar-right .dropdown-user .dw-user-box .u-img{width:50px;display:inline-block;vertical-align:top}
.navbar-right .dropdown-user .dw-user-box .u-img img{width:100%;border-radius:5px}
.navbar-right .dropdown-user .dw-user-box .u-text{display:inline-block;padding-left:10px}
.navbar-right .dropdown-user .dw-user-box .u-text h4{margin:0}
.navbar-right .dropdown-user .dw-user-box .u-text p{margin-bottom:3px}
.navbar-header .navbar-toggle{float:none;padding:0 15px;line-height:60px;border:0;color:rgba(255,255,255,.5);margin:0;display:inline-block;border-radius:0}.navbar-header .navbar-toggle:focus,.navbar-header .navbar-toggle:hover{background:rgba(0,0,0,.3);color:#fff}
.dropdown>.dropdown-menu>li.divider   {padding: 0;}
</style>
<header class="main-header">
	<a href="javascript:;" class="logo">
		<span class="logo-mini"></span>
		<span class="logo-lg"><img src=".." width="114" height="48" class="img-responsive"></span>
	</a>
	<nav class="navbar navbar-static-top">
		<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"><i class="glyphicon glyphicon-align-justify"></i></a>
		<h4 class="header_title">工单系统</h4>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav navbar-right">
				 <!-- Notifications: style can be found in dropdown.less -->
		          <li class="dropdown notifications-menu">
		            <a href="" class="dropdown-toggle" > <!-- data-toggle="dropdown" -->
		              <i class="iconfont icon-tishi"></i>
		              <!-- <span class="label label-warning">1</span> -->
		            </a>
		            <ul class="dropdown-menu">
		              <li class="header">
		              	<div> 您有<span id="alarmcnt2">0</span>条未读通知</div>
		              </li>
		              <li>
		                <ul class="menu">
		                 <li><a href="#"> 5 new members joined today</a></li>
		                </ul>
		              </li>
		              <li class="footer"><a href="#">全部</a></li>
		            </ul>
		          </li>
				 <!-- User Account: style can be found in dropdown.less -->
				 <li class="dropdown">
		            <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#"> <img src="{{asset('/adminlte')}}/images/nameimg.png" width="23" class="img-circle"><b class="hidden-xs">{{ Auth::user()->name }}</b><span class="caret">&nbsp;&nbsp;</span>&nbsp;&nbsp;</a>
		            <ul class="dropdown-menu dropdown-user animated flipInY">
		                <li>
		                    <div class="dw-user-box">
		                        <div class="u-img"><img src="{{asset('/adminlte')}}/images/nameimg.png" class="img-circle" alt="User Image"></div>
		                        <div class="u-text">
		                            <h4>{{ Auth::user()->name }}</h4>
		                            <p class="text-muted">===</p>
		                            <!-- <a href="profile.html" class="btn btn-rounded btn-danger btn-sm">View Profile</a> -->
		                        </div>
		                    </div>
		                </li>
		                <li role="separator" class="divider"></li>
						<li><a href="#" data-toggle="modal" data-target="#wixinModal"><i class="iconfont icon-weixin"></i>绑定微信</a></li>                           
		                <li role="separator" class="divider"></li>
		                <li ><a href="{{route('user.profile')}}"><i class="iconfont icon-edit"></i> 账户设置</a></li>
		                <li><a href="#" class="guide"><i class="glyphicon glyphicon-question-sign"></i>帮助</a></li>
		                <li role="separator" class="divider"></li>
		                <li><a href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="iconfont icon-tuichu"></i> 退出</a></li>
					</ul>
					<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    	{{ csrf_field() }}
                	</form>
		            <!-- /.dropdown-user -->
		        </li>
			</ul>
		</div>
	</nav>

			
	<!--  弹框1  -->
	<div class="modal fade" id="wixinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
	<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title" id="exampleModalLabel">扫一扫绑定微信</h4>
	</div>
	<div class="modal-body">
		<div >
			<div class="weixin_box text-center" style="width:50%;">
				<img src="" width="150" >
			</div>						
		</div>					
	</div>
	</div>
	</div>
	</div>
	<!--  弹框end  -->



</header>