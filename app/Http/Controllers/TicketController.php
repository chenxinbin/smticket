<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

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

    public function create()
    {
        return view('ticket/create');
    }
}
