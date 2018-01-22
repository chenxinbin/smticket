@extends('layouts.material')

@section('title', '概览')

@section('content')
<div class="row page-titles">
        <div class="col-md-5 col-8 align-self-center">
            <h3 class="text-themecolor">概览</h3>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">首页</a></li>
                <li class="breadcrumb-item active">概览</li>
            </ol>
        </div>
        <div class="col-md-7 col-4 align-self-center">
            <div class="d-flex m-t-10 justify-content-end">
                <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                    <div class="chart-text m-r-10">
                        <h6 class="m-b-0"><small>THIS MONTH</small></h6>
                        <h4 class="m-t-0 text-info">$58,356</h4></div>
                    <div class="spark-chart">
                        <div id="monthchart"></div>
                    </div>
                </div>
                <div class="d-flex m-r-20 m-l-10 hidden-md-down">
                    <div class="chart-text m-r-10">
                        <h6 class="m-b-0"><small>LAST MONTH</small></h6>
                        <h4 class="m-t-0 text-primary">$48,356</h4></div>
                    <div class="spark-chart">
                        <div id="lastmonthchart"></div>
                    </div>
                </div>
                <div class="">
                    <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Start Page Content -->
    <!-- ============================================================== -->
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-8 col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex flex-wrap">
                                <div>
                                    <h3 class="card-title">Sales Overview</h3>
                                    <h6 class="card-subtitle">Ample Admin Vs Pixel Admin</h6> </div>
                                <div class="ml-auto">
                                    <ul class="list-inline">
                                        <li>
                                            <h6 class="text-muted text-success"><i class="fa fa-circle font-10 m-r-10 "></i>Ample</h6> </li>
                                        <li>
                                            <h6 class="text-muted  text-info"><i class="fa fa-circle font-10 m-r-10"></i>Pixel</h6> </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="amp-pxl" style="height: 360px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-5">
            <div class="card">
                <div class="card-body">
                    <h3 class="card-title">Our Visitors </h3>
                    <h6 class="card-subtitle">Different Devices Used to Visit</h6>
                    <div id="visitor" style="height:290px; width:100%;"></div>
                </div>
                <div>
                    <hr class="m-t-0 m-b-0">
                </div>
                <div class="card-body text-center ">
                    <ul class="list-inline m-b-0">
                        <li>
                            <h6 class="text-muted text-info"><i class="fa fa-circle font-10 m-r-10 "></i>Mobile</h6> </li>
                        <li>
                            <h6 class="text-muted  text-primary"><i class="fa fa-circle font-10 m-r-10"></i>Desktop</h6> </li>
                        <li>
                            <h6 class="text-muted  text-success"><i class="fa fa-circle font-10 m-r-10"></i>Tablet</h6> </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Row -->
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-4 col-xlg-3 col-md-5">
            <div class="card blog-widget">
                <div class="card-body">
                    <div class="blog-image"><img src="{{asset('/assets/images/big/img1.jpg')}}" alt="img" class="img-responsive"/></div>
                     <h3>Business development new rules for 2017</h3>
                    <label class="label label-rounded label-success">Technology</label>
                    <p class="m-t-20 m-b-20">
                        Lorem ipsum dolor sit amet, this is a consectetur adipisicing elit, sed do eiusmod tempor incididunt ut 
                    </p>
                    <div class="d-flex">
                        <div class="read"><a href="javascript:void(0)" class="link font-medium">Read More</a></div>
                        <div class="ml-auto">
                            <a href="javascript:void(0)" class="link m-r-10 " data-toggle="tooltip" title="Like"><i class="mdi mdi-heart-outline"></i></a> <a href="javascript:void(0)" class="link" data-toggle="tooltip" title="Share"><i class="mdi mdi-share-variant"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-xlg-9 col-md-7">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-wrap">
                        <div>
                            <h3 class="card-title">Newsletter Campaign</h3>
                            <h6 class="card-subtitle">Overview of Newsletter Campaign</h6> 
                        </div>
                        <div class="ml-auto align-self-center">
                            <ul class="list-inline m-b-0">
                                <li>
                                    <h6 class="text-muted text-success"><i class="fa fa-circle font-10 m-r-10 "></i>Open Rate</h6> </li>
                                <li>
                                    <h6 class="text-muted text-info"><i class="fa fa-circle font-10 m-r-10"></i>Recurring Payments</h6> </li>

                            </ul>
                        </div>
                        
                    </div> 
                    <div class="campaign ct-charts"></div>
                    <div class="row text-center">
                        <div class="col-lg-4 col-md-4 m-t-20"><h1 class="m-b-0 font-light">5098</h1><small>Total Sent</small></div>
                        <div class="col-lg-4 col-md-4 m-t-20"><h1 class="m-b-0 font-light">4156</h1><small>Mail Open Rate</small></div>
                        <div class="col-lg-4 col-md-4 m-t-20"><h1 class="m-b-0 font-light">1369</h1><small>Click Rate</small></div>
                    </div>
                </div>
            </div>    
        </div>    
    </div> 
@endsection