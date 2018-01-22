<aside class="main-sidebar">
	<section class="sidebar">
		<ul class="sidebar-menu" data-widget="tree">


		  @foreach (Request::get('menus') as $menu)
		  @if (count($menu->menu) > 0 )

			<li class="treeview{{$menu->active? ' active':'' }}">

			<a href="#"><i class="iconfont icon-{{ $menu->icon }}"></i> <span> {{ $menu->display_name }}</span><span class="pull-right-container"><i class="glyphicon glyphicon-menu-left fa-angle-left pull-right"></i></span></a>
			@elseif(!empty($menu->route))

			<li{{$menu->active? ' class=active':'' }}>
			<a href="{{route($menu->route)}}"><i class="iconfont icon-{{ $menu->icon }}"></i> <span> {{ $menu->display_name }}</span><span class="pull-right-container"><i class="fa-angle-left pull-right glyphicon glyphicon-menu-left"></i></span></a>
			@endif

				@if (count($menu->menu) > 0)
				<ul class="treeview-menu">
				    @foreach ($menu->menu as $menu2)
					<li{{$menu2->active? ' class=active':'' }}><a href="{{route($menu2->route)}}"><i class="iconfont icon-{{ $menu2->icon }}"></i> {{$menu2->display_name}}</a></li>
					@endforeach
				</ul>
				@endif
			</li>
		  @endforeach

		</ul>
	</section>
</aside>