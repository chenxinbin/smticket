@extends('layouts.material')

@section('title', '概览')

@section('content')
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor">工单列表</h3>
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
                <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="demo-foo-addrow" class="table m-t-30 table-hover no-wrap contact-list" data-page-size="10">
                                            <thead>
                                                <tr>
                                                    <th>ID #</th>
                                                    <th>发起人</th>
                                                    <th>主题</th>
                                                    <th>状态</th>
                                                    <th>分配给</th>
                                                    <th>时间</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1011</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/1.jpg" alt="user" class="img-circle" /> 小乱</a>
                                                    </td>
                                                    <td>How to customize the template?</td>
                                                    <td><span class="label label-warning">New</span> </td>
                                                    <td>Johnathon</td>
                                                    <td>14-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1224</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/2.jpg" alt="user" class="img-circle" /> 小乱</a>
                                                    </td>
                                                    <td>How to change colors</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Salman khan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1024</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/3.jpg" alt="user" class="img-circle" /> 小乱</a>
                                                    </td>
                                                    <td>How to set Horizontal nav</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2124</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user" class="img-circle" /> Raja</a>
                                                    </td>
                                                    <td>How this will connect with bahubali</td>
                                                    <td><span class="label label-inverse">Pending</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3124</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user" class="img-circle" /> Rana</a>
                                                    </td>
                                                    <td>How to set navigation</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1611</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/6.jpg" alt="user" class="img-circle" /> Tony</a>
                                                    </td>
                                                    <td>How to customize the template?</td>
                                                    <td><span class="label label-warning">New</span> </td>
                                                    <td>Johnathon</td>
                                                    <td>14-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4224</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/7.jpg" alt="user" class="img-circle" /> Ritesh</a>
                                                    </td>
                                                    <td>How to change colors</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Salman khan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2524</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/3.jpg" alt="user" class="img-circle" /> Govinda</a>
                                                    </td>
                                                    <td>How to set Horizontal nav</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>7524</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user" class="img-circle" /> Raja</a>
                                                    </td>
                                                    <td>How this will connect with bahubali</td>
                                                    <td><span class="label label-inverse">Pending</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4124</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user" class="img-circle" /> Rana</a>
                                                    </td>
                                                    <td>How to set navigation</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1011</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/8.jpg" alt="user" class="img-circle" /> Deshmukh</a>
                                                    </td>
                                                    <td>How to customize the template?</td>
                                                    <td><span class="label label-warning">New</span> </td>
                                                    <td>Johnathon</td>
                                                    <td>14-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1224</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/7.jpg" alt="user" class="img-circle" /> abraham</a>
                                                    </td>
                                                    <td>How to change colors</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Salman khan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>8024</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/6.jpg" alt="user" class="img-circle" /> adg</a>
                                                    </td>
                                                    <td>How to set Horizontal nav</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>5124</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user" class="img-circle" /> Mauli</a>
                                                    </td>
                                                    <td>How this will connect with bahubali</td>
                                                    <td><span class="label label-inverse">Pending</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3144</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user" class="img-circle" /> Dagubati</a>
                                                    </td>
                                                    <td>How to set navigation</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>1621</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/3.jpg" alt="user" class="img-circle" /> Deshmukh</a>
                                                    </td>
                                                    <td>How to customize the template?</td>
                                                    <td><span class="label label-warning">New</span> </td>
                                                    <td>Johnathon</td>
                                                    <td>14-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4724</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/2.jpg" alt="user" class="img-circle" /> Deshmukh</a>
                                                    </td>
                                                    <td>How to change colors</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Salman khan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2594</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/1.jpg" alt="user" class="img-circle" /> Mauli</a>
                                                    </td>
                                                    <td>How to set Horizontal nav</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>13-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>7524</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/4.jpg" alt="user" class="img-circle" /> Mauli</a>
                                                    </td>
                                                    <td>How this will connect with bahubali</td>
                                                    <td><span class="label label-inverse">Pending</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4124</td>
                                                    <td>
                                                        <a href="javascript:void(0)"><img src="../assets/images/users/5.jpg" alt="user" class="img-circle" /> Dagubati</a>
                                                    </td>
                                                    <td>How to set navigation</td>
                                                    <td><span class="label label-success">Complete</span> </td>
                                                    <td>Hritik Roshan</td>
                                                    <td>12-10-2017</td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-icon btn-pure btn-outline delete-row-btn" data-toggle="tooltip" data-original-title="Delete"><i class="ti-close" aria-hidden="true"></i></button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="2">
                                                        <button type="button" class="btn btn-info btn-rounded" data-toggle="modal" data-target="#add-contact">Add New Contact</button>
                                                    </td>
                                                    <div id="add-contact" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title" id="myModalLabel">Add New Contact</h4>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <from class="form-horizontal form-material">
                                                                        <div class="form-group">
                                                                            <div class="col-md-12 m-b-20">
                                                                                <input type="text" class="form-control" placeholder="Type name"> </div>
                                                                            <div class="col-md-12 m-b-20">
                                                                                <input type="text" class="form-control" placeholder="Email"> </div>
                                                                            <div class="col-md-12 m-b-20">
                                                                                <input type="text" class="form-control" placeholder="Phone"> </div>
                                                                            <div class="col-md-12 m-b-20">
                                                                                <input type="text" class="form-control" placeholder="Designation"> </div>
                                                                            <div class="col-md-12 m-b-20">
                                                                                <input type="text" class="form-control" placeholder="Age"> </div>
                                                                            <div class="col-md-12 m-b-20">
                                                                                <input type="text" class="form-control" placeholder="Date of joining"> </div>
                                                                            <div class="col-md-12 m-b-20">
                                                                                <input type="text" class="form-control" placeholder="Salary"> </div>
                                                                            <div class="col-md-12 m-b-20">
                                                                                <div class="fileupload btn btn-danger btn-rounded waves-effect waves-light"><span><i class="ion-upload m-r-5"></i>Upload Contact Image</span>
                                                                                    <input type="file" class="upload"> </div>
                                                                            </div>
                                                                        </div>
                                                                    </from>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-info waves-effect" data-dismiss="modal">Save</button>
                                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Cancel</button>
                                                                </div>
                                                            </div>
                                                            <!-- /.modal-content -->
                                                        </div>
                                                        <!-- /.modal-dialog -->
                                                    </div>
                                                    <td colspan="6">
                                                        <div class="text-right">
                                                            <ul class="pagination"> </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
@endsection