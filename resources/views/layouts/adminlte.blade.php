<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="renderer" content="webkit" />
	<meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title')</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- fonts -->
    <link rel="stylesheet" type="text/css" href="{{asset('fonts/iconfont.css')}}">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="{{asset('/bower_components/bootstrap/dist/css/bootstrap.min.css')}}">
    <!-- Font Awesome -->
    <!-- select2 -->
    <link rel="stylesheet" href="{{asset('/bower_components/select2/dist/css/select2.min.css')}}">
    <!-- daterange picker -->
  	<link rel="stylesheet" href="{{asset('/bower_components/bootstrap-daterangepicker/daterangepicker.css')}}">
     <!-- DataTables -->
  	<link rel="stylesheet" href="{{asset('/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css')}}">
    <!-- AdminLTE Skins. Choose a skin from the css/skinsfolder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="{{asset('/adminlte')}}/dist/css/skins/_all-skins.min.css">
	<!-- morris.css -->
    <link rel="stylesheet" type="text/css" href="{{asset('/bower_components/morris/morris.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('/bower_components/zTree_v3/css/metroStyle/metroStyle.css')}}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{asset('/css/AdminLTE.min.css')}}">
	<link rel="stylesheet" href="{{ asset("css/mhy.css")}}">
	<link rel="stylesheet" href="{{ asset("css/zxh.css")}}">
	<link rel="stylesheet" href="{{ asset("css/cwc.css")}}">	
</head>
<body class="hold-transition skin-deepBlue sidebar-mini">
	<div class="wrapper">
	    @include('layouts.adminlte_header')
	    @include('layouts.adminlte_sidebar2')

	    <div class="content-wrapper">
	    @yield('content')
	    </div>

	    @include('layouts.adminlte_footer')
	</div>
		<!-- jQuery 3 -->

	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- FastClick -->
	<script src="{{asset('/bower_components/fastclick/lib/fastclick.js')}}"></script>
	<!-- AdminLTE App -->
	<script src="{{asset('/js/adminlte.min.js')}}"></script>
	<!-- Sparkline -->
	<!-- <script src="{{asset('/adminlte')}}/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script> -->
	<!-- layer -->
	<script src="{{asset('/bower_components/layer/layer.js')}}"></script>
	<!-- date-range-picker -->
	<script src="{{asset('/bower_components/moment/min/moment.min.js')}}"></script>
	<script src="{{asset('/bower_components/bootstrap-daterangepicker/daterangepicker.js')}}"></script>
	
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- <script src="{{asset('/adminlte')}}/dist/js/pages/dashboard2.js"></script> -->
	<!-- AdminLTE for demo purposes -->
	<!-- <script src="{{asset('/adminlte')}}/dist/js/demo.js"></script> -->
	<!-- select2 -->
	<script src="{{asset('/bower_components/select2/dist/js/select2.full.min.js')}}"></script>
	<!-- DataTables -->
	<script src="https://cdn.bootcss.com/datatables/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.bootcss.com/datatables/1.10.16/js/dataTables.bootstrap.min.js"></script>
	<script src="{{asset('/bower_components/Buttons-1.5.0/js/dataTables.buttons.min.js')}}"></script>
	<script src="https://cdn.bootcss.com/jszip/3.1.5/jszip.min.js"></script>
	<script src="{{asset('/bower_components/Buttons-1.5.0/js/buttons.html5.min.js')}}"></script>
	
	
	<script type="text/javascript" src="{{asset('js/cwc.js')}}"></script>
	@yield('pagejs')
	<script>
		$(function () { $("[data-toggle='popover']").popover();});
	</script>
</body>
</html>