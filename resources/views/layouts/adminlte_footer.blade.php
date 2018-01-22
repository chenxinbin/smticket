<!-- Main Footer -->
<footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right" style="position: relative;">

   @if(!Agent::isMobile())
   <a tabindex="0" 
   class="btn" style="padding:3px 10px; position:absolute; top:-10px; right: 0px; " 
   data-toggle="popover" data-trigger="focus"
   data-placement="top" 
   data-html="true" data-content="<img width=200 height=200 src='{{asset('/upload/qrcode/1.png')}}' />" data-original-title="" title="手机扫描访问"><i class="glyphicon glyphicon-qrcode" style="font-size:30px"></i></a>
   @endif
    </div>
    <!-- Default to the left -->
    
    <strong>Copyright &copy; 2017 GGGG .</strong> All rights reserved. 
</footer>