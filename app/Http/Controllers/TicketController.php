<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use DB;
use Validator;

class TicketController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function list()
    {
        return view('ticket/list');
    }

    public function show($ticket_id)
    {
        return view('ticket/show');
    }

    public function create(Request $request)
    {
        //服务目录，优先级
        $topics = DB::table('topics')->pluck('topic', 'id');
        $priorities = DB::table('priorities')->pluck('priority_desc', 'id');

        //提交表单

        if($request->isMethod('post')){
            //
            $validator = Validator::make($request->all(),[
                'package_id'=>'required|min:1',
                'price'=>'required',
                'period_size'=>'required'
            ],[
                'required'=>'请填写:attribute',
                'package_id.required'=>'请选择:attribute',
                'package_id.min'=>'请选择:attribute'
            ],[
                'package_id'=>'套餐',
                'price'=>'价格',
                'period_size'=>'套餐周期'
            ]);
            if ($validator->fails()) {
                return redirect()->route('ticket.create')
                    ->withErrors($validator)
                    ->withInput();
            }

        }




        $data = array(
            'priorities'  => $priorities,
            'topics'    => $topics
        );


        return view('ticket/create',  $data);
    }
}
