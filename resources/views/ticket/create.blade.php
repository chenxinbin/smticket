@extends('layouts.material')

@section('title', '概览')

@section('content')
                 <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                        <div class="col-md-5 col-8 align-self-center">
                            <h3 class="text-themecolor m-b-0 m-t-0">新建</h3>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">首页</a></li>
                                <li class="breadcrumb-item active">工单</li>
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
                        <div class="col-lg-12">
                            <div class="card card-outline-info">
                                <div class="card-body">
                                    <form action="#" class="form-horizontal">
                                        <div class="form-body">
                                            <h3 class="box-title">客户信息</h3>
                                            <hr class="m-t-0 m-b-40">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">姓名</label>
                                                        <div class="col-md-8">
                                                            <input type="text" class="form-control" placeholder="John doe">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">来源</label>
                                                        <div class="col-md-8">
                                                            <select class="form-control custom-select">
                                                                <option value="0">请选择</option>
                                                                <option value="1">淘宝店铺</option>
                                                                <option value="2">公众号</option>
                                                                <option value="3">朋友介绍</option>
                                                                <option value="4">电话外呼</option>
                                                                <option value="5">电话来访</option>
                                                                <option value="6">其他</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <!--/row-->
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">公司</label>
                                                        <div class="col-md-8">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">性别</label>
                                                        <div class="col-md-8">
                                                            <select class="form-control custom-select">
                                                                <option value="0">请选择</option>
                                                                <option value="1">男</option>
                                                                <option value="2">女</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <!--/row-->
                                            <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-4">电话</label>
                                                            <div class="col-md-8">
                                                                <input type="text" class="form-control form-control-danger" placeholder="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="control-label text-right col-md-4">微信/QQ</label>
                                                            <div class="col-md-8">
                                                                <input type="text" class="form-control" placeholder="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--/span-->
                                            </div>
                                            <!--/row-->
                                            <div class="form-group row">
                                                    <label class="control-label text-right col-md-2">其他信息</label>
                                                    <div class="col-md-10">
                                                        <input type="text" placeholder="small" class="form-control">
                                                    </div>
                                                </div>
                                            <!--/row-->
                                            <h3 class="box-title">需求信息</h3>
                                            <hr class="m-t-0 m-b-40">
                                             <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">标题</label>
                                                        <div class="col-md-8">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">优先级</label>
                                                        <div class="col-md-8">
                                                                <select class="form-control custom-select">
                                                                    <option value="1">普通</option>
                                                                    </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                           <!--/row-->
                                           <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">类型</label>
                                                        <div class="col-md-8">
                                                                <select class="form-control custom-select">
                                                                        <option value="1">男</option>
                                                                        <option value="2">女</option>
                                                                    </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-4">预算</label>
                                                        <div class="col-md-8">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/row-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-2">关键词</label>
                                                        <div class="col-md-10">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <!--/row-->
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-2">详情</label>
                                                        <div class="col-md-10">
                                                            <textarea name="remark" class="form-control" rows="3" placeholder="写点备注在这里，比如供货方的信息 ..."></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                            </div>
                                            <!--/row-->
                                        </div>
                                        <hr>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-offset-3 col-md-9">
                                                            <button type="submit" class="btn btn-success">Submit</button>
                                                            <button type="button" class="btn btn-inverse">Cancel</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6"> </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->
@endsection