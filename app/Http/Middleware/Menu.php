<?php

namespace App\Http\Middleware;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

use Closure;
use Illuminate\Support\Facades\Auth;
use Cache;

class Menu
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {


        //只有登录用户才生成菜单
        if(Auth::guest())
            return $next($request);



        //获取当前路由名
        $route = Route::getRoutes()->match($request);
        $currentroute = $route->getName();
        
        /*
        $actionName = $route->getActionName();
        $segments = explode('@', $actionName);

        $controller = \App::make($segments[0]);
        $middleware = $controller->getMiddleware();
        var_dump($middleware);
        die();
        */

        //忽略掉auth
        if( strpos($route->getActionName(), 'App\Http\Controllers\Auth')!==false)
            return $next($request);


        $pm = Cache::rememberForever("MENU_PERM_ARR3", function() {
            $_pm = [];
            $permissions = DB::table("permissions")->get();
            foreach($permissions as $p)
            {
                $ps = explode(',', $p->routes);
                foreach($ps as $v)
                {
                    $_pm[$v][] = $p->name;
                }
            }
            return $_pm;
        });
        //var_dump($pm);
        //var_dump(Auth::user()->can('dashboard'));
        //die();
        if($currentroute!= null && !Auth::user()->can($pm[$currentroute])) 
        {
            if ($request->ajax()) {
                return response()->json(array('success' => 'Unauthorized'));
            } else {
                abort(403, 'Unauthorized action.');
            }
        }

        if($request->ajax())
            return $next($request);

        //数据库查询菜单名，并设置排序
        $_menus = DB::table('menus')->where('status',1)->orderBy('parent_id')->orderBy('weight')->get();
        $menus = array();
        foreach($_menus as $m)
        {
            //active 是否当前页面的标记
            //如果子菜单为当前页面，父菜单自动设置激活

            $m->active = 0;
            if($m->parent_id==0) {
                $menus[$m->id] = $m;
                $menus[$m->id]->menu = array();
                if($currentroute==$m->route){
                    $m->active = 1;
                }
            }else{
                //判断是否有权限
                if(!Auth::user()->can($m->depend_permission)) continue;

               // die($m->depend_permission);

                if($currentroute==$m->route){
                    $m->active = 1;
                    $menus[$m->parent_id]->active = 1;
                }
                    
                $menus[$m->parent_id]->menu[] = $m;
            }
        }
        //var_dump($menus);
        //die();
        $request->attributes->add(compact('menus'));

        return $next($request);
    }
}
